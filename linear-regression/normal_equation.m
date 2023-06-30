function [Theta] = normal_equation (FeatureMatrix, Y, tol, iter)
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;
  [~, is_positive_definite] = chol(A);

  [n n] = size(A);
  Theta = zeros(n, 1);

  # matricea e pozitiv definita
  if (is_positive_definite == 0)
    r_0 = b - A * Theta;
    v = r_0;
    tol_squared = tol * tol;
    k = 1;

    while (k <= iter && r_0' * r_0 > tol_squared)
      t = (r_0' * r_0) / (v' * A * v);
      Theta = Theta + t * v;
      r = r_0 - t * A * v;
      s = (r' * r) / (r_0' * r_0);
      v = r + s * v;
      r_0 = r;
      k = k + 1;
    endwhile

  endif

  Theta = [0; Theta];
endfunction
