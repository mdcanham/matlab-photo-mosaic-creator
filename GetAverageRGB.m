function [r g b] = GetAverageRGB(img)
%GetAverageRGB Find the average amount of red, green and blue in an image.
%   Input:
%       img = A 3D array containing an RGB image.
%   Output:
%       r = The average amount of red in the image supplied.
%       g = The average amount of green in the image supplied.
%       b = The average amount of blue in the image supplied.

%Calculate the number of rows, columns and colours in the image supplied.
[rows, cols, colours] = size(img);

%Initialise the counting variables that we will use in the following loop
rTotal = 0;
gTotal = 0;
bTotal = 0;

%Loop through all of the rows and columns in the image supplied and sum the
%total red, green and blue values.
for i=1:rows
    for j=1:cols
        rTotal = rTotal + double(img(i,j,1));
        gTotal = gTotal + double(img(i,j,2));
        bTotal = bTotal + double(img(i,j,3));
    end
end

%Now calculate the average the amount of red, green and blue across all
%pixels in the image.
r = floor(rTotal/(rows*cols));
g = floor(gTotal/(rows*cols));
b = floor(bTotal/(rows*cols));

end

