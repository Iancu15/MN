function [x iter] = NewtonRaphson_sistem(x0, tol, maxiter)
	%	Rezolvare sistem de ecuatii neliniare folosind  metoda Newton-Raphson
	%	Fie sistemul : 	x1 + 2*x2 - 2 = 0 
	%	                x1^2 + 4*x2^2 - 4 = 0
  % Exemplu de rulare [x iter] = NewtonRaphson_sistem([1 2]', 0.0001, 100)
	% Pentru proba rulati comanda: fsolve ("evaluare_F", [1 2]')
	
  for iter = 1:maxiter
		J = matrice_jacobiana(x0);
		F_x = (-1) * evaluare_F(x0);
		
		[J  F_x] = G(J, F_x);
		delta_x0 = SST(J, F_x);
		
		x = delta_x0 + x0;
		if norm(x - x0) < tol
			return;
		endif
		
		x0 = x;
	endfor
endfunction