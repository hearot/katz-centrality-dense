import yfinance as yf
import numpy as np
import scipy.io
import pandas as pd
import os

WIKIPEDIA_LINK = "https://en.wikipedia.org/w/index.php?title=List_of_S%26P_500_companies&oldid=1130173030"

CACHE_FILE = "sp_500_prices_2022_2023.csv"
REMOVED = ['ATVI', 'DISH', 'PXD', 'FLT', 'WRK', 'ABC', 'SIVB',
           'CDAY', 'CTLT', 'FRC', 'PEAK', 'RE', 'FISV', 'MRO', 'PKI', 'SBNY']


def fetch_sp500_tickers():
    print("Fetching S&P 500 companies from Wikipedia...")
    table = pd.read_html(WIKIPEDIA_LINK)
    tickers = table[0]['Symbol'].tolist()
    tickers = [ticker.replace('.', '-') for ticker in tickers]
    tickers = [ticker for ticker in tickers if ticker not in REMOVED]
    return tickers


def download_data(tickers, start="2022-01-01", end="2023-01-01"):
    if os.path.exists(CACHE_FILE):
        print("Loading cached data...")
        data = pd.read_csv(CACHE_FILE, index_col=0, parse_dates=True)
    else:
        print(f"Downloading {len(tickers)} tickers...")
        data = yf.download(tickers, start=start, end=end,
                           progress=False, auto_adjust=True)['Close']
        print(f"Downloaded data shape: {data.shape}")
        data.to_csv(CACHE_FILE)
        print(f"Saved data to {CACHE_FILE}")
    return data


def build_dense_adjacency(data, fill_value=0.99):
    data = data.dropna(axis=1, thresh=int(0.9 * len(data)))
    returns = data.pct_change().dropna()
    corr_matrix = returns.corr().values

    corr_matrix = np.nan_to_num(corr_matrix, nan=fill_value)

    threshold = 0.2
    adj_matrix = (corr_matrix > threshold).astype(int)

    return adj_matrix


def export_to_mat(matrix, filename):
    matrix = np.array(matrix, dtype=np.float64)  # ensure matrix is double
    spectral_radius = np.float64(
        max(abs(np.linalg.eigvals(matrix))))  # ensure rho is double

    mat_struct = {
        "A": {
            "matrix": matrix,
            "rho": spectral_radius
        }
    }
    scipy.io.savemat(filename, mat_struct)
    print(
        f"Matrix and spectral radius (={spectral_radius}) saved to {filename}")


if __name__ == "__main__":
    tickers = fetch_sp500_tickers()

    print("Downloading data...")
    data = download_data(tickers)
    print("Computing adjacency matrix...")
    matrix = build_dense_adjacency(data)
    print(
        f"Matrix size: {matrix.shape}, Density: {np.count_nonzero(matrix) / matrix.size:.2f}")
    export_to_mat(matrix, "sp_500_2022_2023.mat")
