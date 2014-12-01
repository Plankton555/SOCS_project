%Main file for SOCS project group 11 
% clear all; 
close all; clc;
tic();

numberOfIterations = 200;
numberOfBoids = 100;
numberOfPreds = 1;
deltaT = 0.5;

% Parameters
cohesionFactor = 0.01;
alignmentFactor = 0.15;
separationFactor = 0.02;
separationRadius = 30;
maxVelocityBoid = 3;
maxVelocityPred = 4;
maxPositions = [150,150,150];
restrictionFactor = 0.05;
huntingFactor = 0.3;
avoidPredFactor = 3;
visibilityRange = 40;
pCrazy = 0.01;
huntRadius = 5;

% Putting all parameters in a vector to reduce nr of parameters into
% functions. Remember that order is important here!
paramVector = [cohesionFactor, alignmentFactor, separationFactor, ...
  separationRadius, maxVelocityBoid, maxPositions,restrictionFactor, ...
  visibilityRange, huntingFactor, maxVelocityPred, avoidPredFactor];

% Initialise simulation
boidPositions = InitializePositions(numberOfBoids, maxPositions);
boidVelocities = InitializeVelocities(numberOfBoids, maxVelocityBoid);
predPositions = InitializePositions(numberOfPreds, maxPositions);
predVelocities = InitializeVelocities(numberOfPreds, maxVelocityPred);

[plotBoidHandler, plotPredHandler] = PlotBoidsNPreds(boidPositions,...
  boidVelocities,predPositions,predVelocities,maxPositions);
%%
for i = 1:numberOfIterations
  fprintf('Iteration: %i\n', i);
  visibilityMatrix = GetVisibility(boidPositions,visibilityRange);
%   visibilityMatrix = GetVisibilityWrapAround(boidPositions,maxPositions,...
%     visibilityRange);
  numberOfBoids = size(boidPositions,1);
  for iBoid = 1:numberOfBoids
    
    visibleNeighbours = find(visibilityMatrix(iBoid,:));
    boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, boidVelocities,...
    predPositions, paramVector,visibleNeighbours, iBoid);

%     visibleNeighbours = find(visibilityMatrix(iBoid,:,1));
%     boidVelocities(iBoid,:) = UpdateBoidVelocityWrapAround(boidPositions, ...
%       boidVelocities, predPositions,visibilityMatrix(iBoid,:,2:4), ...
%       paramVector,visibleNeighbours, iBoid);
    
  end
  for iPred = 1:numberOfPreds
      [predVelocities(iPred,:),targetIndex(i,iPred)] = UpdatePredVelocity(predPositions, ...
          predVelocities, boidPositions, iPred, paramVector);
  end
  boidVelocities = CrazyBoid(boidVelocities,pCrazy,maxVelocityBoid);
  boidPositions = boidPositions + deltaT.*boidVelocities;
  predPositions = predPositions + deltaT.*predVelocities;
  
%    boidPositions = mod(boidPositions + deltaT.*boidVelocities,maxPositions(1));
%   predPositions = mod(predPositions + deltaT.*predVelocities,maxPositions(1));
  
  [boidPositions, boidVelocities] = CheckPredsVSPrey(boidPositions, ...
    boidVelocities, predPositions,targetIndex ,huntRadius, i);
  
  
  %pause(0.01)
  UpdatePlotBoidsNPreds(plotBoidHandler, plotPredHandler);
  drawnow;
  
end

toc();
