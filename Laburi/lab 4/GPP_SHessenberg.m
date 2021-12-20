function [A b] = GPP_SHessenberg(A, b)
  [n n] = size(A);
  for p = 1 : n-1
    pivot=-inf;
    linie_pivot=-1;

    if abs(A(p+1,p)) < abs(A(p,p));
       pivot=abs(A(p,p));
       linie_pivot=p;
    else
       pivot=abs(A(p+1,p));
       linie_pivot=p+1;
    endif
    if p ~= linie_pivot
      for j=p:n
        t=A(p,j);
        A(p,j)=A(linie_pivot,j);
        A(linie_pivot,j)=t;
      endfor
      
      t=b(linie_pivot);
      b(linie_pivot)=b(p);
      b(p)=t;
    endif
    for i = p+1
      if A(p,p) == 0
        continue;
      endif
      
      tp=A(i,p)/A(p,p);
      A(i,p)=0;
      for j=p+1 : n
        A(i,j)=A(i,j)-tp*A(p,j);
      endfor
      b(i)=b(i)-tp*b(p);
    endfor
  endfor
endfunction