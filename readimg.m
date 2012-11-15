%% Code reads a square greyscale image, passes it to u

function [u] = readimg(imgstring)
u = imread(imgstring);
u = double(u) / 255;

[n,n2] = size(u);
if (n ~= n2)
  error('by default, this only supports square images')
end
end