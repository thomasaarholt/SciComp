theta = linspace(0,2*pi);
x = cos(theta)';   % 100 points on the unit ball
y = sin(theta)';

xy = [x, y]

spy(xy)

f = xy*xy';
[C,H] = contour(x,y,f,1)