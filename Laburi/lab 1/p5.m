function y = NumarAparitii(numefis, sir)
  fid = fopen('numefis');
  line = fgetl(fid);
  while ischar(line)
    disp(size(findstr(line, sir));
    disp(line)
    line=fgetl(fid);
  end
  fclose(fid);
endfunction
