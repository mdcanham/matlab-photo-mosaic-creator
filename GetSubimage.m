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

%Initalise the loop that will create the output subimage using the 3 input
%argumants.
for i = 1:length(rows)
    for j = 1:length(cols)
        subimage(i,j,1) = img(rows(i),cols(j),1);
        subimage(i,j,2) = img(rows(i),cols(j),2);
        subimage(i,j,3) = img(rows(i),cols(j),3);
    end
end
end

