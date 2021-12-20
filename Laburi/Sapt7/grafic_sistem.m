function grafic_sistem()
	%	Fie sistemul : 	x1 + 2*x2 - 2 = 0 
	%	                x1^2 + 4*x2^2 - 4 = 0
f1= @(x1, x2) x1 + 2.*x2 - 2;
f2= @(x1, x2) x1.^2 + 4.*x2.^2 - 4;
  
j = -100:1:100;
hold on;
plot(f1(j,j+5), 'r');
plot(f2(j,j),  'b');
grid
hold off;
  
endfunction