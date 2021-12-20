function p3()
  M = dlmread("mat.txt");
  V = size(M)
  dim = V(1)
  mag = magic(dim)
  j=0;
  if(M == mag) j=1
  endif
  z = fliplr(M)
  if(z == mag) j=1
  endif
  sum = sum(M(1,:));
  i=0;
  while i<dim
  endwhile
  disp(j);
endfunction
