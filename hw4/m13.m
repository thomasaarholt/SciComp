% m13.m - look at some random 2x2 SVD's

theta = linspace(0,2*pi);
x = [cos(theta); sin(theta)];   % 100 points on the unit ball

while 1

  A = randn(2)                  % random 2x2 matrix
  [U,S,V] = svd(A)
  pause
  s1 = S(1,1); s2 = S(2,2);     % singular values
  u1 = U(:,1); u2 = U(:,2);     % left singular vectors
  v1 = V(:,1); v2 = V(:,2);     % right singular vectors

  subplot(1,2,1), hold off      % plot unit ball and right s. vectors
  plot(x(1,:),x(2,:),'k')
  axis equal, grid on, hold on
  pause
  plot([0 v1(1)],[0 v1(2)],'b')
  plot([0 v2(1)],[0 v2(2)],'r')
pause

  subplot(1,2,2), hold off      % plot A*ball and left s. vectors
  Ax = A*x;
  plot(Ax(1,:),Ax(2,:),'k')
  axis equal, grid on, hold on
  plot([0 s1*u1(1)],[0 s1*u1(2)],'b')
  plot([0 s2*u2(1)],[0 s2*u2(2)],'r')

  disp('return for next matrix, ^C to quit')
  pause

end



