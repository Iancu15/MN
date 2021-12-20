function [A, b] = G_SHessenberg(A, b)
  [n n] = size(A);
  
  for p = 1 : n-1
    for i = p+1
      if A(p,p)==0
        continue;
      endif
      
      tp = A(i,p)/A(p,p);
      A(i,p)=0;
      for j = p+1 : n
        A(i,j)=A(i,j)-tp*A(p,j);
      endfor
      
      b(i)=b(i)-tp*b(p);
    endfor
  endfor
endfunction