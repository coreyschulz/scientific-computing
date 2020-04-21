clear all; 
close all; 

% Part A: 

disp("Part A: Parsing Data..."); 

n = 82; 
p = 11; 

xValues = zeros(n, 1); 
yValues = zeros(n, 1); 

fid = fopen('input_data_nist.txt', 'r'); 

counter = 1; 

%Read and parse data: 
while ~feof(fid)
    tline = fgetl(fid);
    temp = sscanf(tline, '%f');
    
    yValues(counter) = temp(1); 
    xValues(counter) = temp(2); 
    
    counter = counter + 1; 
    
end
fclose(fid); 

% Part B, Part C: 
disp("Part B & C: "); 

mValues = [9 11 13 15 17 19 21 23 25]; 

for i = 1 : length(mValues)
    
    figure(i); 
    
    plot(xValues, yValues, '*'); 

    % Part B: 
    hold on; 
    [res, err] = polyfit(xValues, yValues, mValues(i)); 
    
    % For 1,001 points...
    manyXValues = linspace(min(xValues), max(xValues), 1001); 
    
    [tempY, errEst] = polyval(res, manyXValues, err); 
    plot(manyXValues, tempY, '-'); 
    title(sprintf('best degree-%d approximation',mValues(i)),'fontsize',16); 
    fprintf("Average error for rank %d approximation: \n", mValues(i)); 
    disp(mean(errEst)); 
end

% Part D: 

disp("Part D: "); 

%Do it again, but rescale to desired range: 
newXValues = rescale(xValues, -1, 1); 
newYValues = rescale(yValues, -1, 1); 

for i = 1 : length(mValues)
    figure(i + length(mValues)); 
    
    plot(newXValues, newYValues, '*'); 

    % Part B: 
    hold on; 
    [res, err] = polyfit(newXValues, newYValues, mValues(i)); 
    manyXValues = linspace(min(newXValues), max(newXValues), 1001); 
    [tempY, errEst] = polyval(res, manyXValues, err); 
    plot(manyXValues, tempY, '-'); 
    title(sprintf('best degree-%d approximation, scaled [-1, 1]',mValues(i)),'fontsize',16); 
    fprintf("Average error for rank %d approximation, scaled X and Y values: \n", mValues(i)); 
    disp(mean(errEst)); 
end









