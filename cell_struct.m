% Creates a cell array of structures 1x2

cell_struct = cell(1, 2);
cell_struct{1}.label = '01/07/2020';
cell_struct{1}.obs = [10 20 30; 40 50 60];
cell_struct{2}.xcoordinates = [-0.05 0.33 1.22];
cell_struct{2}.ycoordinates = [1.2 4 0.11];
cell_struct{2}.zcoordinates = [0.5 0.9 1.2];

% Prints the content of the first struct
cell_struct{1,1}

% Prints the content of the second struct
cell_struct{1,2}
