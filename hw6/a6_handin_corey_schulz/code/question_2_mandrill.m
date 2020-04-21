clear all; 
close all; 
hold on; 

load mandrill


% load the "gatlin" image data, built-in to MATLAB

[U,S,V] = svd(X);
 
% "gatlin" stores the image as the variable "X"

figure(1),clf
 % plot the singular values

semilogy(diag(S),'b.','markersize',20)


set(gca,'fontsize',16)

title('singular values of the "mandrill" image matrix')

xlabel('k'), ylabel('\sigma_k')
figure(2),clf

% plot the original image
gmap = gray; 

image(X), colormap(gmap)

% image: MATLAB command to display a matrix as image

axis equal, axis off
 
title('true image (rank 480)','fontsize',16)

figure(3),clf
 
% plot the rank-k approximation

k_values = [2 4 8 16 32 64 128]; % Image ranks 

for i = 1 : length(k_values)
    k = k_values(i); 
    
    Xk = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';

    figure, image(Xk), colormap(gmap)
    axis equal, axis off
    title(sprintf('best rank-%d approximation',k),'fontsize',16)
    
    %Save image in temp directory to see filesystem file size. 
    imwrite(Xk, gmap, sprintf('images/mandrill/rank-%d.jpg', k)); 
end


