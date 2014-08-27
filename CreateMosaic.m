% Create a mosaic using the following algorithm to create a photomosaic
%
% 1. Read in a list of tiles (small images or "thumb nails")
% 2. Calculate the average RGB values for each tile
% 3. Read in an image to create a mosaic for
% 4. Make a grid over the image
% 5. For each cell on the grid calculate the average RGB values
% 6. For each cell on the grid find the closest match from the list 
%    of tiles 
% 7. Assemble the matched tiles together into an image
%
% Note that only the GetTiles function is supplied, the remaining
% functions will need to be implemented by you.  
% See the project document for more detailed information.
% Author: Peter Bier
clear

% Read in library of tiles from specified image directory
% using the supplied GetTiles function
% Note you can download two directorys of tile images from cecil
% The flowerTiles directory contains 500 flower images in png format,
% all of which are 30 pixels high and 40 pixels wide 
% (Note these were sourced from flickr, a website for sharing photos)
% The colourTiles directory contains 5 solid colour images in png format, 
% all of which are 30 pixels high and 30 pixels wide
 tiles = GetTiles('flowerTiles','png');

% Figure out the average RGB values for all tiles in the library
tileAverages = GetTileAverages(tiles);

% Determine tile size by extracting the first tile
[tileHeight,tileWidth,tileColours] = size(tiles{1});
    
% Read in an image to create a mosaic for
% When debugging you may like to hardcode a test image name to save you
% typing in the name each time. For example you could have the line:
% imageName = 'mandrill.png';
% Note that mandrill.png contains a very famous image of a Mandrill (which is
% a type of monkey).  This image is frequently used as a standard test image 
% for image processing algorithms within the computer graphics community
imageName = input('Please enter the filename of an image to create a mosaic for:','s');
M = imread(imageName);

% Get the number of tiles to go across the grid
numberOfTilesAcrossGrid = input('How many tiles do you want across the image?');
% Construct a grid of images 
gridImages = GetGrid(M,numberOfTilesAcrossGrid,tileHeight,tileWidth);

% Calculate array of averages for grid,
% i.e. average colour values for each cell (subimage) in the grid
gridAverages = GetGridAverages(gridImages);

% Find best tile for each image, based on the average RGB values 
bestTiles = GetBestTiles(gridAverages,tileAverages);

% Assemble complete mosaic from the array of bestTiles 
Mosaic = AssembleMosaic(bestTiles,tiles);

% Write the mosaic to a jpg file
imwrite(Mosaic,'mosaic.jpg');

% Display the Mosaic to the screen
figure(1)
% Note if you have the Matlab Image Processing Toolkit as part of your
% Matlab installation you can use imshow(Mosaic) in place of the three lines 
% of code below, which will display your image in a more elegant fashion
image(Mosaic);
axis equal
set(gca,'Color',get(gcf,'Color')) % set axes color to figure color
    