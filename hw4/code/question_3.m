clear all; 
close all; 

nValues = [16, 32, 64]; 
tolValues = [1.0e-5, 1.0e-7, 1.0e-9, 1.0e-11, 1.0e-13, 1.0e-15]; 

nLength = length(nValues); 
tolLength = length(tolValues); 

for i = 1 : nLength 
    
    fprintf("#### N = %d \n", nValues(i)); 
    
    for j = 1 : tolLength 

        N = nValues(i); 
        A = make_diag_matrix(N); 
        tol = tolValues(j); 
        b = (1 / (N ^ 4)) * ones(1, N)'; 
        
        [gaussSoln, itersGauss] = gauss_seidel_relax(A, b, N, tol); 
        
        fprintf("For tol = %d, iterations = %d \n", tol, itersGauss); 
        
    end
    fprintf("\n"); 
end