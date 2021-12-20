function [valp iter] = QR_b2(A, maxiter, tol)
  % matrice de test: A = [3 1 0; 1 3 1; 0 1 3]
  % proba: eig(A)
  % pentru a calcula vectorii proprii pentru matricea A, cunoscand valorile proprii, putem aplica functia mpi
	[n n] = size(A);
	iter = maxiter;

	for iter = 1 : maxiter
		% factorizam Givens matricea A
    b = rand(n, 1);
		[Q R] = givens(A, b);
		% calculam matricea noua
		A = R * Q;
		
		if abs(A(1, 2)) < tol
			valp(n) = A(1, 1);
			
			% calculam matricea redusa
			A = A(2 : n, 2 : n);
			n--;
		endif	
		
		if n == 1 
			valp(n) = A(n, n);
			break;
		endif	
	endfor
endfunction