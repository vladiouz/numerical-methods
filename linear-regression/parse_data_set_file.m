function [Y, InitialMatrix] = parse_data_set_file (file_path)
  fid = fopen(file_path, "r");
  m = fscanf(fid, "%d", 1);
  n = fscanf(fid, "%d", 1);
  aux = cell(m, n);
  Y = zeros(m, 1);

  for i = 1 : m
    Y(i) = fscanf(fid, "%d", 1);
    for j = 1 : n
      aux(i, j) = fscanf(fid, "%s", 1);
    endfor
  endfor
  InitialMatrix = aux;
endfunction