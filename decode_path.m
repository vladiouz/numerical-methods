function [decoded_path] = decode_path (path, lines, cols)
  path(end) = [];
  vlines = floor((path - 1) / cols) + 1;
  vcols = mod(path - 1, cols) + 1;
  decoded_path = [vlines; vcols]';
endfunction
