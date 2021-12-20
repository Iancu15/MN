function p2()
  var=input('Introduceti variabila:')
  i=1;
  j=0;
  for i=1:2:(var-1)
   j=j+i;
  endfor
  disp(j);
  i=1;
  j=0;
  while i<=var-1
    j=j+i;
    i=i+2;
  endwhile
  disp(j);
endfunction
