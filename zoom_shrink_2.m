function out1=zoom_shrink_2(im,mout)
% Zooms or shrinks the given image using Bilinear Interpolation method

[m,n]=size(im);

if m>=mout
    f1=round(m/mout);
    f2=m/mout;
    op='s';
else
    f1=round(mout/m);
    f2=f1;
    op='z';
end

out1=zoomshrink(im,op,f1);
out2=imresize(im,f2,'bilinear');

subplot(1,2,1),imshow(out1);
subplot(1,2,2),imshow(out2);

end
