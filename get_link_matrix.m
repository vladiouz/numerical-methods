function [Link] = get_link_matrix (Labyrinth)
  [m n] = size(Labyrinth);
  Link = zeros(m * n + 2, m * n + 2);
  for i = 1:m
    for j = 1:n
      # aflu in cate parti ma pot duce din pozitia (i, j)
      cases = bitget(Labyrinth(i,j), 4) + bitget(Labyrinth(i,j), 3);
      cases += bitget(Labyrinth(i,j), 2) + bitget(Labyrinth(i,j), 1);
      cases = 4 - cases;

      # pentru b3
      if(bitget(Labyrinth(i,j), 4) == 0)
        if(i == 1)
          Link(j, n * m + 1) = 1 / cases;
        else
          Link((i - 1) * n + j, (i - 2) * n + j) = 1 / cases;
        endif
      endif

      #pentru b2
      if(bitget(Labyrinth(i,j), 3) == 0)
        if(i == m)
          Link((i - 1) * n + j, n * m + 1) = 1 / cases;
        else
          Link((i - 1) * n + j, i * n + j) = 1 / cases;
        endif
      endif

      #pentru b1
      if(bitget(Labyrinth(i,j), 2) == 0)
        if(j == n)
          Link((i - 1) * n + j, n * m + 2) = 1 / cases;
        else
          Link((i - 1) * n + j, (i - 1) * n + j + 1) = 1 / cases;
        endif
      endif

      #pentru b0
      if(bitget(Labyrinth(i,j), 1) == 0)
        if(j == 1)
          Link((i - 1) * n + j, n * m + 2) = 1 / cases;
        else
          Link((i - 1) * n + j, (i - 1) * n + j - 1) = 1 / cases;
        endif
      endif

    endfor
  endfor
  Link(n * m + 1, n * m + 1) = 1;
  Link(n * m + 2, n * m + 2) = 1;
  Link = sparse(Link);
endfunction
