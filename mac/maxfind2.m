function [xbigpeak, ybigpeak, localdeltaFmax, foundlarger] = maxfind2(peak, trough, F)
    

xbigpeak = peak(1,1);
ybigpeak = peak(1,2);
    
localdeltaFmax = abs(F(xbigpeak,ybigpeak));

foundlarger = 0;
phi = linspace(0,2*pi,360);

oldpeak = peak;
oldtrough = trough;

for i = 1 : 360

xadd = 0.1*cos(phi(i))
yadd = 0.1*sin(phi(i))

peak(1,1) = oldpeak(1,1) + xadd;
peak(1,2) = oldpeak(1,2) + yadd;

localdeltaF = abs(F(peak(1,1),peak(1,2))-F(oldpeak(1,1),oldpeak(1,2)));


if localdeltaF >= localdeltaFmax 
    foundlarger = 1;
    
    localdeltaFmax = localdeltaF;
    xbigpeak = peak(1,1);
    ybigpeak = peak(1,2);
    
    scatter(xbigpeak,ybigpeak, 'red', 'filled');
    foundlarger;
end
if localdeltaF < localdeltaFmax 
    scatter(peak(1,1),peak(1,2), 'blue');

end

end

