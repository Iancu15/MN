function F = evaluare_F(x)
	%	Fie sistemul : 	x1 + 2*x2 - 2 = 0 
	%	                x1^2 + 4*x2^2 - 4 = 0
 		
  F=zeros(2,1);  
	F(1) = x(1) + 2*x(2)+-2;
	F(2) = x(1)^2 + 4*x(2)^2 - 4;
endfunction