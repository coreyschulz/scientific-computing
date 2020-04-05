clear all; 
close all; 
warning('off', 'all');

SIZE = 700; 

% Calculate values of e^x and vandermonde matrix 
xValues = linspace(0, 1, SIZE); 
eXLin = zeros(1, SIZE); 
for i = 1 : SIZE
    eXLin(i) = exp(xValues(i)); 
end
vanderMatrix = vander(eXLin); 

disp("Solution using linsolve"); 
% Solve matrix 
tic
sol = linsolve(vanderMatrix, eXLin'); 
toc

% Display results! 
disp("Vandermonde matrix cond num"); 
disp(cond(vanderMatrix)); 
disp("a matrix cond num"); 
disp(cond(eXLin)); 
disp("solution (y) matrix cond num"); 
disp(cond(sol)); 

% --------------------- package solve 

eXLin2 = zeros(1, SIZE);
for i = 1 : SIZE
    eXLin2(i) = exp(xValues(i)); 
end


disp("Solution using Vandermonde library"); 
tic
res = dvand(SIZE, vanderMatrix, eXLin');
toc

disp("Vandermonde matrix cond num"); 
disp(cond(vanderMatrix)); 
disp("a matrix cond num"); 
disp(cond(eXLin)); 
disp("solution (y) matrix cond num"); 
disp(cond(sol)); 









