function [Error] = lasso_regression_cost_function (Theta, Y, FeMatrix, lambda)
  m = length(Y);
  Theta(1) = [];
  h = FeMatrix * Theta;
  norm = 0;
  for i = 1 : length(Theta)
    norm = norm + abs(Theta(i));
  endfor
  Error = sum((h - Y) .^ 2) / (1 * m) + lambda * norm;
endfunction
