function [lambda y iter] = mpd(A, y, maxiter, tol)
  % Metoda puterii directe
  % Testare:
  %   A = [15 -2 2; 1 10 -3; -2 -1 0], y = [1 1 1]'
  %   [lambda yy iter] = mpd(A, y, 100, 0.0001)
  % Pentru proba folositi comanda [vecp valp]=eig(A)
  
  for iter = 1:maxiter
    z = A * y;
    y = z / norm(z);
    lambda = y' * A * y;
		
		if norm(A*y-lambda*y) < tol
			break;
		endif
	endfor
endfunction