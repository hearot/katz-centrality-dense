function [r, time] = katz_complement(A, alpha)
  n = size(A, 1);
  I = speye(n);
  c = alpha / (1 + alpha);

  B = sparse(~A);

  a = tic;
  M = I + alpha * B;
  tol = 1e-6;
  maxit = 1000;

  [r, ~] = minres(M, ones(n,1), tol, maxit);
  time = toc(a);
endfunction
