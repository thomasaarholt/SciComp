%% --------------------------------------------------------
%% ellipseplot() function
% Takes the b, c and d values for an ellipsis of equation bx^2+cxy+dy^2 =
% 1, and plots it!

function [] = ellipseplot (b,c,d)

ang = (1/2)*atan(c/(d-b));
e = sqrt((1-tan(ang)^2)/(b-d*(tan(ang)^2)))
f = sqrt((tan(ang)^2-1)/(b*(tan(ang))^2-d))

t = linspace(0,2*pi,200);
u = e*cos(t);
v = f*sin(t);

X = u*cos(-ang) - v*sin(-ang);
Y = u*sin(-ang) + v*cos(-ang);

plot(X,Y)
end
%% --------------------------------------------------------