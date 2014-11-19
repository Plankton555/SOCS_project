function plotHandler = PlotBoids(boidPositions)
% TODO: Plot in a way so that direction is visible, e.g. a short line with
% a symbol at the front end.
figHandler = figure();
plotHandler = plot3(boidPositions(:,1),boidPositions(:,2),boidPositions(:,3),'bo');
hold on
axis auto
axis equal
grid on
set(figHandler,'DoubleBuffer','on')
set(plotHandler,'XDataSource','boidPositions(:,1)')
set(plotHandler,'YDataSource','boidPositions(:,2)')
set(plotHandler,'ZDataSource','boidPositions(:,3)')
legend('Prey')
title('Boid model')
xlabel('x')
ylabel('y')
zlabel('z')



end

