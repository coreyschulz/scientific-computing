clear all;
close all; 

f = @(x) (cos(x.^3)).^200; 
f7 = @(x) 1 + sin(x) .* cos((2 .* x) / 3) .* sin(4 .* x); 

tols = [1.0e-7, 1.0e-8, 1.0e-9, 1.0e-10, 1.0e-11, ... 
    1.0e-12, 1.0e-13, 1.0e-14];

N = [17, 33, 65, 129, 257, 500, 1000, 2000]; 

actualValue = 0.531594; 

actualValue2 = .475317; 

res1 = zeros(8, 1); 
res1Calls = zeros(8, 1); 
res1Diff = zeros(8, 1); 

res2 = zeros(8, 1); 
res2Diff = zeros(8, 1); 

fprintf("########### QUADTX ############ \n"); 
disp("## TIME ## "); 
for i = 1 : 8
   tic 
   [r1, r2] = quadtx(f, 0, 3, tols(i)); 
   toc
   res1(i) = r1; 
   res1Calls(i) = r2; 
   r3 = abs(actualValue - r1); 
   res1Diff(i) = r3; 
end

disp("## VALUE ##"); 
disp(res1); 
disp("## CALLS ##"); 
disp(res1Calls);
disp("## ERROR ##"); 
disp(res1Diff); 

fprintf("########### SIMPSON'S ############ \n"); 
disp("## TIME ## "); 
for i = 1 : 8
   tic 
   sval = simpson_rule(f, 0, 3, N(i));
   toc
   res2(i) = sval; 
   r3 = abs(actualValue - sval); 
   res2Diff(i) = r3; 
end
disp("## VALUE ##"); 
disp(res2); 
disp("## CALLS ##"); 
disp(N);
disp("## ERROR ##"); 
disp(res2Diff); 





