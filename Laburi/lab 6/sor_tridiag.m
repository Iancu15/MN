function [x iter] = sor_tridiag(c, a, d, b, x0, w, tol, maxiter)
  %pt matricea A
  %35    1    0    0    0
  %10   36    2    0    0
  %0   11   37    3    0
  %0    0   12   38    4
  %0    0    0   13   39
  %si b=[1 2 3 4 5]
  %omega ideal este 1 pt matricea de mai sus=>GaussSeidel este ideal
  %unde pentru GaussSeidel am 5 iteratii, pentru SOR cu omega 0.9 am 7 iteratii
  %si pentru SOR cu 1.1 am 6 iteratii
  n = length(a);
	x=zeros(n,1);
  c = [1; c];

  for iter=1:maxiter
    x(1)=(b(1)-d(1)*x0(2))/a(1);
		x(1)=w*x(1)+(1-w)*x0(1);
    for i=2:n-1
			x(i)=(b(i)-c(i)*x(i-1)-d(i)*x0(i+1))/a(i);
      x(i)=w*x(i)+(1-w)*x0(i);
    endfor
    
    x(n)=(b(n)-c(n)*x(n-1))/a(n);
	  x(n)=w*x(n)+(1-w)*x0(n);
    
    if norm(x - x0) < tol
			return;
		endif
	  x0 = x;
	endfor
endfunction
