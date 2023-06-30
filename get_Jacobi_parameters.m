function [G, c] = get_Jacobi_parameters (Link)
  [m m] = size(Link);
  G = Link(1:m-2, 1:m-2);
  c = Link(1:m-2, m-1);
endfunction
