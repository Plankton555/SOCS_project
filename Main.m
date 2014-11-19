
%clear all; close all; clc;

numberOfIterations = 2000;
numberOfBoids = 5;
deltaT = 0.5;

% Parameters
cohesionFactor = 0.01;
alignmentFactor = 0.15;
separationFactor = 0.01;
separationRadius = 20;
maxVelocity = 3;
maxPositions = [100,100,100];
restrictionFactor = 0.1;
visibilityRange = 30;

% Putting all parameters in a vector to reduce nr of parameters into
% functions. Remember that order is important here!
paramVector = [cohesionFactor, alignmentFactor, separationFactor, ...
    separationRadius, maxVelocity, maxPositions,restrictionFactor, ...
    visibilityRange];

% Initialise simulation
boidPositions = InitializePositions(numberOfBoids, maxPositions);
boidVelocities = zeros(numberOfBoids,3);

[posHandler,velHandler] = PlotBoids(boidPositions,boidVelocities,maxPositions);
%%
for i = 1:numberOfIterations
  
  %working function but not included in updates
  visibilityMatrix = GetVisibility(boidPositions, visibilityRange);
  for iBoid = 1:numberOfBoids
    
    boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, ...
      boidVelocities, iBoid, paramVector);
    
  end
    
  boidPositions = boidPositions + deltaT.*boidVelocities;
  
  %pause(0.01)
  UpdatePlotBoids(posHandler, velHandler);
  drawnow;
  
end
