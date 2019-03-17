function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
m = size(X,1);
for i=1:m,
  _distance = 100000; %setting initial initial distance to some large value;
  % fprintf("\n\nRunning for sample %d: %s\n", i, X(i));
  for j=1:K,
    _distance_from_k = sqrt(sum((X(i,:) - centroids(j,:)).^2));
    % fprintf("Sample No: %d distance from centroid %d is %0.4f\n", i, j,_distance_from_k);
    if _distance_from_k <= _distance,
      _distance = _distance_from_k;
      idx(i) = j;
    endif
  endfor
endfor





% =============================================================

end
