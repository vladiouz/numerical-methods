function [Labyrinth] = parse_labyrinth (file_path)
  fid = fopen(file_path, "r");
  m = fscanf(fid, "%d", 1);
  n = fscanf(fid, "%d", 1);
  Labyrinth = fscanf(fid, "%d", [n m])';
 endfunction
