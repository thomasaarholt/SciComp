%% Test 2

minrange = 0;
maxrange = 1;
space = 5;
xx = linspace(minrange,maxrange,space)'
yy = linspace(minrange,maxrange,space)'

A = zeros(length(xx)^2,3)

for a = 0: length(xx)-1

    A(1+a*space:(a+1)*space,1) = xx(a+1)
end


for b = 1 : length(yy)
for c = 0: length(yy)-1

    A(b+c*space,3) = yy(b)
end
end

for d = 1:length(A)

A(d,2) = A(d,1)*A(d,3)

end


for a = 0: length(xx)-1

    A(1+a*space:(a+1)*space,1) = xx(a+1).^2
end

for b = 1 : length(yy)
for c = 0: length(yy)-1

    A(b+c*space,3) = yy(b).^2
end
end

C = ones(length(A),1)

D = A\C

ezplot ('D(1)x^2+D(2)*x*y+D(3)y^2=1')
