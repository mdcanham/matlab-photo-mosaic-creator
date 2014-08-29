function [mosaic] = AssembleMosaic(index,images)
%AssembleMosaic Return the final assembled mosaic as an RGB image.
%   Input:
%       index = A 2 dimensional array containing the index of the best
%       tile to select.
%       images = A 1 dimensional cell array containing the RGB images for
%       the tiles.
%   Output:
%       mosaic = The final assembled mosaic as a 3 dimensional RGB image.

[rows, cols] = size(index)

for i=1:rows
    for j=1:cols
        mosaic{i,j} = images{index(i,j)};
    end
end

mosaic = cell2mat(mosaic);

end

