clear all;
close all;
hold on; 

u = linspace(-1, 1, 1001);
ySample = GelbTanner(u);
iplot = 0;
degrees = [28 36 44 52 60];

n = 1001; 
b = 1; 
a = -1; 

for i = 1 : 5
    
  %%%%%%%% LINEAR GELB TANNER %%%%%%%%%%
  deg = degrees(i);
  x = linspace(-1, 1, deg + 1);
  y = GelbTanner(x);
  result = polyinterp(x, y ,u);
  
  % Error: 
  errorLinspace = result - ySample';
  l1Linspace = ((b - a) / (n - 1)) * norm(errorLinspace, 1);
  l2Linspace = sqrt((b - a) / (n - 1)) * norm(errorLinspace, 2);
  lInfLinspace = norm(errorLinspace, Inf);
  %%%%%%%% END LINEAR GELB TANNER CALCULATIONS %%%%%%%%%%
  
  %%%%%%%% CHEBYSHEV %%%%%%%%%%
  chebyLin = linspace(0,deg+1,deg+1);
  yo = cos(pi * chebyLin / deg);
  xCheby = yo;
  yCheby = GelbTanner(xCheby);
  chebyResult = polyinterp(xCheby, yCheby, u);
  
  % Error: 
  errorCheby = chebyResult - ySample';
  L1Cheby = ((b - a) / (n - 1)) * norm(errorCheby, 1);
  L2Cheby = sqrt((b - a) / (n - 1)) * norm(errorCheby, 2);
  LInfCheby = norm(errorCheby, Inf);
  %%%%%%%% END CHEBYSHEV CALCULATIONS %%%%%%%%%%
  

  %%%%%%%% DISPLAY DATA %%%%%%%%%%
  fprintf('##### n = %d ##### \n',deg);
  disp('Equal Spacing');
  fprintf('L1: %i\n', l1Linspace);
  fprintf('L2: %i\n', l2Linspace);
  fprintf('L-Inf: %i\n', lInfLinspace);
  disp('Chebyshev'); 
  fprintf('L1: %i\n', L1Cheby);
  fprintf('L2: %i\n', L2Cheby);
  fprintf('L-Inf: %i\n', LInfCheby);
  disp('###############'); 

  figure(i); 
  subplot(2,2,[1 2]);
  plot(x, y, 'o', u, result, 'b'); 
  grid on; 
  legend('Data', 'polyinterp results');
  title(sprintf('Equal spacing: n = %d',deg)); 
  
  subplot(2,2,[3 4]);
  plot(xCheby ,yCheby,'o',u,chebyResult,'b');
  grid on; 
  legend('Data', 'polyinterp results');
  title(sprintf('Chebyshev: n = %d',deg)); 

end