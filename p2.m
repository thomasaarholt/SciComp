%% Problem 2
% I create a 0-1 matrix with 50 columns, turn it into a vandermonde matrix
% where all the values previously in the columns 1-50 now are in column 2,
% rows 1-50, with the rest of the columns formatted according to the
% vandermonde matrix.
m = 50
n = 5

%%
% Creating t, the 0-1 vector with m spaces.
t = linspace(0,1,m)';

%%
% Creating a vandermonde matrix (the right way around with fliplr)
A = fliplr(vander(t));

%%
% Removing the entries after the fifth row - we don't want the higher
% powers)
n2 = n + 1
A(:,n2:end)=[];
b = cos(4*t);

%% 
% What does cos(4t) look like?

COS = plot(t,b,'r-.');
set(COS,'LineWidth',15);

hold on

%%
% Solving by Matlab's backslash command
xx(:,1) = A\b;

BACKS = plot(t,A*xx(:,1),'b');
set(BACKS,'LineWidth',9);

%%
% Finding the normal equations by multiplying with the transpose of A on
% both sides -> A^T * A * x = A^T * b. Rearranging:

xx(:,2) = (A'*A)\(A'*b);
%%
% Plotting the normal equations solution:
NORMAL = plot(t,A*xx(:,2),'g');
set(NORMAL,'LineWidth',6);

%% 
% Finding the solution by QR factorisation: 
[Q,R] = qr(A);
xx(:,3) = R\Q'*b;

%%
% Plotting the qr solution:

QR = plot(t,A*xx(:,3),'y')
set(QR,'LineWidth',3)

%% 
% Finding the solution by svd:
[U,S,V] = svd(A,0);
%%
% Simplifying for later:
G = U * S * V';
%%
% Solving for svd
xx(:,4) = (G'*G)\(G'*b);

%%
% Plotting the svd solution, adding pretty things:
SVD = plot(t,A*xx(:,4),'black');
set(SVD,'LineWidth',2)
legend('COS','BACKSLASH','NORMAL','QR','SVD')
title('Solving y = cos(4t) in different ways')
xlabel('radians');
ylabel('function solution')
hold off

%% 
% Solutions of x:
xx
%%
% Norms:
for c = 1:4
    norm(A*xx(:,c)-b,2)
end

%% Problem 3
% 
for c = 1:4
        
Error(c) = cond(A*xx(:,c));

end

%% Problem 4

clear all
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

hold off

%%
% The sharpening of the image enhances the contrast between points that are
% already contrasting. For a unblurred image, this ramps up the "whiteness"
% of the image to the point of making it "grainy", as can be seen on the
% zoomed plot of the 100 stepped blurring image.

%% Problem 5
% What is the data we want to fit against?
xx = [3,1,0,-1,-2,0,-2,2]'
yy = [3,-2,3,2,-2,-4,0,0]'
% Having a look:
figure(2);
scatter(xx,yy,100,'r','filled')
axis([-6,6,-6,6])
hold on

type('ellipse.m')

[b,c,d] = ellipse(xx,yy);

grid on

[b,c,d] = ellipse(xx,yy);

ellipseplot(b,c,d);
%%

figure(3);

axis([-3 3 -3 3]), axis manual, hold on, grid on
x = []; y = []; button = 1;
disp('input points with mouse, button >= 2 for final point')
while button == 1
[xx,yy,button] = ginput(1)
x = [x; xx]; y = [y; yy]; plot(xx,yy,'x')
end

[b,c,d] = ellipse(x,y)
ellipseplot(b,c,d);

clear all
