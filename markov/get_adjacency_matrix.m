function [Adj] = get_adjacency_matrix (Labyrinth)
  [m n] = size(Labyrinth);
  Adj = zeros(m * n + 2, m * n + 2);
  for i = 1:m
    for j = 1:n

      # pentru b3
      if(bitget(Labyrinth(i,j), 4) == 0)
        if(i == 1)
          Adj(j, n * m + 1) = 1;
        else
          Adj((i - 1) * n + j, (i - 2) * n + j) = 1;
        endif
      endif

      #pentru b2
      if(bitget(Labyrinth(i,j), 3) == 0)
        if(i == m)
          Adj((i - 1) * n + j, n * m + 1) = 1;
        else
          Adj((i - 1) * n + j, i * n + j) = 1;
        endif
      endif

      #pentru b1
      if(bitget(Labyrinth(i,j), 2) == 0)
        if(j == n)
          Adj((i - 1) * n + j, n * m + 2) = 1;
        else
          Adj((i - 1) * n + j, (i - 1) * n + j + 1) = 1;
        endif
      endif

      #pentru b0
      if(bitget(Labyrinth(i,j), 1) == 0)
        if(j == 1)
          Adj((i - 1) * n + j, n * m + 2) = 1;
        else
          Adj((i - 1) * n + j, (i - 1) * n + j - 1) = 1;
        endif
      endif
    endfor
  endfor
  Adj(n * m + 1, n * m + 1) = 1;
  Adj(n * m + 2, n * m + 2) = 1;
  Adj = sparse(Adj);
endfunction
