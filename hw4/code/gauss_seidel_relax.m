function [x, iters] = gauss_seidel_relax(A, b, N, tol)
% Gauss Seidel soln for Ax = b; 

% Initialize variables! 
x = zeros(1, N)'; 
iters = 0; 
normV = Inf; 
omega = 0.5; 

while normV > tol
    
    xPrev = x; 
    
    for i = 1 : N 
        
        change = 0; 
        
        for j = 1 : i - 1 
            
            change = change + A(i, j) * x(j); 
        end
        
        for j = i + 1 : N 
            
            change = change + A(i, j) * xPrev(j); 
        end
        
        x(i) = (1 / A(i, i)) * (b(i) - change); 
        x(i) = omega * x(i) + (1 - omega) * xPrev(i); 
        
    end
    
    iters = iters + 1; 
    normV = norm(xPrev - x); 
    
end

end

