[x,y] = meshgrid(-3:.1:3, -2:.1:2);

a = 1.5
b = 0.75

f = (x/a).^2+(y/b).^2;

contour(x,y,f,1)
axis equal
