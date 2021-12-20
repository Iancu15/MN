function x = G_Sistem(A,b)
  [R r] = G(A,b);
  x = SST(R,r);
endfunction
