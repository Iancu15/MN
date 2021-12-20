function [sol] = hsvHistogram(path_to_image, count_bins)
  % aflu R', G' si B'
  img = imread(path_to_image);
  img = cast(img, "double");
  img /= 255;
  R = img(:, :, 1);
  G = img(:, :, 2);
  B = img(:, :, 3);
  
  % aflu Cmax
  aux = max(R, G);
  Cmax = max(aux, B);
  
  % aflu Cmin
  aux = min(R, G);
  Cmin = min(aux, B);
  
  % calculez D
  D = Cmax - Cmin;
  [r c] = size(D);
  
  % introduc peste tot zero-uri in H(nu mai introduc pentru D == 0)
  H = zeros(r, c);
  
  % matrici auxiliare pentru celelalte cazuri
  CazA = (Cmax == R) & (D ~= 0);
  CazB = (Cmax == G) & (D ~= 0);
  CazC = (Cmax == B) & (D ~= 0);
  
  % calcularea nuantei in functie de caz
  H(CazA) = mod((G(CazA) - B(CazA)) ./ D(CazA), 6);
  H(CazB) = ((B(CazB) - R(CazB)) ./ D(CazB)) + 2;
  H(CazC) = ((R(CazC) - G(CazC)) ./ D(CazC)) + 4;
  
  % n-am mai inmultit cu 60 de grade mai sus pentru ca o sa se simplice aici
  H /= 6;
  
  % calculez saturatia
  S = zeros(r, c);
  S(Cmax == 0) = 0;
  S(Cmax ~= 0) = D(Cmax ~= 0) ./ Cmax(Cmax ~= 0);
  
  % valoarea o iau din Cmax
  V = Cmax;
  
  % vectori auxiliari (b pentru nuanta, c pentru restul)
  z = 1 : count_bins - 1;
  b(1 : count_bins - 1) = 1.01 / count_bins;
  
  % calcularea intervalului pentru nuanta
  intervals = b .* z; 
  intervals = [0 intervals 1.01];
  
  % calcularea histogramei pentru H
  bincounts = histc(H, intervals);
  bincounts = bincounts(1 : count_bins, :);
  sol(1 : count_bins) = sum(bincounts');
  
  % calcularea histogramei pentru S
  bincounts = histc(S, intervals);
  bincounts = bincounts(1 : count_bins, :);
  sol(count_bins + 1 : count_bins * 2) = sum(bincounts');
  
  % calcularea histogramei pentru V
  bincounts = histc(V, intervals);
  bincounts = bincounts(1 : count_bins, :);
  sol(count_bins * 2 + 1 : count_bins * 3) = sum(bincounts');
end