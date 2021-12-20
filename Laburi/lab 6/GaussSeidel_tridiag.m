function [x iter] = GaussSeidel_tridiag(c, a, d, b, x0, tol, maxiter)
	n=length(a);
	x=zeros(n,1);
  c = [1; c];

  for iter=1:maxiter
    x(1)=(b(1)-d(1)*x0(2))/a(1);
		for i=2:n-1
			x(i)=(b(i)-c(i)*x(i-1)-d(i)*x0(i+1))/a(i);
		endfor
    x(n)=(b(n)-c(n)*x(n-1))/a(n);
		if norm(x - x0) < tol
			return;
		endif
	  x0 = x;
	endfor
endfunction