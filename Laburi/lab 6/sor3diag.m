function [x iter] = sor_tridiag(c, a, d, b, x0, w, tol, maxiter)
	% Rezolvarea sistemului Ax=b, unde A=diag(c,-1)+diag(a)+diag(d,2) folosind metoda suprarelaxarii
	% Input:
	%		c - prima subdiagonala principala
	%		a - diagonala principala
  %		d - a doua supradiagonala principala
	%   x - aproximarea intiala a solutiei
	%   b - vectorul termenilor liberi
	%   w - parametru cu valori in (0,2)
	%		tol - precizia determinarii solutiei
	%   maxiter - numarul maxim de iteratii
	% Output:
	%   x - solutia aproximativa a sistemului
	%   iter - numarul de iteratii dupa care metoda converge
 
  n = length(a);
	x=zeros(n,1);
  c = [1; c];

  for iter=1:maxiter
    x(1)=(b(1)-d(1)*x0(3))/a(1);
		x(1)=w*x(1)+(1-w)*x0(1);
    for i=2:n-2
			x(i)=(b(i)-c(i)*x(i-1)-d(i)*x0(i+2))/a(i);
      x(i)=w*x(i)+(1-w)*x0(i);
    endfor
    x(n-1)=(b(n-1)-c(n-1)*x(n-2))/a(n-1);
    x(n-1)=w*x(n-1)+(1-w)*x0(n-1);
    
    x(n)=(b(n)-c(n)*x(n-1))/a(n);
	  x(n)=w*x(n)+(1-w)*x0(n);
    
    if norm(x - x0) < tol
			return;
		endif
	  x0 = x;
	endfor
endfunction
