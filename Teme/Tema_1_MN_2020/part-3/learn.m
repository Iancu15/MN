function [w] = learn(X, y)
  [r c] = size(X);
  X(:, c + 1) = 1;
  w = zeros(1, c + 1);
  
  [Q R] = Householder(X);
  
  % y este linie, am nevoie de coloana
  y = Q' * y';
  w = SST(R, y);
end
