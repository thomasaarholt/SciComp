function [xbig, ybig, deltaFmax, foundlarger] = startingpoint(xold, yold, xbig, ybig, deltaFmax, F, radius)

foundlarger = 0;
phi = linspace(0,2*pi,360);

for i = 1 : 360

xadd = radius*cos(phi(i));
yadd = radius*sin(phi(i));

xnew = xold + xadd;
ynew = yold + yadd;

deltaF = abs(F(xnew,ynew)-F(xold,yold));


if deltaF > deltaFmax 
    foundlarger = 1;
    
    deltaFmax = deltaF;
    xbig = xnew;
    ybig = ynew;
    
    scatter(xnew,ynew, 'blue');
end
if deltaF <= deltaFmax 
    scatter(xnew,ynew, 'green');
end

end

