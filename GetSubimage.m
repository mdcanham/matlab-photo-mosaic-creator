function [subimage] = GetSubimage(img,rows,cols)
%GetSubimage Extract a small rectangular image from a larger image.
%   Inputs:
%       img = The large image that the small images will be extracted from.
%       rows = The 1 dimentional array containing the row numbers that need
%       to be extracted from the larger image.
%       cols = The 1 dimentional array containing the column numbers that 
%       need to be extracted from the larger image.
%   Output:
%       subimage = The RGB image stored in a 3D array that has been
%       extracted from the larger image

%Extract the subimage from the original image.
subimage = img(rows,cols,1:3)
end

