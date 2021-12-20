function [A, b] = generate_probabilities_system(rows)
  % in caz ca e nevoie de detalii, se gasesc in README
  nr_elem = rows*(rows + 1)/2;
  A = zeros(nr_elem);
  b = zeros(nr_elem, 1);

  % hardcodez prima linie
  A(1, 1) = 4;
  A(1, 2) = -1;
  A(1, 3) = -1;
  nr_prev = 1;

  % ma ocup de liniile din mijlocul piramidei
  % introduc valori doar pentru 'nodurile' cu indexul mai mare decat linia
  % matricei pentru ca linia e simetrica si pe restul le transpun la final

  for i = 2 : rows - 1
    nr = i*(i + 1)/2;
    
    % fara extremitatea dreapta, toate elementele unui 'row de labirint' au
    % 3 noduri mai mare decat ele cu care se conecteaza 
    % am incercat sa vectorizez for-ul, nu cred ca e posibil
    for j = nr_prev + 1 : nr - 1
      A(j, j) = 6;
      A(j, j + 1) = -1;
      A(j, j + i) = -1;
      A(j, j + i + 1) = -1;
    endfor

    % doar extremitatea stanga are doar 5 posibilitati
    A(nr_prev + 1, nr_prev + 1) = 5;
    
    % introduc valorile pentru linia care reprezinta extremitatea dreapta
    % extremitatea dreapta are doar 2 noduri mai mari cu care este conectata
    A(nr, nr) = 5;
    A(nr, nr + i + 1) = -1;
    A(nr, nr + i) = -1;
    nr_prev = nr;
  endfor

  % aici ma ocup de ultimul 'row al labirintului'
  for j = nr_prev + 1 : nr_elem - 1 
    A(j, j) = 5;
    A(j, j + 1) = -1;
    b(j) = 1;
  endfor
  
  % doar extremititatile au 4 posibilitati
  A(nr_prev + 1, nr_prev + 1) = 4;
  A(nr_elem, nr_elem) = 4;
  b(nr_elem) = 1;
  
  A = A + (A - diag(diag(A)))';
endfunction
