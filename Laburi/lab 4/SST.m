function x = SST(A,b)
  [n n] = size(A);
  x=zeros(n,1);
  for i=n:-1:1
    x(i)=(b(i)-A(i, i+1:n)*x(i+1:n))/A(i,i);
    printf("%d\n",x(i));
  endfor
endfunction
