clear all; 
close all; 


defaultTol = 1.0e-5; 

% Part A: 
disp("Part A: "); 

partAMatrix = [1 2 3 ; 4 5 6 ; 7 8 9]; 
initAx = [ 1 ; 1 ; 1]; 

partAx = power_method(partAMatrix, initAx, defaultTol); 
% Reconstruct eigenvalue from eigenvector. 
largestEigA = (partAx' * partAMatrix * partAx) / (partAx' * partAx); 

disp("Largest eigenvalue: "); 
disp(largestEigA); 
disp("Answer from Matlab: "); 
disp(eigs(partAMatrix)); 

% Part B: 

disp("Part B: "); 
partBMatrix = [2 3 2 ; 1 0 -2 ; -1 -3 -1]; 
initBx = [2 ; 3 ; 2]; 

partBx = power_method(partBMatrix, initBx, defaultTol); 
largestEigB = (partBx' * partBMatrix * partBx) / (partBx' * partBx);
disp(largestEigB); 
disp("Answer from Matlab: "); 
disp(eigs(partBMatrix)); 

% Part C: 

disp("Part C: "); 

initCx = [1 ; -1 ; 1]; 

partCx = power_method(partBMatrix, initCx, defaultTol);
largestEigC = (partCx' * partBMatrix * partCx) / (partCx' * partCx);

disp("Returned x: "); 
disp(partCx); 
disp("Calculated largest eigenvalue (wrong): "); 
disp(largestEigC);
disp("Answer from Matlab: "); 
disp(eigs(partBMatrix)); 

% Part D: 
disp("Part D: "); 

partDx = inverse_power_method(partAMatrix, initAx, defaultTol); 
smallestEigD = (partDx' * partAMatrix * partDx) / (partDx' * partDx); 

disp("Smallest eigenvalue: "); 
disp(smallestEigD); 

% Part E 

disp("Part E: "); 

% Given birth and death rates 
b1 = .3; 
b2 = .3; 
b3 = .3; 
b4 = .1; 

d1 = .1; 
d2 = .2; 
d3 = .5; 
d4 = .9; 

% part 1, part 2
partEMatrix = [b1 b2 b3 b4 ; (1 - d1) 0 0 0 ; ...
    0 (1 - d2) 0 0 ; 0 0 (1 - d3) (1 - d4)]; 
partExInit = [1 ; 1 ; 1 ; 1]; 

partEx = power_method(partEMatrix, partExInit, defaultTol); 
partElargest = (partEx' * partEMatrix * partEx) / (partEx' * partEx);

disp("Largest calculated eigenvalue: "); 
disp(partElargest); 

% part 3
p1 = 100; 
p2 = 200; 
p3 = 150; 
p4 = 75;
years = 100; 

populationProjection = (partEMatrix ^ years) * [p1 ; p2 ; p3 ; p4]; 

disp("Population projection after 100 years: "); 
disp(populationProjection); 

% part 4

% Calculate again with updated death rate. 

d4 = 0.01; 
partEMatrix = [b1 b2 b3 b4 ; (1 - d1) 0 0 0 ; ...
    0 (1 - d2) 0 0 ; 0 0 (1 - d3) (1 - d4)]; 

partEx = power_method(partEMatrix, partExInit, defaultTol); 
partElargest = (partEx' * partEMatrix * partEx) / (partEx' * partEx);

disp("Largest eigenvalue with d4 = .01: "); 
disp(partElargest); 

populationProjection = (partEMatrix ^ years) * [p1 ; p2 ; p3 ; p4]; 
disp("Population projection after 100 years: "); 
disp(populationProjection); 

