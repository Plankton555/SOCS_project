function [figHandler, boidHandler, predHandler] = PlotBoidsNPreds(boidPositions,boidVelocities,predPositions,predVelocities,maxPositions)
figHandler = figure('Position',[100 100 800 600])
boidHandler = quiver3(boidPositions(:,1),boidPositions(:,2),...
  boidPositions(:,3),boidVelocities(:,1),boidVelocities(:,2),boidVelocities(:,3),'bo','Autoscale','off');
hold on
predHandler = quiver3(predPositions(:,1),predPositions(:,2),...
  predPositions(:,3),predVelocities(:,1),predVelocities(:,2),predVelocities(:,3),'ro','Autoscale','off');
% boidHandler = plot3(boidPositions(:,1),boidPositions(:,2),...
%   boidPositions(:,3),'*');
% hold on
% predHandler = plot3(predPositions(:,1),predPositions(:,2),...
%   predPositions(:,3),'*r');



% axis([-0.2*maxPositions(1) 1.2*maxPositions(1) -0.2*maxPositions(2) ...
%   1.2*maxPositions(2) -0.2*maxPositions(3) 1.2*maxPositions(3)])
axis([0 maxPositions(1) 0 ...
  maxPositions(2) 0 maxPositions(3)])
grid on

% 
set(figHandler,'DoubleBuffer','on')
set(figHandler,'nextplot','replacechildren');
set(figHandler,'Renderer','zbuffer');

% % 
set(boidHandler,'XDataSource','boidPositions(:,1)')
set(boidHandler,'YDataSource','boidPositions(:,2)')
set(boidHandler,'ZDataSource','boidPositions(:,3)')
set(boidHandler,'UDataSource','boidVelocities(:,1)')
set(boidHandler,'VDataSource','boidVelocities(:,2)')
set(boidHandler,'WDataSource','boidVelocities(:,3)')

set(predHandler,'XDataSource','predPositions(:,1)')
set(predHandler,'YDataSource','predPositions(:,2)')
set(predHandler,'ZDataSource','predPositions(:,3)')
set(predHandler,'UDataSource','predVelocities(:,1)')
set(predHandler,'VDataSource','predVelocities(:,2)')
set(predHandler,'WDataSource','predVelocities(:,3)')

legend('Prey', 'Predator')
title('Boid model')
xlabel('x')
ylabel('y')
zlabel('z')
axis vis3d



end

