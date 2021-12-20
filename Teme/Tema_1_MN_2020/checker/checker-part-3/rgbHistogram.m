function [sol] = rgbHistogram(path_to_image, count_bins)
  % initializari
  img = imread(path_to_image);
  periods = zeros(1, count_bins + 1);
  sol = zeros(1, count_bins * 3);
  
  % vectori auxiliari
  z = 1 : count_bins - 1;
  b(1 : count_bins - 1) = 256 / count_bins;
  
  % calcularea intervalului folosindu-ma de vectorii auxiliari
  intervals = b .* z;
  intervals = [0 intervals 256];
  
  % calcularea histogramei de la R la B
  for i = 1 : 3
    bincounts = histc(img(:, :, i), intervals);
    bincounts = bincounts(1 : count_bins, :);
    sol(1 + count_bins * (i - 1) : count_bins * i) = sum(bincounts');
  endfor  
end