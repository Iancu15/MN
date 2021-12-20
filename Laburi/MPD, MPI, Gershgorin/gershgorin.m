function gershgorin(A)
  % Functia afiseaza cercurile gershgorin
  % Testati pentru matricile
  %   A=[1 2; 1 -1];
  %   A=[1 -1; 2 -1];
  %   A=[5 0 0 -1; 1 0 -1 1; -1.5 1 -2 1; -1 1 3 -3]
  [n n]=size(A);
  
  hold on;
  grid()
  
  for i=1:n
    cerc(A(i,i), 0, sum(abs(A(i,1:i-1))) + sum(abs(A(i,i+1:n))));
  endfor
  
  [vecp valp]=eig(A)
  for i=1:n
    vp=valp(i,i);
    plot(real(vp), imag(vp), 'MarkerSize', 30);
  end
  hold off;
endfunction