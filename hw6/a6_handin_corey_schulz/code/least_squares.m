function least_squares(xValues, yValues, mValue)
%LEAST_SQUARES Summary of this function goes here
%   Detailed explanation goes here

   for nn = 1:8
       n = nn*10 +1;
       for mm =1:nn
           m = mm*4+1;
           
    m = 9;
    imeth=0;  % 0 gives normal equations
    %n= 7;
    x = xValues;
    nxx =1001;
    xx = linspace(0,1,nxx);
    vv=zeros(nxx,1);
    error = zeros(nxx,1);
    vyy=exp(xx);
    y = yValues';
   % m= 3;
   % m=11;
    A = zeros(n,m);
     for jj = 1:n
        for ii = 1:m
            A(jj,ii) = x(jj)^(ii-1);          
        end
     end
     if(imeth == 0)
        A;
        C = A';
        yy= C*y;
        B = C*A;
        v= B\yy;
        %B
        CO =cond(B);
        fprintf(' n= %i m = %i cond = %7.2e \n',n,m,CO)
     else
         [Q,R]=qr(A);
         yy = Q'*y;
         v = R\yy;
     end    
    elsqsum=0.0;
    for ii = 1:nxx
        for jj=1:m
            vv(ii) = vv(ii)+v(jj)*xx(ii)^(jj-1);
        end
        error(ii) = vv(ii)-vyy(ii);
        elsqsum = elsqsum+error(ii)*error(ii);
    end
    elsqsum = sqrt(elsqsum);
   plot(xx,vyy,xx,vv)
    fprintf('imeth= %i n=%i m=%i sqrt(errlsq) = %e \n',imeth,n,m,elsqsum)      
       end
   end




end

