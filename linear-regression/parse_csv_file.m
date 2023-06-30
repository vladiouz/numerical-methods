function [Y, InitialMatrix] = parse_csv_file (file_path)
  fid = fopen(file_path);
  line = fgetl(fid);
  Y = [];
  n = 0;

  while 1
    [a, line] = strtok(line, ',');
    if (isempty(line))
      break;
    endif
    n = n + 1;
  endwhile

  i = 1;

  while 1
    line = fgetl(fid);

    if (line == -1)
      break;
    endif

    [a, line] = strtok(line, ',');
    Y = [Y; str2num(a)];

    for j = 1 : n
      [InitialMatrix{i, j}, line] = strtok(line, ',');
    endfor

    i = i + 1;
  endwhile

  fclose(fid);

  Y
  InitialMatrix
endfunction
