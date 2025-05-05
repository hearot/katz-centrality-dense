function generate_dense_graph(filename, n, density)
    % garantisce che la densita' di A
    % sia circa quella stabilita in
    % `density`
    Am = double(rand(n) < density);
    
    % forza la simmetria ed elimina i loop su A
    Am = triu(Am, 1);
    Am = Am + Am';
    
    A = struct();
    
    A.matrix = Am;
    
    % calcola il raggio spettrale per riutilizzarlo
    % nel parametro di Katz
    A.rho = svds(Am, 1);
    
    % calcola la densita' di A
    A.density = nnz(Am) / numel(Am);
    
    save(filename, 'A', '-v7.3');
end