image = imread('coins.png');

gaussian = imnoise(image, 'gaussian');
salt_pepper = imnoise(image, 'salt & pepper');
poisson = imnoise(image, 'poisson');

average_filter = fspecial('average', 3);

restored_gaussian = imfilter(gaussian, average_filter);
restored_salt_pepper = medfilt2(salt_pepper);
restored_poisson = medfilt2(poisson);

subplot(2, 3, 1), imshow(gaussian);
subplot(2, 3, 2), imshow(salt_pepper);
subplot(2, 3, 3), imshow(poisson);
subplot(2, 3, 4), imshow(restored_gaussian);
subplot(2, 3, 5), imshow(restored_salt_pepper);
subplot(2, 3, 6), imshow(restored_poisson);

% Cast values to double
image = im2double(image);
gaussian = im2double(gaussian);
salt_pepper = im2double(salt_pepper);
poisson = im2double(poisson);
restored_gaussian = im2double(restored_gaussian);
restored_salt_pepper = im2double(restored_salt_pepper);
restored_poisson = im2double(restored_poisson);

fprintf("MSE\n");
fprintf("Rumor\t\tDegraded\tRestored\n");
fprintf("Gaussian\t%f\t%f\n", immse(gaussian, image),immse(restored_gaussian, image));
fprintf("Salt&Pepper\t%f\t%f\n", immse(salt_pepper, image),immse(restored_salt_pepper, image));
fprintf("Poisson\t\t%f\t%f\n", immse(poisson, image),immse(restored_poisson, image));

fprintf("\n");

fprintf("PSNR\n");
fprintf("Rumor\t\tDegraded\tRestored\n");
fprintf("Gaussian\t%f\t%f\n", psnr(gaussian, image),psnr(restored_gaussian, image));
fprintf("Salt&Pepper\t%f\t%f\n", psnr(salt_pepper, image),psnr(restored_salt_pepper, image));
fprintf("Poisson\t\t%f\t%f\n", psnr(poisson, image),psnr(restored_poisson, image));

% Results
% MSE
% Rumor         Degraded	Restored
% Gaussian      0.009783	0.002344
% Salt&Pepper	0.015347	0.000463
% Poisson		0.001564	0.000728
% 
% PSNR
% Rumor         Degraded	Restored
% Gaussian      20.095423	26.300368
% Salt&Pepper	18.139625	33.345559
% Poisson		28.058359	31.378940
