image = zeros(200);
image(90:110, 80:120) = 1;

transformation_2 = fft2(image);
[m, n] = size(image);

real_part = real(transformation_2);
imaginary_part = imag(transformation_2);

figure(1), subplot(1, 2, 1), imshow(real_part, []);
subplot(1, 2, 2), imshow(imaginary_part, []);
