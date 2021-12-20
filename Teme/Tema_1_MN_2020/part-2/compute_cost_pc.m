function [cost] = compute_cost_pc(points, centroids)
  [r c] = size(points);
  [NC c] = size(centroids);
  clusters = zeros(r/NC, c*NC);
  
  % calculez distanta euclidiana de la fiecare punct la fiecare centroid
  for i = 1 : NC
    diff = points(1:r, :) - centroids(i, :);
    norms(1:r, i) = sqrt(sum(diff'.^2))';
  endfor
  
  %insumez distanta minime de la fiecare punct la unul din centroizi
  min_distance = min(norms');
  cost = sum(min_distance); 
endfunction