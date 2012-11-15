%% PART 2

[u] = readimg('testpat_noblur.png'); % Read image from file

unsharp = unsharpen(u,10); % Apply image unsharp mask

figure(1); clf; % Clears figure for new images

%%
% Plots full size and zoomed versions of original image, 10 step blurring
% and 100 step blurring.
subplot(3,2,1), imagesc(u);
greyimg();
title('Original "testpat noblur.png"')

subplot(3,2,2), imagesc(u);
greyimg();
axis([30 60 30 60])
title('Zoomed original')


subplot(3,2,3), imagesc(unsharp);
greyimg();
title('Unsharpened image"')


subplot(3,2,4), imagesc(unsharp);
greyimg();
axis([30 60 30 60])
title('Unsharpened zoomed at edge, 10 blurring steps')

unsharp100 = unsharpen(u,100);

subplot(3,2,5), imagesc(unsharp100);
greyimg();
title('Unsharpened image"')

subplot(3,2,6), imagesc(unsharp100);
greyimg();
axis([30 60 30 60])
title('Unsharpened zoomed at edge, 100 blurring steps')

%%
% The sharpening of the image enhances the contrast between points that are
% already contrasting. For a unblurred image, this ramps up the "whiteness"
% of the image to the point of making it "grainy", as can be seen on the
% zoomed plot of the 100 stepped blurring image.