function out=pixel_wise_processing(imname,fun_type,varargin)
% Read the image
im=im2double(imread(imname));

% Switch based on function name provided
if strcmp(fun_type,'neg')
    % Logical negation
     out=255-im;
elseif strcmp(fun_type,'gam')
    % Gamma transformation
    C=varargin{1};
    gamma=varargin{2};
    out=C*im.^gamma;
elseif strcmp(fun_type,'stretch')
    % Contrast stretching
    m=varargin{1};
    E=varargin{2};
    out=255./(1+(m./im).^E);
elseif strcmp(fun_type,'log')
    % Logarithmic transformation
    C=varargin{1};
    out=C*log(im+1);
elseif strcmp(fun_type,'thresh')
    % Tresholding
    T=varargin{1};
    out=im>=T;
else
    disp('wrong function')
end

% Draw both images
subplot(1,2,1), imshow(im)
subplot(1,2,2), imshow(out,[])

end
