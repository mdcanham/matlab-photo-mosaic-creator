function [tileIndex] = GetBestTile(grid, tile)
%GetBestTile This will return the best tiles to use to fill the grid.
%   Inputs:
%       grid = A 3 dimensional array that contains the average RGB values
%       for each of the cells.
%       tile = A 2 dimensional numerical array where each row corresponds 
%       to the average red, green and blue values for a tile.
%   Output:
%       tileIndex = The index number of the tile that should be used in the
%       place of the grid cell.

[rowsGrid, colsGrid, coloursGrid] = size(grid);
[rowsTile, colsTile, coloursTile] = size(tile);

for i=1:rowsGrid
    for j=1:colsGrid
        rSub = grid(i,j,1);
        gSub = grid(i,j,2);
        bSub = grid(i,j,3);
        for k=1:rowsTile
            mTemp(k) = abs(tile(k,1)-rSub) + abs(tile(k,2)-gSub) + ...
                abs(tile(k,3)-bSub);
        end
        [minimum,index] = min(mTemp);
        tileIndex(i,j) = minimum;
    end
end
end

