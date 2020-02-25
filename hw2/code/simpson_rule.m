function ret = simpson_rule(fun, a, b, N)
%SIMPSON_RULE formula: 
%   (actually, too annoying to write out)

deltaX = (b - a) / N; 
x_i = a : deltaX : b; 

ret = (deltaX / 3) * (fun(x_i(1)) + ... 
    2 * sum(fun(x_i(3 : 2 : end - 2))) + ... 
    4 * sum(fun(x_i(2 : 2 : end))) ... 
    + fun(x_i(end))); 
end

