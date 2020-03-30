% Function for pixel-wise processing
% Takes an image and pixel-wise method name as parameters

function out=pixel_fun(imagename, fun_type, varargin)
im=im2double(imread(imagename));
if strcmp(fun_type, 'neg')
    out=255-im;
elseif strcmp(fun_type, 'gam')
    C=varargin{1};
    gamma=varargin{2};
    out=C*im.^gamma;
elseif strcmp(fun_type, 'stretch')
    m=varargin{1};
    E=varargin{2};
    out=255./(1+(m./im).^E);
elseif strcmp(fun_type, 'log')
    C=varargin{1};
    out=C*log(im+1);
elseif strcmp(fun_type, 'thresh')
    T=varargin{1};
    out=im>=T;
else
    disp('wrong function')
end
subplot(1,2,1), imshow(im)
subplot(1,2,2), imshow(out, [])


% Usage Examples
% out=pixel_fun('pout.tif', 'gam', 1, 5);
% out=pixel_fun('pout.tif', 'gam', 1, 2);
% out=pixel_fun('pout.tif', 'gam', 1, 0.5);
% out=pixel_fun('pout.tif', 'gam', 1, 0.1);
% out=pixel_fun('pout.tif', 'log', 1);
% out=pixel_fun('pout.tif', 'log', 10);
% out=pixel_fun('pout.tif', 'log', 0);
% out=pixel_fun('pout.tif', 'stretch', 0.4, 0);
% out=pixel_fun('pout.tif', 'stretch', 0.5, 1);
% out=pixel_fun('pout.tif', 'stretch', 0.5, 2);
% out=pixel_fun('pout.tif', 'stretch', 0.5, 20);
% out=pixel_fun('pout.tif', 'gam', 1, 2);
% out=pixel_fun('pout.tif', 'gam', 1, 0.5);
% out=pixel_fun('pout.tif', 'gam', 1, 0.1);
% out=pixel_fun('pout.tif', 'gam', 1,25);
% out=pixel_fun('pout.tif', 'stretch', 0.4, 0);
% out=pixel_fun('pout.tif', 'stretch', 0.5, 1);
% out=pixel_fun('pout.tif', 'stretch', 0.5, 2);
% out=pixel_fun('pout.tif', 'stretch', 0.5, 20);
