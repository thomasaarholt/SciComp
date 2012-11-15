
%% more least squares

t = [3,1,0,-1,-2,0,-2,2]'
A = [ cos(0*t) sin(t) cos(t) sin(2*t) cos(2*t) ]
%%
b = [3,-2,3,2,-2,-4,0,0]'
scatter(t,b,'ok'), grid on
x = A\b
hold on, plot(t,A*x,'r')

hold off, plot(t,b,'ok'), grid on
x = A\b
hold on, plot(t,A*x,'r')



%% a little bit on handle graphics
h = plot(t, A*x, 'r');
set(h, 'linewidth', 5, 'color', 'red')

% also useful: click on an curve:
set(gco, 'linewidth', 20)
