function handler = PlotBoids(boidPositions,boidVelocities,maxPositions)
figHandler = figure();
handler = quiver3(boidPositions(:,1),boidPositions(:,2),...
  boidPositions(:,3),boidVelocities(:,1),boidVelocities(:,2),boidVelocities(:,3),'bo','Autoscale','off');
hold on
axis([-0.2*maxPositions(1) 1.2*maxPositions(1) -0.2*maxPositions(2) ...
  1.2*maxPositions(2) -0.2*maxPositions(3) 1.2*maxPositions(3)])
grid on


set(figHandler,'DoubleBuffer','on')

set(handler,'XDataSource','boidPositions(:,1)')
set(handler,'YDataSource','boidPositions(:,2)')
set(handler,'ZDataSource','boidPositions(:,3)')
set(handler,'UDataSource','boidVelocities(:,1)')
set(handler,'VDataSource','boidVelocities(:,2)')
set(handler,'WDataSource','boidVelocities(:,3)')

legend('Prey')
title('Boid model')
xlabel('x')
ylabel('y')
zlabel('z')



end

