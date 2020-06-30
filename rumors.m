% Apply various types of noise to the same image in order to 
% obtain many images each corresponding to a noise model (gaussian, impulse, etc.)
% Study the noise on a small patch with an almost uniform grayscale
% value and draw conclusions on noise parameter interpretation. 
% (Use imcrop to crop patches)

img=imread("coins.png");
[m , n]=size(img);
J_gaussiana=imnoise(img, 'gaussian', 0, 0.01);
J_gaussiana2=imnoise(img, 'gaussian', 0, 0.1);
% % matrix=random(5, 5);
% % J_localvar=imnoise(img, 'localvar', matrix);
% % J_localvar2=imnoise(img, 'localvar', img_intensity, var);
J_salePepe=imnoise(img, 'salt & pepper', 0.1);
J_poisson=imnoise(img, 'poisson');
J_speckle=imnoise(img, 'speckle', 0.1);

figure(1)
subplot(2,6,1), imshow(img), title("originale");  %alte frequenze - tolte  
subplot(2,6,2), imshow(J_gaussiana), title("J_gaussiana"); %in teoria solo bianco centrale 
subplot(2,6,3), imshow(J_gaussiana2), title("gaussiana2");
subplot(2,6,4), imshow(J_salePepe), title("sale e pepe");
subplot(2,6,5), imshow(J_poisson), title("Poisson");
subplot(2,6,6), imshow(J_speckle), title("speckle");
subplot(2,6,7), imhist(img), title("originale");  %alte frequenze - tolte  
subplot(2,6,8), imhist(J_gaussiana), title("J_gaussiana"); %in teoria solo bianco centrale 
subplot(2,6,9), imhist(J_gaussiana2), title("gaussiana2");
subplot(2,6,10), imhist(J_salePepe), title("sale e pepe");
subplot(2,6,11), imhist(J_poisson), title("Poisson");
subplot(2,6,12), imhist(J_speckle), title("speckle");

Im6=min(1,max(0, im2double(img)+0.5*(rand(m,n)-0.5)));
Im6=im2double(img)+0.2*(rand(m,n));
figure(2)
subplot(1,2,1), imshow(Im6);
subplot(1,2,2), imhist(Im6);

figure(3);
Im7=imcrop(J_speckle);
imhist(Im7);