function [xbig, ybig, deltaFmax, foundlarger] = maxfind1(xold, yold, xbig, ybig, deltaFmax, F, phi, radius)

foundlarger = 0;

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
    foundlarger;
end


end

