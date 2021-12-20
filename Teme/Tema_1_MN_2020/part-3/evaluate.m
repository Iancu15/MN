function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  % iau informatii despre toate folderele(sar peste . .. si _DS_STORE)
  dirs = dir(path_to_testset);
  path_len = length(dirs);
  dirs = dirs(4 : path_len);
  path_len -= 3;
  
  % in accuracy tin cont de numarul de predictii corecte
  iter = 0;
  accuracy = 0;
  len_w = length(w);
  
  for j = 1 : path_len
    % fac rost de fisiere
    path_to_folder = strcat(path_to_testset, "/", dirs(j).name);
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
    
    % verific daca dataset-ul e folder-ul cu pisici si etichetez corespunzator
    if strcmp(dirs(j).name, "cats")
      Y(1 : nr_photos) = 1;
    else
      Y(1: nr_photos) = -1;
    endif
    
    % parcurg pozele
    for i = 1 : nr_photos
      % salve path-ul pozei
      path_to_file = strcat(path_to_folder, "/", files(i).name);
      
      if strcmp(histogram, "HSV")
        
        % y va fi wT * x(cum x este vector linie il iau si pe el transpus)
        x = hsvHistogram(path_to_file, count_bins);
        x(len_w) = 1;
        y = w' * x';
        
        % daca predictia e buna atunci tin cont corespunzator
        if (y >= 0 && Y(i) == 1) || (y < 0 && Y(i) == -1)
          accuracy++;
        endif
        
      else
        
        x = rgbHistogram(path_to_file, count_bins);
        x(len_w) = 1;
        y = w' * x';
        
        if (y >= 0 && Y(i) == 1) || (y < 0 && Y(i) == -1)
          accuracy++;
        endif
        
      endif
    endfor
    
    iter += i;
  endfor
  
  percentage = (accuracy / iter);
endfunction