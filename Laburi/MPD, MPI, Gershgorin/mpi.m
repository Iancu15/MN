function [lambda y iter] = mpi(A, y, miu, maxiter, tol)
	 % Metoda puterii inverse
   % Testare:
   %   A = [15 -2 2; 1 10 -3; -2 -1 0], y = [1 1 1]'
   %   [lambda yy iter] = mpi(A, y, 1, 100, 0.0001)
   %   [lambda yy iter] = mpi(A, y, 12, 100, 0.0001)
   %   [lambda yy iter] = mpi(A, y, 9, 100, 0.0001)
   % Pentru proba folositi comanda [vecp valp]=eig(A)
  [n n] = size(A);

  for iter = 1:maxiter
		% rezolv sistemul liniar (A-lambda*I)*z = y
		C = A-miu*eye(n);
		[B z] = G(C, y);
		z = SST(B, z);
		
    y = z / norm(z);
		lambda = y' * (A) * y;
    
		if norm(A*y-lambda*y) < tol
			break;
		endif
	endfor
endfunction