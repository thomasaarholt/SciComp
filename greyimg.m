%% --------------------------------------------------------
%% greyimg() function
% Code formats images with a colour axis from 0 to 1 (grey) and equal axis.

function [] = greyimg()
caxis([0 1])
colormap(gray)
axis equal, axis tight
end
%% --------------------------------------------------------