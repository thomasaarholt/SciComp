% m8.m - coefficients, expansions, least squares


%% x as expansion coefficients

A = [1 2 3; 4 5 6; 2 2 0]
A*[1;0;1]
A*[1;-2;0]
inv(A)*[2;2;2]
A\[2;2;2]



%% least squares example

t = (0:.1:2)'
figure(1)
plot(t,exp(-t),'r'), grid on

A = [t.^0 t.^1 t.^2]    % this is called a Vandermonde matrix
x = [1; -1; 1/2]    % taylor coeffs of exp(-t) about t=0
hold on, plot(t,A*x,'--b')

x = A\exp(-t)   % backslash for rectangular A: least-squares approx.
plot(t,A*x,'--k')
legend('exp(-t)','Taylor','least-squares',3)
xlabel('t');

figure(2)
plot(t,A*x-exp(-t)), grid on
xlabel('t')
ylabel('residual')



%% more least squares

t = 2*pi*(1:30)'/30
A = [ cos(0*t) sin(t) cos(t) sin(2*t) cos(2*t) ]
A'*A
plot(A)
plot(t,A)

b = [ linspace(0,3,8) linspace(3,2,7) ...
      linspace(2,6,10) linspace(5,0,5) ]'
plot(t,b,'ok'), grid on
x = A\b
hold on, plot(t,A*x,'r')

b = b + randn(30,1)
hold off, plot(t,b,'ok'), grid on
x = A\b
hold on, plot(t,A*x,'r')



%% a little bit on handle graphics
h = plot(t, A*x, 'r');
set(h, 'linewidth', 5, 'color', rand(3,1))

% also useful: click on an curve:
set(gco, 'linewidth', 20)
