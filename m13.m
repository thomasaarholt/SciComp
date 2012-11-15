% m13.m - look at some random 2x2 SVD's

theta = linspace(0,2*pi);
x = [cos(theta); sin(theta)];   % 100 points on the unit ball


  A = [1,0;0,1]                  % random 2x2 matrix


  Ax = A*x;
  plot(Ax(1,:),Ax(2,:),'k')
  axis equal, grid on, hold on
    hold off