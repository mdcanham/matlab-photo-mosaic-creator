function [imgArray] = GetGrid(img, tilesAcross, tileHeight, tileWidth)
%GetGrid Splits an image up into a specified grid.
%   Inputs:
%       img = The image that will be broken down into tiles.
%       tilesAcross = The number of tiles that will go across the image.
%       tileHeight = The height of each tile.
%       tileWidth = The width of each tile.
%   Outputs:
%       imgArray = The cell array of the individual tiles that have been
%       created from the img input.

%Work out the height, width and amount of colours in the image.
[imgHeight, imgWidth, colours] = size(img);

%Calculate the dimensions of the cells that we will use to break up the
%main image.
[tilesDown, cellHeight, cellWidth] = GetGridDimensions(tilesAcross,...
    imgHeight, imgWidth, tileHeight, tileWidth);

%Initalise counter variables.
acrossCount = 1;
downCount = 1;

%Initiate nested for loops that will step through the cell array "imgArray"
%and copy the corresponding cell from the main image "img".
for i=1:tilesDown
    for j=1:tilesAcross
        imgArray{i,j} = GetSubimage(img,downCount:downCount+cellHeight-1,...
            acrossCount:acrossCount+cellWidth-1);
        acrossCount = acrossCount + cellWidth;
    end
    acrossCount = 1;
    downCount = downCount+cellHeight;
end
end

