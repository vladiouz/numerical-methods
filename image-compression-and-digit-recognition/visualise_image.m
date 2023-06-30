function im = visualise_image (train_mat, number)
  % initializare matrice finala.
  im = zeros (28, 28);

  % TODO: citeste din matricea de antrenament linia cu numarul number.
  linia_number = train_mat(number, :);

  % TODO: transforma linia citita intr-o matrice 28x28 care trebuie apoi
  % transpusa.
  % HINT: functia reshape
  mat = reshape(linia_number, [28, 28]);
  mat_transpusa = mat';

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  im = uint8(mat_transpusa);

  % imshow (im)
endfunction
