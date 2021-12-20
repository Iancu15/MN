function J = matrice_jacobiana(x)
	%	Fie sistemul : 	x1 + 2*x2 - 2 = 0 
	%	                x1^2 + 4*x2^2 - 4 = 0
 	
	df1_x1 = 1;
	df1_x2 = 2;
	df2_x1 = 2*x(1);
	df2_x2 = 8*x(2);
	J = [df1_x1 df1_x2; df2_x1 df2_x2];
endfunction