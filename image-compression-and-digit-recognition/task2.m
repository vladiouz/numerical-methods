function new_X = task2 (photo, pcs)
  [m n] = size(photo);

  % initializare matrice finala.
  new_X = zeros(m, n);

  % TODO: cast photo la double.
  X = double(photo);

  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  mu = zeros(m, 1);
  for i = 1 : m
    mu(i) = sum(X(i, 1 : n)) / n;
  endfor
  X_1 = X - mu;

  % TODO: construieste matricea Z.
  Z = (X_1') / sqrt(n - 1);

  % TODO: calculeaza matricile U, S si V din SVD aplicat matricii Z
  [U, S, V] = svd(Z);

  % TODO: construieste matricea W din primele pcs coloane ale lui V
  W = V(1 : m, 1 : pcs);

  % TODO: cacluleaza matricea Y
  Y = W' * X_1;

  % TODO: aproximeaza matricea initiala
  X_k = W * Y + mu;
  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(X_k);
endfunction
