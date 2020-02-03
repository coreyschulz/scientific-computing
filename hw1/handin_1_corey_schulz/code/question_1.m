clear all; 
close all; 
hold on; 

x1 = 0:.01:1;

% Plot exponential function on [0, 1] 
exponential = exp(x1);
plot(x1, exponential); 

% % Plot hubbard function on [0, 1] at different time intervals. 
fplot(@(x) hubbard(x, 0.0), [0, 1]); 
fplot(@(x) hubbard(x, .25), [0, 1]); 
fplot(@(x) hubbard(x, .50), [0, 1]); 
