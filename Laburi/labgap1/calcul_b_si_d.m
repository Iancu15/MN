function [b d] = calcul_b_si_d(c, a, x)
  % se poate face pt orice n cu niste modificari
  for i = 1 : 3
    z = x(i + 1) - x(i);
    d(i) = (c(i + 1) - c(i)) / (3 * z);
    b(i) = (a(i + 1) - a(i)) / z - z * (2 * c(i) + c(i + 1))/3;
  endfor
  
  % pt dublu derivata egala cu 0 si derivata egala cu 0
  d(4) = (-2 * c(4)) / (6 * (x(5) - x(4)));
  b(4) = -2 * c(4) * (x(5) - x(4)) - 3 * d(4) * (x(5) - x(4))^2;
endfunction
