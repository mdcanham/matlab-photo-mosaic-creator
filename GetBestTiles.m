function [tileIndex] = GetBestTiles(grid, tile)
%GetBestTile This will return the best tiles to use to fill the grid.
%   Inputs:
%       grid = A 3 dimensional array that contains the average RGB values
%       for each of the cells.
%       tile = A 2 dimensional numerical array where each row corresponds 
%       to the average red, green and blue values for a tile.
%   Output:
%       tileIndex = The index number of the tile that should be used in the
%       place of the grid cell.

%Calculate the number of rows and the number of columns in both the grid
%and the tile inputs to the function.
[rowsGrid, colsGrid, coloursGrid] = size(grid);
[rowsTile, colsTile, coloursTile] = size(tile);

%Initalise the loop through the rows and columns of the grid.
for i=1:rowsGrid
    for j=1:colsGrid
        %Find the red, green and blue values for each of the tiles on
        %the grid.
        rSub = grid(i,j,1);
        gSub = grid(i,j,2);
        bSub = grid(i,j,3);
        
        %Loop through the rows of a tile to find the average red, green and
        %blue values.
        for k=1:rowsTile
            %Apply the supplied algorith to a temporary variable mTemp.
            mTemp(k) = abs(tile(k,1)-rSub) + abs(tile(k,2)-gSub) + ...
                abs(tile(k,3)-bSub);
        end
        %Extract the lowest index value of the minimum value for mTemp.
        [minimum,index] = min(mTemp);
        
        %Apply this index value to a seperate matrix to be output from the 
        %function.
        tileIndex(i,j) = index;
    end
end
end

