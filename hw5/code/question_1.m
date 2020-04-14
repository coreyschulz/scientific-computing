clear all; 
close all; 


% years 
x = [1900 1910 1920 1930 1940 1950 1960 1970 1980 1990 2000]'; 
xScaled = zeros(length(x), 1); 

% population 
y = [75.995 91.972 105.711 123.203 131.669 150.697 179.323 ...
    203.212 226.505 249.633 281.422]'; 

defaultAlpha = 0.61; 

% scale years to [-1, 1] 

for i = 1 : length(x)
    xScaled(i) = (x(i) - 1950) / 50; 
end


% Q1, Part A
resA = steepest_descent(x, y, 0.1e-5, 3, defaultAlpha);

disp("Part A: "); 
fprintf('Solution of the system is %f %f %f %f %f \n', resA);
fprintf("\n\n");


% Q1, Part B 
resB = steepest_descent(xScaled, y, 0.1e-5, 3, defaultAlpha);

disp("Part B: "); 
fprintf('Solution of the system is %f %f %f %f %f \n', resB);
fprintf("\n\n");


% Q1, Part C 

disp("Part C: "); 

% Calculate steepest descent for each degree. 
% I know this looks like bad coding practice - it is, but I need to use 
% these variables later. 

[deg2Ans, residualDeg2] = steepest_descent(xScaled, y, 1.0e-5, 2, defaultAlpha);
disp("Solution of the system for degree = 2 is: "); 
disp(deg2Ans); 
fprintf("Residual for degree 2: %f \n\n", residualDeg2); 

[deg3Ans, residualDeg3] = steepest_descent(xScaled, y, 1.0e-5, 3, defaultAlpha);
disp("Solution of the system for degree = 3 is: "); 
disp(deg3Ans); 
fprintf("Residual for degree 3: %f \n\n", residualDeg3); 

[deg4Ans, residualDeg4] = steepest_descent(xScaled, y, 1.0e-5, 4, defaultAlpha);
disp("Solution of the system for degree = 4 is: "); 
disp(deg4Ans); 
fprintf("Residual for degree 4: %f \n\n", residualDeg4); 

[deg5Ans, residualDeg5] = steepest_descent(xScaled, y, 1.0e-5, 5, defaultAlpha);
disp("Solution of the system for degree = 5 is: "); 
disp(deg5Ans); 
fprintf("Residual for degree 5: %f \n\n", residualDeg5); 

% Q1, Part D 

disp("Part D: "); 

year2010 = 1.2; 
year2019 = 1.38; 

deg2_2010 = 0; 
deg2_2019 = 0; 

deg3_2010 = 0; 
deg3_2019 = 0; 

deg4_2010 = 0; 
deg4_2019 = 0; 

deg5_2010 = 0; 
deg5_2019 = 0; 

% Evaluate polynomial at all needed data points. 
for j = 1:3
    deg2_2010 = deg2_2010 + deg2Ans(j)*year2010^(j-1);
    deg2_2019 = deg2_2019 + deg2Ans(j)*year2019^(j-1); 
end

fprintf("Degree 2: year 2010 %f \n", deg2_2010); 
fprintf("Degree 2: year 2019 %f \n\n", deg2_2019); 

for j = 1:4
    deg3_2010 = deg3_2010 + deg3Ans(j)*year2010^(j-1);
    deg3_2019 = deg3_2019 + deg3Ans(j)*year2019^(j-1); 
end

fprintf("Degree 3: year 2010 %f \n", deg3_2010); 
fprintf("Degree 3: year 2019 %f \n\n", deg3_2019); 


for j = 1:5
    deg4_2010 = deg4_2010 + deg4Ans(j)*year2010^(j-1);
    deg4_2019 = deg4_2019 + deg4Ans(j)*year2019^(j-1); 
end

fprintf("Degree 4: year 2010 %f \n", deg4_2010); 
fprintf("Degree 4: year 2019 %f \n\n", deg4_2019); 

for j = 1:6
    deg5_2010 = deg5_2010 + deg5Ans(j)*year2010^(j-1);
    deg5_2019 = deg5_2019 + deg5Ans(j)*year2019^(j-1); 
end

fprintf("Degree 5: year 2010 %f \n", deg5_2010); 
fprintf("Degree 5: year 2019 %f \n\n", deg5_2019); 

% Q1, Part E 

disp("Part E: "); 

alphaValues = [ .2 .4 .6 .61 .62 .63 .64 .66 .67 .68 .69 .7]; 
alphaWorkResults = zeros(length(alphaValues)); 

% Best model: degree 4 (questionable decision, not much data to go on.) 

for i = 1 : length(alphaValues)
    tempAlpha = alphaValues(i); 
    
    [~, ~, tempIters] = steepest_descent(xScaled, y, 1.0e-5, 4, tempAlpha);
    alphaWorkResults(i) = tempIters; 
    
    fprintf("Alpha value %.2f : %.0f iterations\n", tempAlpha, tempIters); 
    
end

fprintf("However, .7 alpha fails so .69 is the best.\n\n");  

















fprintf("\n\n");


