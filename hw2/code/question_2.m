clear all;
close all; 

f = @(x) (cos(x.^3)).^200; 

tols = [1.0e-7, 1.0e-8, 1.0e-9, 1.0e-10, 1.0e-11, ... 
    1.0e-12, 1.0e-13, 1.0e-14];

res1 = zeros(8, 1); 
res1Calls = zeros(8, 1); 

res2 = zeros(8, 1); 
res2Calls = zeros(8, 1); 

fprintf("########### DEFAULT ############ \n"); 
disp("## TIME ## "); 
for i = 1 : 8
   tic 
   [r1, r2] = quadtx(f, 0, 3, tols(i)); 
   toc
   res1(i) = r1; 
   res1Calls(i) = r2; 
end
disp("## VALUE ##"); 
disp(res1); 
disp("## CALLS ##"); 
disp(res1Calls);


fprintf("########### CHANGE TOL CASE ############ \n"); 
disp("## TIME ## "); 
for i = 1 : 7  %% Stack overflow when i == 8. 
   tic 
   [r1, r2] = quadtx_alternate(f, 0, 3, tols(i)); 
   toc
   res2(i) = r1; 
   res2Calls(i) = r2; 
end
disp("## VALUE ##"); 
disp(res2); 
disp("## CALLS ##"); 
disp(res2Calls); 
disp("0 values: stack overflow -- too many calls"); 



