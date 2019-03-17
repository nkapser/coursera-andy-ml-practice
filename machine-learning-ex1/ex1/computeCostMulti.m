function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


% n - number of features - size(theta, 1)
% Formula: J = (1/(2*m))*sum(errorSquares);
% errorSquares = (predictions - y(i)).^2
% predictions = theta_0*x0 + theta_1*x1 ...

predictions = X * theta;
errorSquares = (predictions - y).^2;
sumOfErrorSquares = sum(errorSquares);

J = (1/(2*m)) * sumOfErrorSquares;


% =========================================================================

end
