%Main file for SOCS project group 11 
clear all; 
close all; clc;

numberOfIterations = 2000;
numberOfBoids = 100;
numberOfPreds = 1;
deltaT = 0.5;

% Parameters
cohesionFactor = 0.01;
alignmentFactor = 0.15;
separationFactor = 0.01;
separationRadius = 30;
maxVelocityBoid = 3;
maxVelocityPred = 4;
maxPositions = [100,100,100];
restrictionFactor = 0.1;
huntingFactor = 1;
visibilityRange = 20;
pCrazy = 0.01;

% Putting all parameters in a vector to reduce nr of parameters into
% functions. Remember that order is important here!
paramVector = [cohesionFactor, alignmentFactor, separationFactor, ...
  separationRadius, maxVelocityBoid, maxPositions,restrictionFactor, ...
  visibilityRange, huntingFactor, maxVelocityPred];

% Initialise simulation
boidPositions = InitializePositions(numberOfBoids, maxPositions);
boidVelocities = InitializeVelocities(numberOfBoids, maxVelocityBoid);
predPositions = InitializePositions(numberOfPreds, maxPositions);
predVelocities = InitializeVelocities(numberOfPreds, maxVelocityPred);

plotHandler = PlotBoids(boidPositions,boidVelocities,maxPositions);
%%
for i = 1:numberOfIterations
  
  visibilityMatrix = GetVisibility(boidPositions, visibilityRange);
  for iBoid = 1:numberOfBoids
    
    visibleNeighbours = find(visibilityMatrix(iBoid,:));
    boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, ...
      boidVelocities, paramVector,visibleNeighbours, iBoid);
    
  end
  for iPred = 1:numberOfPreds
      predVelocities(iPred,:) = UpdatePredVelocity(predPositions, ...
          predVelocities, boidPositions, iPred, paramVector);
  end
  boidVelocities = CrazyBoid(boidVelocities,pCrazy,maxVelocityBoid);
  boidPositions = boidPositions + deltaT.*boidVelocities;
  predPositions = predPositions + deltaT.*predVelocities;
  
  %pause(0.01)
  UpdatePlotBoids(plotHandler);
  drawnow;
  
end
