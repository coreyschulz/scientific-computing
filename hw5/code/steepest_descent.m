function [a, normResidual, iters] = steepest_descent(x,y, tolerance, degree, inputAlpha)
%STEEPEST_DESCENT 

%plot(x,y)
n = length(x) - 1;
np1 = n+1;
m = degree;
mp1 = m+1;
XX=zeros(np1,mp1); 
for i = 1:np1
    for j = 1:mp1
        XX(i,j) = x(i)^(j-1);
    end
end

%solution vectors
a = zeros(mp1,1);
aold = zeros(mp1,1);
%gradient vector
r = zeros(mp1,1);
res = zeros(np1,1);
res= y-XX*a;
normres = norm(res); 

normVal=Inf; 
itr = 0;
tol = tolerance;
fac = 2.0/n;
alpha = inputAlpha;

% Algorithm: Steepest Descent%%
%fprintf(' %i   %6.3f   %6.3f   %6.3f |  %6.3f   %6.3f    %6.3f |  %6.3f \n',itr,a(1),a(2),a(3),res(1),res(2),res(3),alpha)
while normVal>tol
 %while itr < 10
    aold=a;
    res = y-XX*a;
    normres= norm(res);
    for i = 1:mp1
        r(i) = 0;
        for j = 1:np1
            r(i) = r(i)+res(j)*XX(j,i);
        end
        r(i)= r(i)*fac;
    end
    a = a + alpha*r;
    itr=itr+1;
    normVal=abs(aold-a);
    %fprintf(' %i   %6.3f   %6.3f   %6.3f |  %6.3f   %6.3f    %6.3f |  %6.3f \n',itr,a(1),a(2),a(3),res(1),res(2),res(3),alpha)
    %
end

normResidual = normres; 
iters = itr; 

% fprintf('Solution of the system is %f %f %f %f %f \n  ',a);
% %
% fprintf('\n norm residual %f in %i iterations \n',normres,itr);
% z = linspace(x(1),x(11),101);
% fz = zeros(101,1);
% for i = 1:101
% fz(i)=0.0;
%     for j = 1:mp1
%         fz(i) = fz(i)+a(j)*z(i)^(j-1);
%     end
%    % fprintf('i= %i z %f fz %f \n',i,z(i),fz(i))
% end
% plot(x,y,z,fz)





end

