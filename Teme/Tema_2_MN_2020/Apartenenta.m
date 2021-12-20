function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  % functia u(x) trebuie sa fie continua => a*x + b este egal cu 0 pt x = val1
  % si egal cu 1 pt x = val2
  % rezolvam sistemul de ecuatii si rezulta a = 1/(val2 - val1) si b poate fi
  % scos din oricare dintre cele 2 ecuatii Ex: b = -a*val1
  a = 1 / (val2 - val1);
  b = -a * val1;
  
  % in functie de caz am un alt y
    if (x >= 0 && x < val1)
      y = 0;
    endif
    
    if (x >= val1 && x <= val2)
      y = a * x + b;
    endif
    
    if (x > val2 && x <= 1)
      y = 1;
    endif
endfunction	