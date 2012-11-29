n = 1
m = 100

[X,Y] = meshgrid((-n):1/m:n);

r = sqrt(X.^2 + Y.^2)
theta = atan2(Y,X)
F = X .* exp( r.^2) .* sin(5 * (theta + r));

x = linspace(-1,1);
y = x;

r2 = sqrt(x.^2 + y.^2)
theta2 = atan2(y,x)
f = x .* exp( r2.^2) .* sin(5 * (theta2 + r2));


surf(X,Y,F)
pause
surf(X,F,f)

xlabel('X')
ylabel('Y')
zlabel('Z')