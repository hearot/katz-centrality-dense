function [r, time] = katz_classic(A, alpha, tol, maxit)
  n = size(A, 1);
  I = eye(n);

  a = tic;
  [r, ~] = minres(I - alpha * A, ones(n,1), tol, maxit);
  time = toc(a);
end
