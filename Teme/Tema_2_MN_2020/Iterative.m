function [R nodes_num file] = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  
  % calculez M folosind functia auxiliara
  % returnez nodes_num pentru a folosi in formula si file pentru a folosi
  % in PageRank la citirea de val1 si val2
  [M nodes_num file] = CalculM(nume);
  
  % initializez cu 1/nodes_num elementele din vectorul R
  R_prev = zeros(nodes_num, 1);
  R = zeros(nodes_num, 1);
  R(:) = 1 / nodes_num;
  one = ones(nodes_num, 1);
  
  % cat timp eroarea e prea mare recalculez R conform formulei matriceale
  while(norm(R - R_prev) > eps)
    R_prev = R;
    R = d * M * R + ((1 - d) / nodes_num) * one;
  endwhile
  
  % penultima valoarea e cea mai exacta
  R = R_prev;
endfunction