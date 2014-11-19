
clear all; close all; clc;

numberOfIterations = 100;
numberOfBoids = 100;


% Parameters
cohesionFactor = 0.01;
alignmentFactor = 0.125;
separationFactor = 1;
separationRadius = 1;
maxVelocity = 5;
maxPositions = [50,50,50];
restrictionFactor = 1;
% Putting all parameters in a vector to reduce nr of parameters into
% functions. Remember that order is important here!
paramVector = [cohesionFactor, alignmentFactor, separationFactor, ...
    separationRadius, maxVelocity, maxPositions,restrictionFactor];

% Initialise simulation
boidPositions = InitializePositions(numberOfBoids, maxPositions);
boidVelocities = zeros(numberOfBoids,3);

plotHandler = PlotBoids(boidPositions);

for i = 1:numberOfIterations
  for iBoid = 1:numberOfBoids
    
    boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, ...
        boidVelocities, iBoid, paramVector);
    
  end
  
  boidPositions = boidPositions + boidVelocities;
%   [boidPositions, boidVelocities] = RestrictBoidsPosVel(boidPositions, ...
%       boidVelocities, maxPositions);

  pause(0.1)
  UpdatePlotBoids(plotHandler);

end
