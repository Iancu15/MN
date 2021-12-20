function [x iter] = bisectie(f, a, b, tol)
	%	Calculare solutie ecuatie neliniara folosind  metoda bisectiei
	%	Fie ecuatia neliniara x^6-x-1=0 
  % Exemplu de rulare x = bisectie(@f, 1, 2, 0.0001)
	% Pentru proba rulati comanda: fsolve ("f", 2)
	iter = 1;
  
	if f(a) * f(b) > 0
		error('Ecuatia nu are radacina in intervalul [%d, %d]\n', a, b);
	endif
  
  x = a + (b-a)/2;
	while abs(f(x))>tol && abs(b-a)>tol
    iter++;
		if f(a) * f(x) < 0
			b = x;
		else
			a = x;
		endif
		x = a + (b-a)/2;
	endwhile
endfunction