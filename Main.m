
%clear all; close all; clc;

numberOfIterations = 2000;
numberOfBoids = 100;
deltaT = 0.1;

% Parameters
cohesionFactor = 0.01;
alignmentFactor = 0.08;
separationFactor = 0.05;
separationRadius = 15;
maxVelocity = 3;
maxPositions = [100,100,100];
restrictionFactor = 1;

% Putting all parameters in a vector to reduce nr of parameters into
% functions. Remember that order is important here!
paramVector = [cohesionFactor, alignmentFactor, separationFactor, ...
    separationRadius, maxVelocity, maxPositions,restrictionFactor];

% Initialise simulation
boidPositions = InitializePositions(numberOfBoids, maxPositions);
boidVelocities = zeros(numberOfBoids,3);

[posHandler,velHandler] = PlotBoids(boidPositions,boidVelocities,maxPositions);
%%
for i = 1:numberOfIterations
  for iBoid = 1:numberOfBoids
    
    boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, ...
      boidVelocities, iBoid, paramVector);
    
  end
  
  
  boidPositions = boidPositions + deltaT.*boidVelocities;
  
  pause(0.01)
  UpdatePlotBoids(posHandler, velHandler);
  
end
