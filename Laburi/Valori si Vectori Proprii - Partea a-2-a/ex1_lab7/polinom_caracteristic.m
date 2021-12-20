function P = polinom_caracteristic(b, a, c, n)
	P0 = [1];
  P1 = [1 -a(1)];
    
	C0 = @(n)([-b(n)*c(n-1)]); % C0 este o functie anonima de parametru n
	C1 = @(n)([1 -a(n)]); % C1 este o functie anonima de parametru n
  % O functie anonima se numeste asa pentru ca nu se cunoaste numele functie, C0/C1 sunt variabile care retin adresa functiei si nu
  % numele functiei.
  % O functie anonima incepe tot timpul cu @, apoi urmeaza intre paranteze rotunde argumentele functiei (pot fi oricate argumente).
  % Functia anonima contine intotdeauna O SINGURA instructiune.
  
  if n == 0
    P = P0;
  endif

  if n == 1
    P = P1;
  endif
  
	% Calculam coeficientii polinomului caracteristic
	for i = 2 : n
		Paux0 = conv(P0, C0(i));
		Paux1 = conv(P1, C1(i));
		
		% Adunanam vectorii Paux0 + Paux1. Daca length(Paux0) diferita de length(Paux1), nu putem sa adunam direct cei doi vectori
    % pentru ca nu putem aduna doi vectori (rezultatele lui conv) de dimensiuni diferite. 
    m = length(Paux0);
		n = length(Paux1);
		r = max(m, n);
		
		% In consecinta, se introduc zerouri la inceputul vectorului de dimensiune mai mica.
		Paux0(r-m+1:r) = Paux0(1:m);
		Paux0(1:r-m) = zeros(1, r-m);

		Paux1(r-n+1:r) = Paux1(1:n);
		Paux1(1:r-n) = zeros(1, r-n);
		
		Paux = Paux0 + Paux1;
		
		P0 = P1;
		P1 = Paux;
	endfor
	
	P = P1;
endfunction