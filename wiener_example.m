image = im2double(imread('cameraman.tif'));
figure(5)

h = fspecial('motion', 21, 11);
image1 = imfilter(image, h, 'conv', 'circular');
image_out1 = deconvwnr(image1, h, 0);

image2 = imnoise(image1, 'gaussian', 0, 0.0001);
image_out2 = deconvwnr(image2, h, 0);

variance_1 = 0.001;
variance_2 = var(im2double(image2(:)));
NSR = variance_1 / variance_2;
image_out3 = deconvwnr(image2, h, NSR);

subplot(2, 3, 1), imshow(image);
subplot(2, 3, 2),imshow(image1);
subplot(2, 3, 3), imshow(image_out1);
subplot(2, 3, 4), imshow(image2);
subplot(2, 3, 5), imshow(image_out2);
subplot(2, 3, 6), imshow(image_out3);
