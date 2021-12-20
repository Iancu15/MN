##  % initializari
##  img = imread(path_to_image);
##  periods = zeros(1, count_bins + 1);
##  sol = zeros(1, count_bins * 3);
##  
##  % vectori auxiliari
##  z = 1 : count_bins - 1;
##  b(1 : count_bins - 1) = 256 / count_bins;
##  
##  % calcularea intervalului folosindu-ma de vectorii auxiliari
##  intervals = b .* z;
##  intervals = [0 intervals 256];
##  
##  % calcularea histogramei de la R la B
##  for i = 1 : 3
##    bincounts = histc(img(:, :, i), intervals);
##    bincounts = bincounts(1 : count_bins, :);
##    sol(1 + count_bins * (i - 1) : count_bins * i) = sum(bincounts');
##  endfor  
function [sol] = rgbHistogram(path_to_image, count_bins)
  
  imagine=imread(path_to_image);
  interval=linspace(0,256,count_bins + 1)
  

  rosu=histc(imagine(:,:,1),interval);
  verde=histc(imagine(:,:,2),interval);
  albastru=hist(imagine(:,:,3),interval);
  
  randuri=rows(albastru);
  coloane=columns(rosu);
  sol=zeros(1,count_bins*3);
  for i = 1 : count_bins
    for j = 1 : coloane 
      sol(i)+=rosu(i,j);
    endfor
  endfor
  coloane=columns(verde)-1;
  for i = (count_bins+1) : 2*count_bins
    for j = 1 : coloane 
      sol(i)+=verde(i-count_bins,j);
    endfor  
  endfor
  coloane=columns(albastru)-1;
  for i = (2*count_bins+1) : 3*count_bins
    for j = 1 : coloane 
      sol(i)+=albastru(i-2*count_bins,j);
    endfor  
  endfor
  end