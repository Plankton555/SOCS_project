function [posHandler,velHandler] = PlotBoids(boidPositions,boidVelocities,maxPositions)
figHandler = figure();
posHandler = plot3(boidPositions(:,1),boidPositions(:,2),boidPositions(:,3),'bo');
hold on
axis([-0.2*maxPositions(1) 1.2*maxPositions(1) -0.2*maxPositions(2) ...
  1.2*maxPositions(2) -0.2*maxPositions(3) 1.2*maxPositions(3)])
grid on

velHandler = quiver3(boidPositions(:,1),boidPositions(:,2),...
  boidPositions(:,3),boidVelocities(:,1),boidVelocities(:,2),boidVelocities(:,3));

set(figHandler,'DoubleBuffer','on')
set(posHandler,'XDataSource','boidPositions(:,1)')
set(posHandler,'YDataSource','boidPositions(:,2)')
set(posHandler,'ZDataSource','boidPositions(:,3)')

set(velHandler,'XDataSource','boidPositions(:,1)')
set(velHandler,'YDataSource','boidPositions(:,2)')
set(velHandler,'ZDataSource','boidPositions(:,3)')
set(velHandler,'UDataSource','boidVelocities(:,1)')
set(velHandler,'VDataSource','boidVelocities(:,2)')
set(velHandler,'WDataSource','boidVelocities(:,3)')

legend('Prey')
title('Boid model')
xlabel('x')
ylabel('y')
zlabel('z')



end

