function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  [X Y] = preprocess(path_to_testset, histogram, count_bins);
  
  [r c] = size(X);
  X = (X - mean(X)) ./ std(X);
  X(:, c + 1) = 1;
  accuracy = 0;
  
  % matricea cu caracteristici este facuta dupa histograma asa ca nu mai
  % trebuie sa verific in for daca e "HSV" sau "RGB"
  for i = 1 : r
    y = w' * X(i, :)';
        
    if (y >= 0 && Y(i) == 1) || (y < 0 && Y(i) == -1)
      accuracy++;
    endif
  endfor
  
  percentage = (accuracy / r);
endfunction