function [tilesDown, cellHeight, cellWidth] = GetGridDimensions...
    (tilesAcross, imgHeight,imgWidth, tileHeight, tileWidth)
%GetGridDimensions Returns all of the data necessary to create a grid.
%   Inputs:
%       tilesAcross = The number of tiles that will go across the image.
%       imgHeight = The height of the image to create the grid for.
%       imgWidth = The width of the image to create the grid for.
%       tileHeight = The height of the tiles that we will use.
%       tileWidth =  The width of the tiles that we will use.
%   Outputs:
%       tilesDown = The number of tiles that will go down the page.
%       cellHeight = The height of each cell on the grid.
%       cellWidth = The width of each cell on the grid.

%Calculate the cellWidth and round it down.
cellWidth = floor(imgWidth/tilesAcross);

%Calculate the cellHieght and round it down.
cellHeight = floor(cellWidth*(tileHeight/tileWidth));

%Calculate the number of tiles that will be going downwards.
tilesDown = floor(imgHeight/cellHeight);

end

