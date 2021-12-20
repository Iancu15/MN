function [Q, R] = Householder(A)
  [r c] = size(A);
  min = min(r - 1, c);
  H = zeros(r);
  v = zeros(r, 1);
  Q = eye(r);
  R = A;
  
  % calculez oglinda cat timp sunt elemente sub diagonala principala
  for i = 1 : min
    
    % calculez vectorul
    v(1 : (i - 1)) = 0;
    sigma = sign(R(i, i)) * norm(R(i : r, i));
    v(i) = R(i, i) + sigma;
    v(i + 1 : r) = R(i + 1 : r, i);
    
    % oglinda Householder
    H = eye(r) - (2 * v * v') / (v' * v);
    
    % fac eu elementele 0 pentru ca octave imparte prost si iese un e-16
    R = H * R;
    R(i + 1 : r) = 0; 
    
    Q = Q * H;
  endfor
endfunction