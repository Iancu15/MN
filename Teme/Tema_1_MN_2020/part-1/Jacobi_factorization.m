function [G_J, c_J] = Jacobi_factorization(A, b)
  N = diag(diag(A));
  P = N - A;
  N_inv = inv(N);
  
  G_J = N_inv * P;
  c_J = N_inv * b;
endfunction
