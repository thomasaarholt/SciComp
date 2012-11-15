% PART 1

type('readimg.m')
[u] = readimg('testpat_blur2.png');
%% Build a discrete 2D Laplace operator
type('unsharpen.m')

unsharp = unsharpen(u,10); % Apply image unsharp mask

figure(1); clf; % Clears figure for new images

subplot(1,2,1), imagesc(u);
type('greyimg.m')
greyimg();

subplot(1,2,2), imagesc(unsharp);
greyimg();

%%
% Image becomes blurred!