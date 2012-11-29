function [FinalPeak, FinalTrough, deltaFmax, localdeltaFmax, foundlarger] = maxfind2(peak, trough, F, deltaFmax)

radius = 0.05;
biggestlocal = 0;
n = 0;
xbigpeak = peak(1,1);
ybigpeak = peak(1,2);
    
localdeltaFmax = abs(F(xbigpeak,ybigpeak));

foundlarger = 0;
phi = linspace(0,2*pi,360);

oldF = F(peak(1,1),peak(1,2));


for i = 1 : 360

xadd = radius*cos(phi(i));
yadd = radius*sin(phi(i));

newpeak(1,1) = peak(1,1) + xadd;
newpeak(1,2) = peak(1,2) + yadd;

newF = F(newpeak(1,1),newpeak(1,2));

localdeltaF = newF - oldF;

if localdeltaF >= biggestlocal
    n = n + 1;
    foundlarger = 1;
    biggestlocal = localdeltaF;
    biglocal(n,:) = [newpeak(1,1), newpeak(1,2), newF, xadd, yadd];

    
    localdeltaFmax = localdeltaF;
    xbigpeak = newpeak(1,1);
    ybigpeak = newpeak(1,2);
    
    scatter(xbigpeak,ybigpeak, 'red', 'filled');
end

end


for i = 1 : length(biglocal)

xnewtrough = trough(1,1) + biglocal(i,4);
ynewtrough = trough(1,2) + biglocal(i,5);
Fnewtrough = F(xnewtrough,ynewtrough);

newdeltaF = biglocal(i,3) - Fnewtrough;
if  newdeltaF > deltaFmax
    scatter(xnewtrough,ynewtrough, 'red', 'filled');
    deltaFmax = newdeltaF;
    FinalPeak = biglocal(i,1:3);
    FinalTrough = [xnewtrough, ynewtrough, Fnewtrough];
end



end
end
