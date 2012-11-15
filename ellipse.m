%% --------------------------------------------------------
%% ellipse() function
% Takes a set of X and Y points and computes the b, c and d value for a
% ellipse of equation bx^2+cxy+dy^2 = 1!

function [b,c,d] = ellipse(x,y)
    
    format long
   
    A = [x.^2, x.*y, y.^2]


    B = ones(length(x),1);
    
    
    X = A\B;
    b = X(1);
    c = X(2);
    d = X(3);
end
%% --------------------------------------------------------