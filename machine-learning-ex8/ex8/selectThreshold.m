function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

m = size(yval,1);

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)

    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
    pcounts = zeros(m,3); % total true positives, false positives, false negatives
    for i=1:m,
      if (pval(i) < epsilon && yval(i) == 1)
        % true positives
        pcounts(i,1) = 1;
      elseif (pval(i) < epsilon && yval(i) == 0)
        % false positives
        pcounts(i,2) = 1;
      elseif (pval(i) >= epsilon && yval(i) == 1)
        % false negatives
        pcounts(i,3) = 1;
      endif
    endfor

    sum_p = sum(pcounts);
    precisions = 0;
    recalls = 0;

    p_base = (sum_p(1,1) + sum_p(1,2));
    r_base = (sum_p(1,1) + sum_p(1,3));
    if p_base > 0
      precisions = sum_p(1,1) / p_base;
    endif
    if r_base > 0
      recalls = sum_p(1,1) / r_base;
    endif

    f1_base = precisions+recalls;
    if f1_base > 0
      F1 = (2*precisions*recalls) / f1_base;
    endif

    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end
