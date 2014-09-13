function [imgArray] = GetGrid(image, tilesAcross, tileHeight, tileWidth)
%GetGrid will split an image up into a specified grid.
%   Inputs:
%       img = The image that will be broken down into tiles.
%       tilesAcross = The number of tiles that will go across the image.
%       tileHeight = The height of each tile.
%       tileWidth = The width of each tile.
%   Outputs:
%       imgArray = The cell array of the individual tiles that have been
%       created from the img input.

%Author: MAHNAC

%Work out the height, width and amount of colours in the image.
[imgHeight, imgWidth, colours] = size(image);

%Calculate the dimensions of the cells that we will use to break up the
%main image by calling the GetGridDimensions function.
[tilesDown, cellHeight, cellWidth] = GetGridDimensions(tilesAcross,...
    imgHeight, imgWidth, tileHeight, tileWidth);

%Initiate nested for loops that will step through the cell array "imgArray"
%and copy the corresponding cell from the main image "img" by calling the
%GetSubimage function.
for i=1:tilesDown
    for j=1:tilesAcross
        imgArray{i,j} = GetSubimage(image,(1+(i-1)*cellHeight):(i*cellHeight),...
            (1+(j-1)*cellWidth):(j*cellWidth));
    end
end
end

