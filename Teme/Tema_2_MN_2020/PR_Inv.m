  function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% intai se factorizeaza matricea A in Q si R folosind Gram-Schmidt
  % apoi stiind ca A = QR rezolvam A * A^-1(:. i) = I(:, i) (I matrice unitate)
  % pentru i de la 1 la nr de coloane ale lui A;
  % QR * A^-1(:, i) = I(:, i) => R * A^-1(:, i) = Q' * I(:, i)
  % se inlocuieste Q' * I(:, i) cu vectorul y si apoi ecuatia R * A^-1(:, i) = y
  % se rezolva cu SST pentru fiecare coloana a lui A^-1 (R sup triunghiulara)
  
  [r c] = size(A);
	R = zeros(r, c);
	Q = eye(r);
	for i = 1 : c
    % calculez fiecare coloana din R(pentru i = 1 se face de la 1 : 1, primul
    % element din R, in functie de de Q si A conform ecuatiei Q'A = R
		R(1 : i - 1, i) = Q(:, 1 : i - 1)' * A(:, i);
    
    % calculez noul vector ortogonal in functie de ceilalti vecctori ortonormati
    % din Q si R-ul ce reprezinta fractia de produse scalare a proiectiei
		v = A(:, i) - Q(:, 1 : i - 1) * R(1 : i - 1, i);
    
    % ortonormez vectorul si introduc valoarea pe diagonala lui R
    norm_v = norm(v);
		R(i, i) = norm_v;
		Q(:, i) = v / norm_v;
	endfor
  
  % creez inversa matricii A = B conform explicatiilor de mai sus
  B = zeros(r, c);
  I = eye(r, c);
  for i = 1 : c
    y = Q' * I(:, i);
    B(:, i) = SST(R, y);
  endfor
  
  
  % pun zero-uri unde sunt greseli de calcul
  B(abs(B) < 1e-10) = 0;
endfunction