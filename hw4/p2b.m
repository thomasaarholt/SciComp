[X,Y] = meshgrid(-3:.1:3, -2:.1:2);
m = size(X,1); n = size(X,2)
X = reshape(X,m*n,1)
Y = reshape(Y,m*n,1)

pause

theta = linspace(0,2*pi);
x = cos(theta)';   % 100 points on the unit ball
y = sin(theta)';
xy = [X, Y];

a = 1.5;
b = 0.75;



A = [1/a,0;0,1/b]^2;
R = [cos(pi/4), sin(pi/4); -sin(pi/4), cos(pi/4)]
A = R*A;

[U,S,V] = svd(A);

s1 = S(1,1); s2 = S(2,2);     % singular values
u1 = U(:,1); u2 = U(:,2);     % left singular vectors
v1 = V(:,1); v2 = V(:,2);     % right singular vectors

W = [v1, v2];

f = xy*W*A*W'*xy'
contour(f)
pause
[C,H] = contour(f,1)
axis equal