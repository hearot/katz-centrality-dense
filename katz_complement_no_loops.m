function [r, time] = katz_complement_no_loops(A, alpha, tol, maxit)
  n = size(A, 1);
  I = speye(n);

  B = sparse(~A);
  B(1 : n+1 : end) = 0;

  a = tic;
  [r, ~] = minres(I + alpha / (1 + alpha) * B, ones(n,1), tol, maxit);
  time = toc(a);
end

