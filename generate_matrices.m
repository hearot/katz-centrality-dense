n = 15000;
density = 0.97;

% garantisce la densita' di A
Am = double(rand(n) < density);

% forza la simmetria ed elimina i loop su A
Am = triu(Am, 1);
Am = Am + Am';

A = struct();

A.matrix = Am;

% calcola il raggio spettrale per riutilizzarlo
% nel parametro di Katz
A.rho = svds(Am, 1);

save('A.mat', 'A', '-v7.3');
