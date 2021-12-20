  function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  % calculez matricea M
  [M nodes_num] = CalculM(nume);
  
  % aplic formula si calculez invers folosind functia auxiliara PR_Inv
  one = ones(nodes_num, 1);
  R = PR_Inv(eye(nodes_num) - d * M) * ((1 - d) / nodes_num) * one;
endfunction	