%% PART 2

u = readimg('eye.png'); % Read image from file

unsharp1 = unsharpendeg(u,10,0.1); % Apply image unsharp mask
unsharp5 = unsharpendeg(u,10,0.5); % Apply image unsharp mask

figure(1); clf; % Clears figure for new images

%%
% Plots full size and zoomed versions of original image, 10 step blurring
% and 100 step blurring.
subplot(3,1,1), imagesc(u);
greyimg();
title('Original "testpat noblur.png"')

subplot(3,1,2), imagesc(unsharp1);
greyimg();
title('Unsharp mask with parameter 0.1')


subplot(3,1,3), imagesc(unsharp5);
greyimg();
title('Unsharp mask with parameter 0.5')

%%
% With the parameter set to 0.5, the image becomes a contrasty mess with no
% identifiable image.