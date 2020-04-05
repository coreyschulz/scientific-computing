clear all; 
close all; 

matrixB = [4 1 -2 ; 4 4 -3 ; 8 4 2]; 
matrixC = [2 1 -2 ; 4 4 -3 ; 8 4 4]; 

[bL, bU] = lu(matrixB); 
[cL, cU] = lu(matrixC); 

disp("Matrix B"); 
disp(matrixB); 
disp("-------L"); 
disp(bL); 
disp("-------U");
disp(bU); 

disp("Matrix C"); 
disp(matrixC); 
disp("-------L"); 
disp(cL); 
disp("-------U");
disp(cU); 


