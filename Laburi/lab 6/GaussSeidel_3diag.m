function [x iter] = GaussSeidel_3diag(c, a, d, b, x0, tol, maxiter)
	% Rezolvarea sistemului Ax=b, unde A=diag(c,-1)+diag(a)+diag(d,2) folosind metoda Gauss-Seidel
	% Intrari:
	%		c - prima subdiagonala principala
	%		a - diagonala principala
  %		d - a doua supradiagonala principala
	%		b - vectorul termenilor liberi
	%		tol - precizia determinarii solutiei
	%		maxiter - numarul maxim de iteratii permis
	% Output:
	%   x - solutia aproximativa a sistemului
	%   iter - numarul de iteratii dupa care metoda converge

	n=length(a);
	x=zeros(n,1);
  c = [1; c];

  for iter=1:maxiter
    x(1)=(b(1)-d(1)*x0(3))/a(1);
		for i=2:n-2
			x(i)=(b(i)-c(i)*x(i-1)-d(i)*x0(i+2))/a(i);
		endfor
    x(n-1)=(b(n-1)-c(n-1)*x(n-2))/a(n-1);
    x(n)=(b(n)-c(n)*x(n-1))/a(n);
		
		if norm(x - x0) < tol
			return;
		endif
	  x0 = x;
	endfor
endfunction