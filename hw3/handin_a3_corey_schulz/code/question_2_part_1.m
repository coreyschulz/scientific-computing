clear all; 
close all; 
hold on;

nValues = [21, 41, 81, 161]; 
aValues = [1.0, 1.0e-1, 1.0e-3, 1.0e-5, 1.0e-7, 1.0e-9, ...
    1.0e-11, 1.0e-13, 1.0e-15];

conditionNumbers = zeros(length(nValues), length(aValues)); 

% Generate condition numbers:
%    (using my matrix generation function and Matlab's cond) 
for i = 1 : length(nValues) 
    for j = 1 : length(aValues) 
        tempMatrix = make_diag_matrix(nValues(i), aValues(j)); 
        condNum = cond(tempMatrix); 
        conditionNumbers(i, j) = condNum; 
    end
end




% Now, just make plots for each of the a values! 
for i = 1 : length(aValues) 
    figure('Name', sprintf('%d', i));
    % Plot a values with respect to n values. 
    plot(nValues, conditionNumbers(:,i), 'o', 'MarkerFaceColor', 'b'); 
    grid on;
    title(sprintf('Water flow re:Condition Numbers, a = %2.0e)', ...
        aValues(i)));
    xlabel('n values'); 
    ylabel('Condition Numbers'); 
end




