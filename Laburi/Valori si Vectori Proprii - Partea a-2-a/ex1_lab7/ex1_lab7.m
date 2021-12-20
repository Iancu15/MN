function [valp vecp] = ex1_lab7(b, a, c, maxIter, tol)
	% b - subdiagonala
	% a - diagonala principala
	% c - supradiagonala
	% valp - vector de valori proprii
	% vecp - matrice continand in fiecare coloana cate un vector propriu
	
	%%% Matrice de test
	% b=[1 1 1 1 1]'
	% c=[1 1 1 1 1]'
	% a=[2 2 2 2 2 2]'
  
  %%% Proba [vecp valp] = eig(A)
  A = diag(a) + diag(c,-1) + diag(b,1);
  b = [0; b];
  c = [c; 0];
	n = length(a);

	P = polinom_caracteristic(b, a, c, n);
  valp = roots(P);
  nr_val = length(valp);
  
  vecp = zeros(n, n);
  
  for i = 1 : nr_val
    % in functie de vectorul initial se schimba semne din vectorul propriu 
    % rezultat
    y = rand(n, 1);
    [lamda true_y] = mpi(A, y, valp(i), maxIter, tol);
    
    valp(i) = lamda;
    vecp(:, i) = true_y;
  endfor
  
  % TODO
  % - valorile proprii se calculeaza ca fiind radacinile polinomului P. Folositi functia roots.
  % - formati matricea A
  % - pentru fiecare valoarea proprie apelati functia mpi pentru a calcula vectorul propriu 

endfunction