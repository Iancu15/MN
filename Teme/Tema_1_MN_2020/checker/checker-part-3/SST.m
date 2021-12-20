function [x] = SST(A, b)
  [r c] = size(A);
  D = A(1 : c, :);
  x = zeros(c, 1);
  j = c;
  while max(D(c, :)) < 1e-10
    c--;
  endwhile
  
  for i = c : -1 : 1
    x(i) = (b(i) - D(i, i + 1 : c) * x(i + 1 : c)) / D(i, i);
  endfor
end
    