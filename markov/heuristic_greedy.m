function [path] = heuristic_greedy (start_position, probabilities, Adj)
  [n n] = size(Adj);
  path = start_position;
  visited = zeros(n);
  visited(start_position) = 1;
  while 1
    position = path(end);
    if (position == n - 1)
      return;
    else
      ok = 0;
      for i = 1:n
        if (Adj(position, i) == 1 && visited(i) == 0)
          ok = 1;
          break;
        endif
      endfor

      if (ok == 0)
        path(end) = [];
      endif
    endif

    neigh = 1;
    prob = 0;

    for i = 1:n
      if (Adj(position, i) == 1 && visited(i) == 0 && probabilities(i) > prob)
        prob = probabilities(i);
        neigh = i;
      endif
    endfor

    visited(neigh) = 1;
    path = [path, neigh];

  endwhile
endfunction
