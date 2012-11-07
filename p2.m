%% Problem 2
% I create a 0-1 matrix with 50 columns, turn it into a vandermonde matrix
% where all the values previously in the columns 1-50 now are in column 2,
% rows 1-50, with the rest of the columns formatted according to the
% vandermonde matrix.
A = fliplr(vander(linspace(0,1,50)));
t = fliplr(vander(linspace(0,2*pi,50)));
b = cos(4*t)
plot(b(:,2))
