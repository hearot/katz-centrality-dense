function [r, time] = katz_complement_no_loops(A, alpha)
  n = size(A, 1);
  I = speye(n);
  c = alpha / (1 + alpha);

  B = sparse(~A);
  B(1 : n+1 : end) = 0;

  a = tic;
  M = I + alpha / (1 + alpha) * B;
  tol = 1e-6;
  maxit = 1000;

  [r, ~] = minres(M, ones(n,1), tol, maxit);
  time = toc(a);
end

