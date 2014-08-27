function [avg] = GetTileAverages(tiles)
%GetTileAverages Find the average amount of red, green and blue for all of
%the tiles in a list.
%   Input:
%       tiles: A 1 dimensional cell array containing a list of tiles.
%   Output:
%       avg: A 2 dimensional numerical array where each row corresponds to
%       the average red, green and blue values for a tile.

%Initiate the loop that will loop through the "tiles" cell array and
%produce a corresponding output with average red, green and blue values in
%the "avg" array.
for i=1:length(tiles)
        currentTile = tiles{i};
        [avg(i,1), avg(i,2), avg(i,3)] = GetAverageRGB(currentTile);
end
end

