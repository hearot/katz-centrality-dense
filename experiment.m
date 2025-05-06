% load("94.mat")
% A = matrix94.A;

% load("98.mat")
% A = matrix98.A;

load("995.mat")
A = matrix995.A;

t1 = 0;
it1 = 0;

t2 = 0;
it2 = 0;

t3 = 0;
it3 = 0;

for i = 1:30
    [~, tt1, itt1] = katz_classic(A.matrix, 0.85 / A.rho, 1e-8, 1000);
    t1 = t1 + tt1;
    it1 = it1 + itt1;
end

for i = 1:30
    [~, tt2, itt2] = katz_complement(A.matrix, 0.85 / A.rho, 1e-8, 1000);
    t2 = t2 + tt2;
    it2 = it2 + itt2;
end

for i = 1:30
    [~, tt3, itt3] = katz_complement_no_loops(A.matrix, 0.85 / A.rho, 1e-8, 1000);
    t3 = t3 + tt3;
    it3 = it3 + itt3;
end

t1 = t1 / 30;
t2 = t2 / 30;
t3 = t3 / 30;
it1 = it1 / 30;
it2 = it2 / 30;
it3 = it3 / 30;

fprintf('%-30s %-20s %-25s\n', 'Method', 'Iterations', 'Time (s)');
fprintf('%-30s %7.2f           %25.16e\n', 'katz_classic', it1, t1);
fprintf('%-30s %7.2f           %25.16e\n', 'katz_complement', it2, t2);
fprintf('%-30s %7.2f           %25.16e\n', 'katz_complement_no_loops', it3, t3);
