clear all
clc
phi = linspace(0,2*pi);
xgrid = -3:0.5:3; ygrid = xgrid; zgrid = xgrid;

[x,y,z] = meshgrid(xgrid,ygrid,zgrid);

X = [x; y; z];

A = randn(3) + eye(3);

[U,S,V] = svd(A);
u1 = U(:,1); u2 = U(:,2); u3 = U(:,3); % Left
s1 = S(1,1); s2 = S(2,2); s3 = S(3,3); % Singular
v1 = V(:,1); v2 = V(:,2); v3 = V(:,3); % Right

C = 


B = A*X;

x = reshape(B(1,:),xsize(1),xsize(2));
y = reshape(B(2,:),xsize(1),xsize(2));
z = reshape(B(3,:),xsize(1),xsize(2));

G = surf(x,y,z); hold on
H1 = plot3([0 s1*u1(1)],[0 s1*u1(2)],[0 s1*u1(3)],'b','Linewidth',3);
H2 = plot3([0 s2*u2(1)],[0 s2*u2(2)],[0 s2*u2(3)],'g','Linewidth',3);
H3 = plot3([0 s3*u3(1)],[0 s3*u3(2)],[0 s3*u3(3)],'r','Linewidth',3);

pause
alpha(G,0.5)
material('metal')

for i = 1:10
	camorbit(10,0)
	camlight('headlight')
	drawnow;
    pause
end
