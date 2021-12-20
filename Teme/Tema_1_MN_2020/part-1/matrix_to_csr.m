function [values, colind, rowptr] = matrix_to_csr(A)
  values = zeros(0);
  colind = zeros(0);
  
  % adaug un zero pentru a valida conditia din else si pentru ca are un element
  % in plus la final, numarul de elemente nenule
  rowptr = zeros(1);
 
  % in nz stochez numarul de elemente nenule
  nz = 0;
  n = length(A);

  for i = 1 : n
    for j = 1 : n
      if(A(i, j) == 0)
        continue;

     else
        nz++;

        if(rowptr(i) == 0)
          rowptr(i) = nz; 
          rowptr = [rowptr 0];
        endif

        values = [values A(i, j)];
        colind = [colind j];
     endif
    endfor
  endfor

  rowptr(n + 1) = nz + 1;
endfunction