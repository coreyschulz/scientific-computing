function [x] = inverse_power_method(A, x0, tolerance)

warning('off'); 

m = 0; 
Iteration = 0;
x_prev = x0;
success = 0;

for k=1:100    
    % disp(['Power iteration ' int2str(k) ':']);
    
    % Perform power iteration
    y = A \ x_prev;
    x = y / norm(y,inf); 
    x = x*sign(x(1));
    
    Iteration = Iteration + 1;
    
    % Check for convergence
    if norm(x - x_prev, inf) < tolerance
        disp(['Inverse power method converged in ' int2str(Iteration) ' iterations.']);
        success = 1;
        break
    else
        x_prev = x;
    end    
end

if success == 0
    disp(['Inverse power method failed to converge in ' int2str(Iteration) ' iterations.']);
end


