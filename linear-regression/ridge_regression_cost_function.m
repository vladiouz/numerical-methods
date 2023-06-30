function [Error] = ridge_regression_cost_function (Theta, Y, FeMatrix, lambda)
  m = length(Y);
  Theta(1) = [];
  h = FeMatrix * Theta;
  Error = sum((h - Y) .^ 2) / (2 * m) + lambda * sum(Theta .^ 2);
endfunction
