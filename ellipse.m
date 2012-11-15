function [b,c,d] = ellipse(x,y)
    
    A(:,1) = x.^2;
    A(:,2) = x.*y;
    A(:,3) = y.^2;

b = ones(length(A),1);
X = A\b;

b = X(1)
c = X(2)
d = X(3)