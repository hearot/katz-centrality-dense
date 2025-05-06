function [r, time, it] = katz_classic(A, alpha, tol, maxit)
  n = size(A, 1);
  I = eye(n);

  a = tic;
  [r, ~, ~, it] = minres(I - alpha * A, ones(n,1), tol, maxit);
  time = toc(a);
end
