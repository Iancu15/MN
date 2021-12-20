function Problema4()
  A=[1.5 -2.1; -7.6 3.11]
  b=[8.3;6.7]
  y = calcularesistem(A,b);
  z=A*y
  %if isequal(z,b)
    %printf("Sistemul a fost calculat corect!");
  %else printf("Sistemul a fost calculat incorect!");  
  %endif
  %dintr-un motiv sau altul z(1) este egal cu b(1), dar
  %z(2) si b(2) nu sunt, desi in command window se observa
  %ca sunt de fapt identice
endfunction
