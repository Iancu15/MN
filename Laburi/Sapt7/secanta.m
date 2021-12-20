function [x iter] = secanta(f, a, b, tol)
	%	Calculare solutie ecuatie neliniara folosind  metoda secantei
	%	Fie ecuatia neliniara x^6-x-1=0 
  % Exemplu de rulare x = secanta(@f, 1, 2, 0.0001)
	% Pentru proba rulati comanda: fsolve ("f", 2)
	iter = 1;
   
  if f(a) * f(b) > 0
		error('Ecuatia nu are radacina in intervalul [%d, %d]\n', a, b);
	endif
	
  x = a -(f(a)*(b-a))/(f(b)-f(a));
	while abs(f(x))>tol && abs(b-a)>tol
		iter++;
		if f(a) * f(x) < 0
			b = x;
		else
			a = x;
		endif
    x = a -(f(a)*(b-a))/(f(b)-f(a));
	endwhile
 endfunction