function [Error] = linear_regression_cost_function (Theta, Y, FeatureMatrix)  
  m = length(Y);
  Theta(1) = [];
  h = FeatureMatrix * Theta;
  Error = 1 / (2 * m) * sum((h - Y) .^ 2);
endfunction
