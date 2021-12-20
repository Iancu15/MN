function cerc(x, y, r)
  % Functia deseneaza un cerc de centru (x,y) si raza r
  
  th = 0:pi/50:2*pi;
  xunit = r * cos(th) + x;
  yunit = r * sin(th) + y;
  plot(xunit, yunit);
end