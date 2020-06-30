% Create a square matrix (A) with size (16,16);
% Set all the matrix (A) values to zero;
% Create a rectangular matrix (B) with size (4,2)
% Set all the matrix (B) values to 1;
% Insert the matrix B in the middle of the matrix A;
% Set the values of the first two rows and last two
% Row of the matrix A to 1;
% Set the values of the first two columns and last two columns of the matrix A to 1;
% Compute the sum over the columns and over the rows

A = zeros(16, 16);
B = ones(4, 2);
A(7:10, 8:9) = B;
A([1:2, 15:16], :) = 1; % rows 1,2 and 15,16
A(:, [1:2, 15:16]) = 1; % columns 1,2 and 15,16