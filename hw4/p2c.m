[X,Y] = meshgrid(-3:.1:3, -2:.1:2);


%%
theta = linspace(0,2*pi);
x = cos(theta)';   % 100 points on the unit ball
y = sin(theta)';



%%

hold off

a = 1.5; b = 0.75;
D = [1/a,0;0,1/b]^2;

v1 = [1; 1]; v2 = [1; -1];
W = [v1, v2];
%% can this be correct?
A = 1/a^2; B = 1/b^2;
ellipseplot(A,0,B) 
ang = (1/2)*atan(0/(B-A))
e = sqrt((1-tan(ang)^2)/(A-B*(tan(ang)^2)))
f = sqrt((tan(ang)^2-1)/(A*(tan(ang))^2-B))

u = e*cos(theta);
v = f*sin(theta);

x = u*cos(-ang) - v*sin(-ang);
y = u*sin(-ang) + v*cos(-ang);

xy = [x', y'];
pause
%%
f = xy*W*D*W'*xy'
surf(x,y,f); hold on;
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)
zlabel('Z','FontSize',12)

pause

H1 = plot([0 a*v1(1)],[0 a*v1(2)],'b','Linewidth',3);
H2 = plot([0 b*v2(1)],[0 b*v2(2)],'r','Linewidth',3);

pause
hold off; contour(x,y,f,1); hold on;
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)

H1 = plot([0 a*v1(1)],[0 a*v1(2)],'b','Linewidth',3);
H2 = plot([0 b*v2(1)],[0 b*v2(2)],'r','Linewidth',3);
