Im = imread('pout.tif');
[m, n] = size(Im);
figure(8), subplot(2, 3, 1), imshow(Im)
f0x = 3;
f0y = 5;
[x, y] = meshgrid(1:n, 1:m);
P = (1 + sin(x/f0x + y/f0y))/2;

imout = im2double(Im) + P;
imout = mat2gray(imout);
subplot(2, 3, 2), imshow(imout);

t = 600;

F = fftshift(fft2(imout, t, t));
subplot(2, 3, 4), imshow(log(abs(F) + 1), []);