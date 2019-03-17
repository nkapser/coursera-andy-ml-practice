function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
feature_count = size(theta,1);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    % prediction = theta(0)*x(0) + theta(1)*x(1)
    % theta(j) := theta(j) - alpha * (1/m) * (prediction - y(i)) * x(j)

    predictions = (X*theta);
    diviations = predictions-y;
    learning_const_for_datasize = (alpha) * (1/m);
    for j = 1:feature_count,
      theta(j) = theta(j) - learning_const_for_datasize * sum(diviations .* X(:,j));
    end;


    % ============================================================

    % Save the cost J in every iteration
    J_history(iter) = computeCostMulti(X, y, theta);

end

end