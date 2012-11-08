%% Problem 2
% I create a 0-1 matrix with 50 columns, turn it into a vandermonde matrix
% where all the values previously in the columns 1-50 now are in column 2,
% rows 1-50, with the rest of the columns formatted according to the
% vandermonde matrix.
m = 50
n = 5


t = linspace(0,1,m)';

A = fliplr(vander(t));

n2 = n + 1
A(:,n2:end)=[];
b = cos(4*t);

x1 = A\b

COS = plot(t,b,'r');
hold on
BACKS = plot(t,A*x1,'b');

set(COS,'LineWidth',10);
set(BACKS,'LineWidth',7);


x2 = A'*A\A'*b

NORMAL = plot(t,A*x2,'g');

set(NORMAL,'LineWidth',5);

[Q,R] = qr(A);
x3 = R\Q'*b


QR = plot(t,A*x3,'y')
set(QR,'LineWidth',2)


[U,S,V] = svd(A,0);

G = U * S * V';

x4 = (G'*G)\(G'*b)

SVD = plot(t,A*x4,'black');
set(SVD,'LineWidth',5)

hold off

