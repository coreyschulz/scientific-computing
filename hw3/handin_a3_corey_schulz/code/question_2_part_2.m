clear all; 
close all; 
hold on; 

n = 161; 
H1 = 8; 
Hr = 4; 
aValues = [1.0, 1.0e-5, 1.0e-15]; 
deltaX = 1; 
maxIters = 100; 

for i = 1 : length(aValues)
    iters = zeros(n, maxIters + 1); 
    
    %Ax = b setup 
    aValue = aValues(i); 
    b = [-1 * H1, zeros(1, n - 2), -aValue * 4]; 
    A = make_diag_matrix(n, aValue); 
    iters(:, 1) = A \ b'; 
    
    % iterative refinement! 
    for j = 1 : maxIters 
        temp = b' - A * iters(:, j); 
        tempSoln = A \ temp; 
        iters(:, j + 1) = iters(:, j) + tempSoln; 
    end
    
    result = iters(:, end); 
    
    first = iters(:, 1); 
    
    % _finally_, plot for this a value! 
    figure('Name', sprintf('FIRST %d', i));
    plot(1 : n, first', 'o', 'MarkerFaceColor', 'b'); 
    grid on;
    title(sprintf('Iterative solution, a = %2.0e)', aValues(i)));
    xlabel('n values'); 
    ylabel('h values'); 
    
    % _finally_, plot for this a value! 
    figure('Name', sprintf('%d', i));
    plot(1 : n, result', 'o', 'MarkerFaceColor', 'b'); 
    grid on;
    title(sprintf('Iterative solution, a = %2.0e)', aValues(i)));
    xlabel('n values'); 
    ylabel('h values'); 
    
    for r = 1 : 161
        disp(result(r) - first(r)); 
    end
    
end