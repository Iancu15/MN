function x = Thomas(a,b,c,d)
  n=length(d);
  a = [0; a];
  c(1) = c(1)/b(1);
  d(1) = d(1)/b(1);
  
  for i = 2 : n-1
    temp=b(i)-a(i)*c(i-1);
    c(i)=c(i)/temp;
    d(i)=(d(i)-a(i)*d(i-1))/temp;
  endfor
  d(n)=(d(n)-a(n)*d(n-1))/(b(n)-a(n)*c(n-1));
  
  x(n)=d(n);
  for i = n-1 : -1 : 1
    x(i)=d(i)-c(i)*x(i+1);
  endfor
endfunction
