function p4(numefis)
  fid = fopen(numefis);
  fseek(fid, 0, 'eof')
  filesize=ftell(fid);
  disp(filesize);
endfunction
