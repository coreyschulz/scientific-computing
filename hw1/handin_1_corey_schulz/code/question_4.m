clear all;
close all;
hold on; 

uHubbard = linspace(0, 1, 1001); 
ySampleHubbard = hubbard(uHubbard, .25); 

uGelb = linspace(-1, 1, 1001);
ySampleGelb = GelbTanner(uGelb);

iplot = 0;
degrees = [28 36 44 52 60];

n = 1001; 
b = 1; 
aGelb = -1;
aHubbard = 0; 

counter = 1; 

for i = 1 : 5
  %%%%%%%% HUBBARD %%%%%%%%%%
  deg = degrees(i);
  xHubbard = linspace(0, 1, deg + 1);
  yHubbard = hubbard(xHubbard, .25);
  pHubbard = pchip(xHubbard, yHubbard, uHubbard); 
  sHubbard = spline(xHubbard, yHubbard, uHubbard); 
  
  % Error: 
  errorPchipHubbard = pHubbard - ySampleHubbard';
  l1PchipHubbard = ((b - aHubbard) / (n - 1)) * norm(errorPchipHubbard, 1);
  l2PchipHubbard = sqrt((b - aHubbard) / (n - 1)) * norm(errorPchipHubbard, 2);
  lInfPchipHubbard = norm(errorPchipHubbard, Inf);
  
  errorSplineHubbard = sHubbard - ySampleHubbard'; 
  l1SplineHubbard = ((b - aHubbard) / (n - 1)) * norm(errorSplineHubbard, 1);
  l2SplineHubbard = sqrt((b - aHubbard) / (n - 1)) * norm(errorSplineHubbard, 2);
  lInfSplineHubbard = norm(errorSplineHubbard, Inf);
  %%%%%%%% END HUBBARD %%%%%%%%%%
  
  %%%%%%%% GELB TANNER %%%%%%%%%%
  xGelb = linspace(-1, 1, deg + 1); 
  yGelb = GelbTanner(xGelb); 
  pGelb = pchip(xGelb, yGelb, uGelb); 
  sGelb = spline(xGelb, yGelb, uGelb); 
  
  % Error: 
  errorPchipGelb = pGelb - ySampleGelb'; 
  l1PchipGelb = ((b - aGelb) / (n - 1)) * norm(errorPchipGelb, 1);
  l2PchipGelb = sqrt((b - aGelb) / (n - 1)) * norm(errorPchipGelb, 2);
  lInfPchipGelb = norm(errorPchipGelb, Inf); 
  
  errorSplineGelb = sGelb - ySampleGelb'; 
  l1SplineGelb = ((b - aGelb) / (n - 1)) * norm(errorSplineGelb, 1);
  l2SplineGelb = sqrt((b - aGelb) / (n - 1)) * norm(errorSplineGelb, 2);
  lInfSplineGelb = norm(errorSplineGelb, Inf); 
  %%%%%%%% END GELB TANNER %%%%%%%%%%
 
  
  %%%%%%%% DISPLAY DATA %%%%%%%%%%
  fprintf('##### n = %d ##### \n',deg);
  disp('PCHIP HUBBARD');
  fprintf('L1: %i\n', l1PchipHubbard);
  fprintf('L2: %i\n', l2PchipHubbard);
  fprintf('L-Inf: %i\n', lInfPchipHubbard);
  disp('SPLINE HUBBARD'); 
  fprintf('L1: %i\n', l1SplineHubbard);
  fprintf('L2: %i\n', l2SplineHubbard);
  fprintf('L-Inf: %i\n', lInfSplineHubbard);
  fprintf('\n\n'); 
  
  disp('PCHIP GELB TANNER');
  fprintf('L1: %i\n', l1PchipGelb);
  fprintf('L2: %i\n', l2PchipGelb);
  fprintf('L-Inf: %i\n', lInfPchipGelb);
  disp('SPLINE GELB TANNER'); 
  fprintf('L1: %i\n', l1SplineGelb);
  fprintf('L2: %i\n', l2SplineGelb);
  fprintf('L-Inf: %i\n', lInfSplineGelb);
  fprintf('###############\n\n'); 

  % Plot Graphs: 
  figure(counter); 
  counter = counter + 1; 
  subplot(2,1,1);
  plot(xHubbard,yHubbard,'o',uHubbard,pHubbard,'-',uHubbard,sHubbard,'-.'); 
  legend('SAMPLE', 'PCHIP', 'spline'); 
  title(sprintf('Hubbard Spline and PCHIP n = %d',deg)); 
  
  subplot(2,1,2);
  plot(xGelb,yGelb,'o',uGelb,pGelb,'-',uGelb,sGelb,'-.');
  legend('Sample Points', 'PCHIP', 'spline');
  title(sprintf('GelbTanner Spline and PCHIP n = %d',deg));
  
  % Plot errors: 
  figure(counter); 
  counter = counter + 1; 
  subplot(2,1,1);
  plot(uHubbard, errorPchipHubbard, uHubbard, errorSplineHubbard);
  legend('PCHIP error', 'spline error');
  title(sprintf('Hubbard Spline and PCHIP Errors n = %d',deg));
  
  subplot(2,1,2);
  plot(uGelb, errorPchipGelb, uGelb, errorSplineGelb);
  legend('PCHIP error', 'spline error');
  title(sprintf('Gelb Tanner Spline and PCHIP Errors n = %d',deg));

end