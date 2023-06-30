function [train, miu, Y, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);

  % initializare train
  train = zeros (m, n);

  % initializare miu
  miu = zeros (1, n);

  % initializare Y
  Y = zeros (m, pcs);

  % initializare Vk
  Vk = zeros (n, pcs);

  % TODO: cast train_mat la double.
  X = double(train_mat);

  % TODO: calculeaza media fiecarei coloane a matricii.
  for i = 1 : n
    miu(i) = sum(X(:, i)) / m;
  endfor

  % TODO: scade media din matricea initiala.
  X_1 = X - miu;

  % TODO: calculeaza matricea de covarianta.
  cov_matrix = (X_1' * X_1) / (m - 1);

  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V S] = eig(cov_matrix);
  e = eig(cov_matrix);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  [e_sortat, ind] = sort(e, "descend");
  V_sortat = V(:, ind);

  % TODO: pastreaza doar primele pcs coloane din matricea obtinuta anterior.
  Vk = V_sortat(:, 1 : pcs);

  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = X_1 * Vk;

  % TODO: calculeaza matricea train care este o aproximatie a matricii initiale
  % folosindu-va de matricea Vk calculata anterior
  X_dublu_subliniat = Y * Vk';
  train = uint8(X_dublu_subliniat);

endfunction
