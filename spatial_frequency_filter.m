% Edge detector
image = double(imread('cameraman.tif'));
[row, column] = size(image);

% Spatial filtering
h = fspecial('sobel');
imageOut = imfilter(image, h);
subplot(3, 4, 1), imshow(image, []);
subplot(3, 4, 2), imshow(abs(imageOut), []), title('Filtered in space');

[x, y] = ndgrid(0:r-1, 0:c-1);
mat = (-1).^(x + y);
image = image.*mat;
t = 600;
H = freqz2(h, [t, t]);
F = fft2(image, t, t);

G = H.*F;
subplot(3, 4, 6), imshow(log(abs(F) + 1), []), title('F(u, v)');
subplot(3, 4, 7), imshow(log(abs(H) + 1), []), title('H(u, v)');
subplot(3, 4, 8), imshow(log(abs(G) + 1), []), title('G(u, v)');

imT = real(ifft2(G));
imT2 = imT(1:r, 1:c).*mat;
subplot(3, 4, 11), imshow(abs(imT), []), title('Frequency in frequency');
subplot(3, 4, 12), imshow(abs(imT2), []), title('Multiplied by -1^(x+y)');
