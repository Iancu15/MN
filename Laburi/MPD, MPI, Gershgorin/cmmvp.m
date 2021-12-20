function [lambda y iter] = cmmvp(A, y, maxiter, tol)
  % Functia calculeaza cea mai mica valorea proprie pentru o matrice
  % Testare:
  %   A = [15 -2 2; 1 10 -3; -2 -1 0], y = [1 1 1]'
  %   [lambda yy iter] = cmmvp(A, y, 100, 0.0001)
  % Pentru proba folositi comanda [vecp valp]=eig(A)
  
  [lambda y iter] = mpd(inv(A), y, maxiter, tol);
  lambda = 1/lambda;
endfunction