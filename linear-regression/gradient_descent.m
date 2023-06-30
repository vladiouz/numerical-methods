function [Theta] = gradient_descent (FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n, 1);

  for i = 1 : iter
    h = FeatureMatrix * Theta;
    Theta = Theta - (alpha / m) * ((h - Y)' * FeatureMatrix)'
  endfor

  Theta = [0; Theta];
endfunction
