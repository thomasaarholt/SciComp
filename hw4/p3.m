n = 1
m = 100

[X,Y] = meshgrid((-n):1/m:n);

F = X .* exp( -X.^2 - Y.^2) .* sin(5 * (atan2(Y,X) + sqrt(X.^2 + Y.^2)));

surf(X,Y,F)

xlabel('X')
ylabel('Y')
zlabel('Z')

pause

contour(X,Y,F)

[x,y] = ginput(1)

J1 = -2*X.^2.*exp(-X.^2-Y.^2)*sin(5 .* (sqrt(X.^2 + Y.^2)+ atan2(Y,X))) + ...
    + exp(-X.^2-Y.^2) * sin(5 * (sqrt(X.^2 + Y.^2) + atan2(Y,X))) + ...
+ 5*X .* exp(-X.^2 - Y.^2).*(X ./ sqrt(X.^2 + Y.^2) - Y./(Y.^2 + X.^2)) .* cos(5* (sqrt(X.^2 + Y.^2) + atan2(Y,X)));

J2 = 5*X.*exp( -X.^2 - Y.^2 ).*(Y ./ sqrt(X.^2 + Y.^2) + 1./((Y.^2) ./ X + X)) .* cos(5 * (sqrt(X.^2 + Y.^2) + atan2(Y,X))) + ...
    - 2*X.*Y.*exp(-X.^2 - Y.^2).*sin(5*(sqrt( X.^2 + Y.^2 ) + atan2(Y,X)))

J1b = diff(F)



xlabel('X')
ylabel('Y')
zlabel('Z')
pause


J = [J1 J2]


xlabel('X')
ylabel('Y')
zlabel('Z')
