function new_X = task3 (photo, pcs)
  [m, n] = size (photo);

  % initializare matrice finala.
  new_X = zeros (m, n);

  % TODO: cast photo la double.
  X = double(photo);

  % TODO: calculeaza media fiecarui rand al matricii.
  mu = zeros(m, 1);
  for i = 1 : m
    mu(i) = sum(X(i, 1 : n)) / n;
  endfor

  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  X_1 = X - mu;

  % TODO: calculeaza matricea de covarianta.
  Z = (X_1 * X_1') / (n - 1);

  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V S] = eig(Z);
  e = eig(Z);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  [e_sortat, ind] = sort(e, "descend");
  V_sortat = V(:, ind);

  % TODO: pastreaza doar primele pcs coloane
  % OBS: primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.
  W = V_sortat(:, 1 : pcs);

  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = W' * X_1;

  % TODO: calculeaza matricea new_X care este o aproximatie a matricii initiale
  X = W * Y;

  % TODO: aduna media randurilor scazuta anterior.
  X_k = X + mu;

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(X_k);
endfunction
