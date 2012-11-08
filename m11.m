% m.11.m - well and ill condition systems of equations

A = randn(10);
b = sum(A,2)
xexact = ones(10,1)
x = A\b
cond(A)

A = hilb(10);
b = sum(A,2)
xexact
x = A\b
cond(A)