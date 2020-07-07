function out = pixel_wise(Image, threshold)
% threshold is the threshold value
% Pixel-wise image processing example
out = Image;
out(Image>threshold) = 255;
out(Image<threshold) = 0;
subplot(1,2,1), imshow(Image, []), title('Original Image');
subplot(1,2,2), imshow(out, []), title(['Image with threshold ', int2str(threshold)]);
end
