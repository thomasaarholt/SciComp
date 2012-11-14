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
x(:,1) = A\b;

BACKS = plot(t,A*x(:,1),'b');
set(BACKS,'LineWidth',9);

%%
% Finding the normal equations by multiplying with the transpose of A on
% both sides -> A^T * A * x = A^T * b. Rearranging:

x(:,2) = (A'*A)\(A'*b);
%%
% Plotting the normal equations solution:
NORMAL = plot(t,A*x(:,2),'g');
set(NORMAL,'LineWidth',6);

%% 
% Finding the solution by QR factorisation: 
[Q,R] = qr(A);
x(:,3) = R\Q'*b;

%%
% Plotting the qr solution:

QR = plot(t,A*x(:,3),'y')
set(QR,'LineWidth',3)

%% 
% Finding the solution by svd:
[U,S,V] = svd(A,0);
%%
% Simplifying for later:
G = U * S * V';
%%
% Solving for svd
x(:,4) = (G'*G)\(G'*b);

%%
% Plotting the svd solution, adding pretty things:
SVD = plot(t,A*x(:,4),'black');
set(SVD,'LineWidth',2)
legend('COS','BACKSLASH','NORMAL','QR','SVD')
title('Solving y = cos(4t) in different ways')
xlabel('radians');
ylabel('function solution')
hold off

%% 
% Solutions of x:
x
%%
% Norms:
for c = 1:4
    norm(A*x(:,c)-b,2)
end

%% Problem 3
% 
for c = 1:4
        
Error(c) = cond(A*x(:,c));

end

%% Problem 4
% 
%% Read an image from a file
u = imread('testpat_blur2.png');
%u = imread('eye.png');
% convert image to double and scale to [0,1]
u = double(u) / 255;

[n,n2] = size(u);
if (n ~= n2)
  error('by default, this only supports square images')
end


%% Build a discrete 2D Laplace operator
e = ones(n,1);
L1 = spdiags([e  -2*e  e], [-1 0 1], n, n);
% this next line implements "Neumann boundary conditions": you could
% try commenting it out.
L1(1,1) = -1;   L1(end,end) = -1;
I = speye(n,n);
L = kron(L1, I) + kron(I, L1);


figure(1); clf;
%pcolor(u); % try this one too
imagesc(u);
caxis([0 1])
colormap(gray)
axis equal, axis tight


% "stretch" the matrix representation of the image into one long
% vector.
v = reshape(u, n*n, 1);

% L IS THE BLURRING!


% Do 10 steps of blurring
for i=1:10
  v = v + 0.01*(L*v);
end

% convert the long vector back into a matrix
ublur = reshape(v, n, n);


figure(2); clf;
imagesc(ublur);
caxis([0 1])
colormap(gray)
axis equal, axis tight

edgemap = u - ublur;

unsharp = u + edgemap;


%% Output original and result side-by-side
% You could look at the resulting file with a web browser or image
% viewer
result = [u  unsharp];
imwrite(result, 'result.png')



