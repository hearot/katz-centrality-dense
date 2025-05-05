function [r, time] = katz_complement(A, alpha, tol, maxit)
  n = size(A, 1);
  I = speye(n);

  B = sparse(~A);

  a = tic;
  [r, ~] = minres(I + alpha * B, ones(n,1), tol, maxit);
  time = toc(a);
end
