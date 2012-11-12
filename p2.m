%% Problem 2
% I create a 0-1 matrix with 50 columns, turn it into a vandermonde matrix
% where all the values previously in the columns 1-50 now are in column 2,
% rows 1-50, with the rest of the columns formatted according to the
% vandermonde matrix.
m = 50
n = 5

%%
% Creating t, the 0-1 vector with m spaces.
t = linspace(0,1,m)';

%%
% Creating a vandermonde matrix (the right way around with fliplr)
A = fliplr(vander(t));

%%
% Removing the entries after the fifth row - we don't want the higher
% powers)
n2 = n + 1
A(:,n2:end)=[];
b = cos(4*t);

%% 
% What does cos(4t) look like?

COS = plot(t,b,'r-.');
set(COS,'LineWidth',15);

hold on

%%
% Solving by Matlab's backslash command
x(:,1) = A\b;

BACKS = plot(t,A*x(:,1),'b');
set(BACKS,'LineWidth',9);

%%
% Finding the normal equations by multiplying with the transpose of A on
% both sides -> A^T * A * x = A^T * b. Rearranging:

x(:,2) = (A'*A)\(A'*b);
%%
% Plotting the normal equations solution:
NORMAL = plot(t,A*x(:,2),'g');
set(NORMAL,'LineWidth',6);

%% 
% Finding the solution by QR factorisation: 
[Q,R] = qr(A);
x(:,3) = R\Q'*b;

%%
% Plotting the qr solution:

QR = plot(t,A*x(:,3),'y')
set(QR,'LineWidth',3)

%% 
% Finding the solution by svd:
[U,S,V] = svd(A,0);
%%
% Simplifying for later:
G = U * S * V';
%%
% Solving for svd
x(:,4) = (G'*G)\(G'*b);

%%
% Plotting the svd solution, adding pretty things:
SVD = plot(t,A*x(:,4),'black');
set(SVD,'LineWidth',2)
legend('COS','BACKSLASH','NORMAL','QR','SVD')
title('Solving y = cos(4t) in different ways')
xlabel('radians');
ylabel('function solution')
hold off

%% 
% Solutions of x:
x
%%
% Norms:
for c = 1:4
    norm(A*x(:,c)-b,2)
end


