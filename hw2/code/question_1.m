clear all; 
close all; 
hold on; 

N = [17, 33, 65, 129, 257, 513]; 
N2 = [17, 33, 65, 129, 257, 513, 1000]; 
f1 = @(x) x.^2; 
f2 = @(x) x.^3; 
f3 = @(x) x.^4; 
f4 = @(x) x.^5; 
f5 = @(x) x.^6; 
f6 = @(x) x.^8;  %% good programming practice.
f7 = @(x) 1 + sin(x) .* cos((2 .* x) / 3) .* sin(4 .* x); 
f7Results = zeros(1, 7); 


fprintf("################### x ^ 2 ###########\n"); 
for i = 1 : 6 
    disp(simpson_rule(f1, 0, 1, N(i)));
end 

fprintf("################### x ^ 3 ###########\n"); 
for i = 1 : 6 
    disp(simpson_rule(f2, 0, 1, N(i)));
end 

fprintf("################### x ^ 4 ###########\n"); 
for i = 1 : 6 
    disp(simpson_rule(f3, 0, 1, N(i)));
end 
fprintf("################### x ^ 5 ###########\n"); 
for i = 1 : 6 
    disp(simpson_rule(f4, 0, 1, N(i)));
end 

fprintf("################### x ^ 6 ###########\n"); 
for i = 1 : 6 
    disp(simpson_rule(f5, 0, 1, N(i)));
end 

fprintf("################### x ^ 8 ###########\n"); 
for i = 1 : 6 
    disp(simpson_rule(f6, 0, 1, N(i)));
end 

fprintf("########## PART 2 SINCOSSIN ###########\n"); 
for i = 1 : 7
    res = simpson_rule(f7, 0, 2 * pi, N2(i)); 
    disp(res);
    f7Results(i) = res; 
end 

plot(N2, f7Results); 
a = 6.305171;
plot(N2, [a, a, a, a, a, a, a]); 



