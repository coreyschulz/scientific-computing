function ret = make_diag_matrix(n)
% Make diagonal matrix for question_1

ret = zeros(n, n); 

ret(1, 1) = 9; 
ret(1, 2) = -4;
ret(1, 3) = 1; 

ret(2, 1) = -4; 
ret(2, 2) = 6; 
ret(2, 3) = -4; 
ret(2, 4) = 1; 

offset = 0;

for i = 3 : n - 2 
    ret(i, offset + 1) = 1; 
    ret(i, offset + 2) = -4; 
    ret(i, offset + 3) = 6;
    ret(i, offset + 4) = -4;
    ret(i, offset + 5) = 1;
            
    offset = offset + 1; 
end

ret(n - 1, n) = 2; 
ret(n - 1, n - 1) = 5; 
ret(n - 1, n - 2) = -4; 
ret(n - 1, n - 3) = 1; 

ret(n, n) = 1; 
ret(n, n - 1) = -2; 
ret(n, n - 2) = 1; 

end

