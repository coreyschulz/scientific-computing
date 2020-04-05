clear all; 
close all; 

N = 8; 
A = make_diag_matrix(N); 
tol = 1.0e-5; 
b = (1 / (N ^ 4)) * ones(1, 8)'; 

actualSoln = A \ b; 

[jacobiSoln, itersJacobi] = jacobi(A, b, N, tol); 
[gaussSoln, itersGauss] = gauss_seidel(A, b, N, tol); 


disp("Matlab solve solution:"); 
disp(actualSoln); 

disp("Jacobi Solution:"); 
disp(jacobiSoln); 
disp("Jacobi iterations:"); 
disp(itersJacobi);

disp("Gauss Solution:"); 
disp(gaussSoln); 
disp("Gauss iterations:"); 
disp(itersGauss); 
