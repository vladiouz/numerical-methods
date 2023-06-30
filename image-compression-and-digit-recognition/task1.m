function new_X = task1 (photo, k)
  [m, n] = size (photo);

  % initializare matrice finala.
  new_X = zeros (m, n);

  % TODO: cast photo la double.
  X = double(photo);

  % TODO: aplica algoritmul SVD asupra photo.
  [U, S, V] = svd(X);
  V_transpus = V';

  % TODO: calculeaza noile matrici reduse U, S si V.
  new_U = U(1 : m, 1 : k);
  new_S = S(1 : k, 1 : k);
  new_V = V_transpus(1 : k, 1 : n);

  % TODO: calculeaza new_X care este aproximarea matricii initiale photo,
  % folosindu-va de matricile calculate anterior.
  X = new_U * new_S * new_V;

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(X);
endfunction
