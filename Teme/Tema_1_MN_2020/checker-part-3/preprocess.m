  function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  % iau informatii despre toate folderele(sar peste . .. si _DS_STORE)
  dirs = dir(path_to_dataset);
  path_len = length(dirs);
  dirs = dirs(4 : path_len);
  path_len -= 3;
  
  % iteratorul va tine cont de numarul de poze parcurse in fiecare folder
  iter = 0;
  X = zeros(1, count_bins * 3);
  
  % parcurg folderele
  for j = 1 : path_len
    % pentru fiecare folder iau fisierele aferente
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
    
    % salvez numarul de poze
    nr_photos = length(files);
    
    % verific daca dataset-ul e folder-ul cu pis ici si etichetez corespunzator
    if strcmp(dirs(j).name, "cats")
      y(iter + 1 : nr_photos) = 1;
    else
      y(iter + 1: nr_photos + iter) = -1;
    endif
    
    % pentru fiecare poza adaug vectorul de caracteristici in X pe orizontala
    for i = 1 : nr_photos
      % iau path-ul fiecarei poze pe rand
      path_to_file = strcat(path_to_folder, "/", files(i).name);
      
      % adaug vectorul caracteristic corespunzator pozei in matricea X
      if strcmp(histogram, "HSV")
        X(i + iter, 1 : count_bins * 3) = hsvHistogram(path_to_file, count_bins);
      else
        X(i + iter, 1 : count_bins * 3) = rgbHistogram(path_to_file, count_bins);
      endif
    endfor
  
    % cresc iteratorul ce tine cont de numarul de poze parcurse
    iter += i;
  endfor

endfunction