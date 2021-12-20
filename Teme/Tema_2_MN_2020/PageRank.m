function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
  % as fi calculat M-ul aici pentru a nu-l calcula de 2 ori in Iterative si in
  % Algebraic, dar in cazul in care apare un checker ar fi bine sa nu modific
  % parametrii unei functii (am adaugat mai multe output-uri la final la unele
  % functii, lucru ce n-ar trebui sa produca probleme
  [R1 nodes_num file] = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  
  % introduc vectorii N, R1 si R2 in fisierul de iesire
  outfile = fopen(strcat(nume, ".out"), "wt");
  fprintf(outfile, "%d\n\n", nodes_num);
  
  fprintf(outfile, "%f\n", R1);
  fprintf(outfile, "\n")
  fprintf(outfile, "%f\n", R2);
  fprintf(outfile, "\n");
  
  % citesc valorile din fisier,sar peste newline cu fgetl
  % file-ul a ramas la ultima pozitie din iterative
  fgetl(file);
  val1 = fscanf(file, "%f", 1);
  
  fgetl(file);
  val2 = fscanf(file, "%f", 1);
  
  % PR este noul PR sortat descrescator, sort_index are pe pozitia i index-ul
  % vechi al elementului de pe pozitia i din PR
  [PR sort_index] = sort(R2, "descend");
  
  % calculez apartanenta pentru fiecare pagina si introduc rezultatele in fisier
  for i = 1 : nodes_num
    apartenenta = Apartenenta(PR(i), val1, val2);
    fprintf(outfile, "%d %d %f\n", i, sort_index(i), apartenenta);
  endfor
  
  fclose(outfile)
  fclose(file)
endfunction