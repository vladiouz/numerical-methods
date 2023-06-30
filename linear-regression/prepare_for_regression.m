function [FeatureMatrix] = prepare_for_regression (InitialMatrix)
  [m n] = size(InitialMatrix);
  for i = 1 : m
    for j = 1 : n
      if(strcmp(InitialMatrix(i, j), "no"))
        InitialMatrix(i, j) = 0;
      elseif(strcmp(InitialMatrix(i, j), "yes"))
        InitialMatrix(i, j) = 1;
      elseif(strcmp(InitialMatrix(i, j), "semi-furnished"))
        InitialMatrix(i, j) = [1, 0];
      elseif(strcmp(InitialMatrix(i, j), "unfurnished"))
        InitialMatrix(i, j) = [0, 1];
      elseif(strcmp(InitialMatrix(i, j), "furnished"))
        InitialMatrix(i, j) = [0, 0];
      else
        x = cell2mat(InitialMatrix(i, j));
        if (strcmp(typeinfo(x), "sq_string"))
          InitialMatrix(i, j) = str2num(x);
        endif
      endif
    endfor
  endfor
  FeatureMatrix = cell2mat(InitialMatrix);
endfunction
