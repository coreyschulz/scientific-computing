function ret = make_diag_matrix(n,a)
% Make diagonal matrix for question_2 

ret = zeros(n, n); 
ret(1, 1) = -2; 
ret(1, 2) = 1; 
offset = 0; 
halfway = (n - 1) / 2; 

for i = 2 : halfway 
    ret(i, offset + 1) = 1; 
    ret(i, offset + 2) = -2; 
    ret(i, offset + 3) = 1;
    offset = offset + 1; 
end

ret(halfway + 1, offset + 1) = 1; 
ret(halfway + 1, offset + 2) = -(1 + a); 
ret(halfway + 1, offset + 3) = a; 
offset = offset + 1; 

for i = halfway + 2 : n - 1
   ret(i, offset + 1) = a; 
   ret(i, offset + 2) = -2 * a; 
   ret(i, offset + 3) = a; 
   offset = offset + 1; 
end

ret(n, n - 1) = a; 
ret(n, n) = -2 * a; 

end

