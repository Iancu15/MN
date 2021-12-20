function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  len_c = length(c);
  prev_x = zeros(len_c, 1);
  x = zeros(len_c, 1);

  err = tol + 1;
  while(err > tol)
    x = csr_multiplication(G_values', G_colind', G_rowptr', prev_x) + c;
    err = norm(x - prev_x);
    prev_x = x;
  endwhile
endfunction 