function [w] = learn(X, y, lr, epochs)
  [r c] = size(X);
  % w format din valori random intre -0.1 si 0.1
  w = 0.2 * rand(c + 1, 1) - 0.1;
  Xb = zeros(64, c + 1);
  yb = zeros(64, 1);
  
  % scalez coloanelele
  X = (X - mean(X)) ./ std(X);
  X(1 : r, c + 1) = 1;
  
  for epoch = 1 : epochs
    % iau un vector cu indexi aleatorii intre 1 si r(nr de imagini)
    % si imaginile pentru batch for fi cele reprezentate de indexi
    batch_index = cast((r - 1) * rand(1, 64), "uint32") + 1;
    Xb = X(batch_index, :);
    yb = y(batch_index);
    
    % fac suma separat, apoi calculez w intreg(nu pe componente)
    sums = (Xb * w - yb')' * Xb;
    w = w - (lr/r) * sums';
  endfor
endfunction