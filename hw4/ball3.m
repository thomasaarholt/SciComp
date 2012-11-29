clear all
clc

range = -3:0.1:3;
x = range';
y = range';
z = range';

[x,y,z] = meshgrid(-3:0.5:3);

X = [x y z];

A = randn(3);

%C = X*A*X';
C =   x.^2/A(1,1)^2 + y.*x/A(1,2)^2 + z.*x/A(1,3)^2 +...
    + x.*y/A(2,1)^2 + y.^2/A(2,2)^2 + z.*y/A(2,3)^2 +...
    + x.*z/A(3,1)^2 + y.*z/A(3,2)^2 + z.^2/A(3,3)^2;

isosurface(x,y,z,C,1)