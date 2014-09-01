function [mosaic] = AssembleMosaic(index,images)
%AssembleMosaic Return the final assembled mosaic as an RGB image.
%   Input:
%       index = A 2 dimensional array containing the index of the best
%       tile to select.
%       images = A 1 dimensional cell array containing the RGB images for
%       the tiles.
%   Output:
%       mosaic = The final assembled mosaic as a 3 dimensional RGB image.

%Find the number of rows and the number of columns corresponding to the
%number of tiles in our image.
[rows, cols] = size(index)

%Piece together the mosaic by arranging the flower tiles in the correct
%positions in a cell array. Note: this cell array is not the final 3D array
%that we will use to create our image.
for i=1:rows
    for j=1:cols
        mosaic{i,j} = images{index(i,j)};
    end
end

%Transform the mosaic cell array into the final 3D matrix that represents
%our image.
mosaic = cell2mat(mosaic);

end

