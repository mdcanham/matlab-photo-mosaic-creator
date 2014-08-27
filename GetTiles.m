function [ tiles ] = GetTiles( directory, imageType )
% GetTiles loads all image files from the specified directory that match
% the imageType file extension and returns them in a cell array structure.
% Valid values for imageType are bmp,gif,jpg,jpeg,png,tif,tiff
% 
% To pick up all the .png files from a directory called images use:
% tiles = GetTiles('images','png')
%
% If no tiles were found an error message is displayed and an empty cell
% array returned.
% Author: Peter Bier

% check the imageType is valid
validFormats = 'bmp,gif,jpg,jpeg,png,tif,tiff';
if( length(imageType) < 3 || length(strfind(imageType,',')) > 0 || ...
    length(strfind(validFormats, imageType)) == 0  )
    disp('ERROR: you did not specify a valid image format');
    disp('Here is a list of valid image formats:')
    disp(validFormats);
    tiles = {};
    return;
end

% grab a list of all files in the directory that match the specified
% imageType file extension
listing = dir([directory '/*.' imageType]);
n = size(listing,1);

% we need at least one file in the directory
if n < 1
    disp('ERROR: No files read');
    disp(['Please check the directory ' directory ' exists and that it']);
    disp(['contains image files with a .' imageType ' file extension.'])
    tiles = {};
else
    disp(['Loading ' num2str(n) ' tiles']);
    for i =1:n
        imageName = listing(i).name;
        tiles{i} = imread([directory '/' imageName],imageType);
    end
end

end

