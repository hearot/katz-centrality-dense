function [r, time] = katz_classic(A, alpha)
  n = size(A, 1);
  e = ones(n, 1);
  I = eye(n);

  a = tic;
  M = I - alpha * A;
  tol = 1e-6;
  maxit = 1000;

  [r, ~] = minres(M, ones(n,1), tol, maxit);
  time = toc(a);
endfunction
