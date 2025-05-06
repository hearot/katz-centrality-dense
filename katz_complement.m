function [r, time, it] = katz_complement(A, alpha, tol, maxit)
  n = size(A, 1);
  I = speye(n);

  B = sparse(~A);

  a = tic;
  [r, ~, ~, it] = minres(I + alpha * B, ones(n,1), tol, maxit);
  time = toc(a);
end
