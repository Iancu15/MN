function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  dirs = dir(path_to_dataset);
  path_len = length(dirs);
  dirs = dirs(4 : path_len);
  path_len -= 3;
  iter = 0;
  X = zeros(1, count_bins * 3);
  
  % fac rost de fisiere si schimb directorul la dataset
  for j = 1 : path_len
    path_to_folder = strcat(path_to_dataset, "/", dirs(j).name);
    files = dir(path_to_folder);
    dir_length = length(files);
    
    % scap de . si ..
    files = files(3 : dir_length);
    
    % scap de orice alt fisier de dupa imagini ex: results sau _DS_STORE
    for i = dir_length - 2 : -1 : 1
      path_to_file = strcat(path_to_folder, "/", files(i).name);
      suffix = strcat("ceva", path_to_file); 
      suffix = suffix(end - 3 : end);
      
      if strcmp(".jpg", suffix)
        break;
      endif
      
      files = files(1 : i - 1);
    endfor
    
    nr_photos = length(files);
    
    % iau ultimele 4 litere din path
    if length(dirs(j).name) <= 4
      is_cats = dirs(j).name;
    else
      is_cats = dirs(j).name(end - 4 : end);
    endif
    
    % verific daca dataset-ul e folder-ul cu pisici si etichetez corespunzator
    if strcmp(is_cats, "cats") || strcmp(is_cats, "/cats")
      y(iter + 1 : nr_photos) = 1;
    else
      y(iter + 1: nr_photos + iter) = -1;
    endif
    
    % pentru fiecare poza adaug vectorul de caracteristici in X pe orizontala
    for i = 1 : nr_photos
      path_to_file = strcat(path_to_folder, "/", files(i).name);
      if strcmp(histogram, "HSV")
        X(i + iter, 1 : count_bins * 3) = hsvHistogram(path_to_file, count_bins);
      else
        X(i + iter, 1 : count_bins * 3) = rgbHistogram(path_to_file, count_bins);
      endif
    endfor
  
    iter += i;
  endfor

endfunction