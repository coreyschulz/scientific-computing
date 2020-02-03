clear all;
close all;
hold on; 

u = linspace(0, 1, 1001);
ySample = hubbard(u, .25);
iplot = 0;
degrees = [28 36 44 52 60];

n = 1001; 
b = 1; 
a = 0; 

for i = 1 : 5
    
  %%%%%%%% LINEAR %%%%%%%%%%
  deg = degrees(i);
  x = linspace(0,1,deg + 1);
  y = hubbard(x, .25);
  result = polyinterp(x, y ,u);
  
  % Error: 
  errorLinspace = result - ySample';
  l1Linspace = ((b - a) / (n - 1)) * norm(errorLinspace, 1);
  l2Linspace = sqrt((b - a) / (n - 1)) * norm(errorLinspace, 2);
  lInfLinspace = norm(errorLinspace, Inf);
  %%%%%%%% END LINEAR CALCULATIONS %%%%%%%%%%
  
  %%%%%%%% CHEBYSHEV %%%%%%%%%%
  chebyLin = linspace(0,deg+1,deg+1);
  yo = cos(pi * chebyLin / deg);
  xCheby = (1 - yo) / 2;
  yCheby = hubbard(xCheby, .25);
  resultCheby = polyinterp(xCheby,yCheby,u);
  
  % Error: 
  errorCheby = resultCheby - ySample';
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
  legend('Data', 'polyinterp results');
  title(sprintf('Equal spacing: n = %d',deg)); 
  
  subplot(2,2,[3 4]);
  plot(xCheby ,yCheby,'o',u,resultCheby,'b');
  legend('Data', 'polyinterp results');
  title(sprintf('Chebyshev: n = %d',deg)); 

end