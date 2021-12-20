function [centroids] = clustering_pc(points, NC)
  % detalierea in README
  [r c] = size(points);
  centroids = zeros(NC, c);
  centroids_prev = zeros(NC, c);
  
  % initializarea
  for i = 1 : NC
    centroids(i,:) = mean(points(i:NC:r,:));
  endfor
  
  % imi da cum trebuie si pentru 1e-2, dar am pus 1e-5 in caz de orice
  while(norm(centroids - centroids_prev) > 1e-5)
    
    % creez o matrice formata din matrici de clustere puse consecutiv
    clusters = zeros(r/NC + 1, c*NC);
    centroids_prev = centroids;    
  
    % matricea norms de NC coloane contine norma punctelor relativ la centroizi
    for i = 1 : NC
      diff = points(1:r, :) - centroids(i, :);
      
      % normez de mana pentru ca octave 4.2.2 nu are vecnorm
      norms(1:r, i) = sqrt(sum(diff'.^2))';
    endfor
    
    % aflu index-ul centroid-ului cel mai apropiat pt fiecare punct
    [idc min_distance_index] = min(norms');
    min_distance_index = min_distance_index';
    
    % introduc elementele in cluster in functie de cel mai apropiat centroid
    for j = 1 : r
      m = min_distance_index(j) - 1;
      clusters(++clusters(1, 1 + m*c) + 1, 1 + m*c : (m + 1)*c) = points(j,:);
    endfor
    
    % recalcularea centroizilor
    for i = 0 : NC - 1
      if(clusters(1, 1 + i*c) == 1)
        centroids(i + 1, :) = clusters(2, 1 + i*c : (i + 1)*c);
        continue;
      endif
      
      centroids(i + 1, :) = mean(clusters(2 : clusters(1, 1 + i*c) + 1, 1 + i*c : (i + 1)*c));
    endfor
  endwhile
endfunction
