n = 4000;
density = 0.97;

% si assicura la densita' di A e B
Am = double(rand(n) < density);
Bm = double(rand(n) < density);

% forza la simmetria ed elimina i loop su A
Am = triu(Am, 1);
Am = Am + Am';

% forza la simmetria, ma non elimina i loop su B
Dm = diag(diag(Bm));
Bm = triu(Bm, 1);
Bm = Bm + Bm' + Dm;

A = struct();
B = struct();

A.matrix = Am;
B.matrix = Am;

A.rho = svds(Am, 1);
B.rho = svds(Bm, 1);

save("A.mat", "A")
save("B.mat", "B")

