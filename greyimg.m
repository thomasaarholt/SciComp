%% Code formats images the way I want them

function [] = greyimg()
caxis([0 1])
colormap(gray)
axis equal, axis tight
end