function [subimage] = GetSubimage(img,rows,cols)
%GetSubimage will extract a small rectangular image from a larger image.
%   Inputs:
%       img = The large image that the small images will be extracted from.
%       rows = The 1 dimensional array containing the row numbers that need
%       to be extracted from the larger image.
%       cols = The 1 dimensional array containing the column numbers that 
%       need to be extracted from the larger image.
%   Output:
%       subimage = The RGB image stored in a 3D array that has been
%       extracted from the larger image

%Author: MAHNAC

%Extract the subimage that has been requested from the original image.
subimage = img(rows,cols,1:3);

end

