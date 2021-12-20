function [x iter] = NewtonRaphson_ecuatie(f, df, x0, tol, maxiter)
	%	Calculare solutie ecuatie neliniara folosind  metoda Newton-Raphson
	%	Fie ecuatia neliniara x^6-x-1=0 
  % Exemplu de rulare [x iter] = NewtonRaphson_ecuatie(@f, @derivata_f, 2, 0.0001, 100)
	% Pentru proba rulati comanda: fsolve ("f", 2)
	 
  for iter = 1:maxiter
    x = x0 - f(x0)/df(x0);
		
		if abs(x - x0) < tol
			return;
		endif
		
		x0 = x;
	endfor
endfunction