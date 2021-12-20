function [M nodes_num file] = CalculM(nume)
  file = fopen(nume, "r");
  nodes_num = fscanf(file, "%d", 1);
  
  % initializez matricea de adiacenta si matricea diagonala
  A = zeros(nodes_num);
  K = zeros(nodes_num);
  
  for i = 1 : nodes_num
    % sar peste numarul nodului + newline precedent
    fseek(file, 4, 'cof');
    % citesc numarul de vecini ai lui i
    K(i, i) = fscanf(file, "%d", 1);
    
    % parcurg si introduc in matricea de adiacenta 1 pentru fiecare vecin
    for j = 1 : K(i, i)
      vecin = fscanf(file, "%d", 1); 
      
      % pe diagonala principala trebuie sa ramana 0
      % de asemenea nu mai iau in calcul linkurile la sine in matricea K
      if (vecin == i)
        K(i, i)--;
        continue;
      endif
      
      A(i, vecin) = 1;
    endfor
  endfor
  
  % K este diagonala => pot inversa
  % calculez M = (K^-1 * A)'
  M = (inv(K) * A)';
endfunction
