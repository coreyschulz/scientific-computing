function [x, iters] = jacobi(A, b, N, tol)
% Jacobi method for solving Ax = b; 

% Initialize variables! 
x = zeros(1, N)'; 
iters = 0; 
norm = Inf; 

while norm > tol
   
    xPrev = x; 
    
    for i = 1 : N 
        
        change = 0; 
        
        for j = 1 : N 
           
            if j ~= i 
                change = change + A(i, j) * x(j); 
            end
            
        end
        
        x(i) = (1 / A(i, i)) * (b(i) - change); 
        
    end
    
    iters = iters + 1; 
    norm = abs(xPrev - x); 
    
end


end

