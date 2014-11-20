%Main file for SOCS project group 11 
clear all; close all; clc;

numberOfIterations = 2000;
numberOfBoids = 100;
deltaT = 0.5;

% Parameters
cohesionFactor = 0.01;
alignmentFactor = 0.15;
separationFactor = 0.01;
separationRadius = 30;
maxVelocity = 3;
maxPositions = [100,100,100];
restrictionFactor = 0.1;
visibilityRange = 20;

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
  
  visibilityMatrix = GetVisibility(boidPositions, visibilityRange);
  for iBoid = 1:numberOfBoids
    
    visibleNeighbours = find(visibilityMatrix(iBoid,:));
    boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, ...
      boidVelocities, paramVector,visibleNeighbours, iBoid);
    
  end
  
  boidPositions = boidPositions + deltaT.*boidVelocities;
  
  %pause(0.01)
  UpdatePlotBoids(posHandler, velHandler);
  drawnow;
  
end
