function [] = ellipseplot (b,c,d)

ang = (1/2)*atan(c/(d-b));
ac = sqrt((1-tan(ang)^2)/(b-d*(tan(ang)^2)))
bc = sqrt((tan(ang)^2-1)/(b*(tan(ang))^2-d))

t = 0:pi/200:2*pi;
u = ac*cos(t);
v = bc*sin(t);

X = u*cos(-ang) - v*sin(-ang);
Y = u*sin(-ang) + v*cos(-ang);

plot(X,Y)
end
