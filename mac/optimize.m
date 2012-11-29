%% Finding the biggest delta-F if one drops a unit length pin in the XY plane.
% Constants:
clc
clear all
close all

n = 2; m = 100;
x = -n:1/m:n; y = x;
[X,Y] = meshgrid(x,y);

radius = 1;
xold = 0; yold = 0; deltaFmax = 0;

% The "terrain" = function F
theta = @(X,Y) atan2(Y,X); r = @(X,Y) sqrt(X.^2 + Y.^2); F = @(X,Y) X.*exp(-r(X,Y).^2).*sin(5*(r(X,Y)+theta(X,Y)));

% The view
figure(1);
contour(X,Y,F(X,Y)); xlabel('X'); ylabel('Y');
hold on;
axis equal


% Starting at XY = (0,0)
scatter(xold,yold); 
axis([-2 2 -2 2]);

xbig = 0; ybig = 0;
foundlarger = 1;

%% Do a circle plot and see if there are any better starting points
c = 0;
while foundlarger == 1
    c = c + 1;
    
    [xbig, ybig, deltaFmax, foundlarger] = startingpoint(xold, yold, xbig, yold,  deltaFmax, F, radius);
    scatter(xbig, ybig,'black','filled');
    
    if foundlarger == 1
    XY(c,:) = [xbig ybig];
    end
    
    xold = xbig;
    yold = ybig;
    pause
end
%% Which set of coordinates is the peak and which is the trough?
if F(XY(end, 1),XY(end,2)) > F(XY(end-1,1),XY(end-1,2))
    peak = XY(end, :);
    trough = XY(end-1,:);
end

if F(XY(end, 1),XY(end,2)) < F(XY(end-1,1),XY(end-1,2))
    peak = XY(end-1, :);
    trough = XY(end,:);
end

scatter(peak(1,1),peak(1,2),'red','filled');
scatter(trough(1,1),trough(1,2),'blue','filled');

[FinalPeak, FinalTrough, deltaFmax, localdeltaFmax] = improver(peak, trough, F, deltaFmax);
%% Finally plot a separate plot of the background terrain and the two points of maximum difference in F separated by 1 unit along XY plane
figure(2)
contour(X,Y,F(X,Y)); hold on;
xlabel('X'); ylabel('Y');
axis equal; axis([-2 2 -2 2]);

scatter(FinalPeak(1,1), FinalPeak(1,2),'red','filled');
scatter(FinalTrough(1,1),FinalTrough(1,2),'blue','filled')
XX = [FinalPeak(1,1), FinalTrough(1,1)];
YY = [FinalPeak(1,2),FinalTrough(1,2)];
ZZ = [FinalPeak(1,3),FinalTrough(1,3)];
plot(XX,YY)

figure(3); hold on;
surf(X,Y,F(X,Y)); alpha(0.15);
plot3(XX,YY,ZZ,'LineWidth',8)
campos([24.8711,14.3594,4.8428]);
camva('auto')