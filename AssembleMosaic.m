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
[rows, cols] = size(index);

%Calculate the height and width of the tiles that we will be using by
%assesing the fist tile in the images cell array.
[height, width, colours] = size(images{1});

%Piece together the mosaic by arranging the flower tiles in the correct
%positions in an array.
for i=1:rows
    for j=1:cols
        mosaic((1+(i-1)*height):(i*height),(1+(j-1)*width):(j*width),1:3)...
            = images{index(i,j)};
    end
end
end

