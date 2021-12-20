function [valp iter] = QR_b2_deplasare(A, maxiter, tol)
  % matrice de test: A = [3 1 0; 1 3 1; 0 1 3]
  % proba: eig(A)
  % pentru a calcula vectorii proprii pentru matricea A, cunoscand valorile proprii, putem aplica functia mpi
	[n n] = size(A);
	i = 1;
	iter = maxiter;
  
	for iter = 1 : maxiter
    % E retine coeficientii unui polinom caracteristic de gradul 2
		E = [1, -A(n,n)-A(n-1,n-1), A(n,n)*A(n-1,n-1) - (A(n,n-1)^2)];
    % aflam radacinile lui E
		lambda = roots(E);
		
		if n == 2 
			valp(1) = lambda(1);
			valp(2) = lambda(2);
			break;
		endif

		% determinam valoarea proprie cea mai apropiata de A(n,n)
		if abs(lambda(1) - A(n,n)) >= abs(lambda(2) - A(n,n))
			miu(i) = lambda(2);
		else
			miu(i) = lambda(1);
		endif
		
		% factorizam Givens matricea A - miu(i) * eye(n)
    [g g] = size(A - miu(i) * eye(n));
    b = rand(g, 1);
		[Q R] = givens(A - miu(i) * eye(n), b);

		% calculam matricea noua
		A = R * Q + miu(i) * eye(n);
		
		if abs(A(1, 2)) < tol
			valp(n) = A(1, 1);
			
			% calculam matricea redusa
			A = A(2:n, 2:n);
			n--;
		endif	
  	i++;
	endfor
endfunction