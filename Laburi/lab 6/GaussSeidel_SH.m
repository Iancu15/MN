function [x iter] = GaussSeidel_SH(A, b, x0, tol, maxiter)
	% Rezolvarea sistemului Ax=b, unde A este matrice superior Hessenberg folosind metoda Gauss-Seidel
	% Intrari:
	%		A - matrice superior Hessenberg
	%		b - vectorul termenilor liberi
	%		x0 - aproximatia intiala a solutiei
	%		tol - precizia determinarii solutiei
	%		maxiter - numarul maxim de iteratii permis
	% Output:
	%   x - solutia aproximativa a sistemului
	%   iter - numarul de iteratii dupa care metoda converge

	[n n] = size(A);
	x=zeros(n,1);
 
  for iter=1:maxiter
		x(1)=(b(1)-A(1,2:n)*x0(2:n))/A(1,1);
		for i = 2 : n
 			suma=A(i,i-1)*x(i-1)+A(i,i+1:n)*x0(i+1:n);
			x(i)=(b(i)-suma)/A(i,i);
		endfor
		
		if norm(x - x0) < tol
			return;
		endif
	  x0 = x;
	endfor
endfunction