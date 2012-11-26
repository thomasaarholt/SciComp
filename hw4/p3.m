n=3;
[X,Y] = meshgrid(n*(-3):.1:n*3, -3:.1/n:3);

F = X.*exp(-X.^2 - Y.^2)*sin(5*(atan2(Y,X)+sqrt(X.^2+Y.^2)));

surf(X,Y,F)
xlabel('X')
ylabel('Y')
zlabel('Z')