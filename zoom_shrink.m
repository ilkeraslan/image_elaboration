function out = zoom_shrink(image, operationType, factor)
% Zooms or shrinks the image based on the operation type and the given factor
% Factor should be integer

[m, n] = size(image);

if strcmp(operationType, 'zoom')
    m2 = m * factor;
    n2 = n * factor;
    out = zeros(m2, n2);
    for i=1:m
        for j=1:n
            out(factor*i - factor+1 : factor*i, factor*j - factor+1 : factor*j) = image(i, j);
        end
    end
elseif strcmp(operationType, 'shrink')
    m2 = round(m / factor);
    n2 = round(n / factor);
    out = zeros(m2, n2);
    for i=1:factor:m
       for j=1:factor:n
           i2 = floor(i / factor) + 1;
           j2 = floor(j / factor) + 1;
           out(i2, j2) = image(i, j);
       end
    end
end

out = uint8(out);
imshow(out);

end
