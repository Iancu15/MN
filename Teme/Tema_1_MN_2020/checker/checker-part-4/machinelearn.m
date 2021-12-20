function [percentage] = machinelearn()
  for i = 1 : 10
    z = time();
    helper_check_prediction('RGB', 20, 0.01, 500);
    helper_check_prediction('HSV', 20, 0.01, 500);
    time() - z
  endfor
endfunction
