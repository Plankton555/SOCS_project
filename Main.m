%Main file for SOCS project group 11 
% clear all; 
close all; clc;
tic();


numberOfIterations = 100;
numberOfBoids = 50;
numberOfPreds = 1;
deltaT = 0.5;

doPlot = 1;
doDataGathering = 1;

% Parameters
cohesionFactor = 0.01;
alignmentFactor = 0.15;
separationFactor = 0.02;
% separationFactor = 0;
separationRadius = 30;
maxVelocityBoid = 3;
maxVelocityPred = 4;
maxPositions = [300,300,300];
restrictionFactor = 0.05;
huntingFactor = 0.3;
avoidPredFactor = 3;
visibilityRange = 40;
pCrazy = 0.01;
huntRadius = 5;

nrDimens = numel(maxPositions);

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

if doPlot
    [plotBoidHandler, plotPredHandler] = PlotBoidsNPreds(boidPositions,boidVelocities,predPositions,predVelocities,maxPositions);
end
if doDataGathering
    time = (1:numberOfIterations)'*deltaT;
    dataMeanVelocity = zeros(numberOfIterations, nrDimens+1);
    dataMeanSeparation = zeros(numberOfIterations,1);
end

%%
for i = 1:numberOfIterations
  fprintf('Iteration: %i\n', i);
%   visibilityMatrix = GetVisibility(boidPositions, predPositions, visibilityRange);
    visibilityMatrix = GetVisibilityWrapAround(boidPositions,maxPositions,...
    visibilityRange);
  

  for iBoid = 1:numberOfBoids
%     
%     visibleNeighbours = find(visibilityMatrix(iBoid,:));
%     boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, boidVelocities,...
%     predPositions, paramVector,visibleNeighbours, iBoid);

    visibleNeighbours = find(visibilityMatrix(iBoid,:,1));
    boidVelocities(iBoid,:) = UpdateBoidVelocityWrapAround(boidPositions, ...
      boidVelocities, predPositions,visibilityMatrix(iBoid,:,2:4), ...
      paramVector,visibleNeighbours, iBoid);
    
  end
  for iPred = 1:numberOfPreds
      [predVelocities(iPred,:),targetIndex(i,iPred)] = UpdatePredVelocity(predPositions, ...
          predVelocities, boidPositions, iPred, paramVector);
  end
  boidVelocities = CrazyBoid(boidVelocities,pCrazy,maxVelocityBoid);
%   boidPositions = boidPositions + deltaT.*boidVelocities;
%   predPositions = predPositions + deltaT.*predVelocities;
  
   boidPositions = mod(boidPositions + deltaT.*boidVelocities,maxPositions(1));
  predPositions = mod(predPositions + deltaT.*predVelocities,maxPositions(1));
  
  [boidPositions, boidVelocities] = CheckPredsVSPrey(boidPositions, ...
    boidVelocities, predPositions,targetIndex ,huntRadius, i);
  
  
  %pause(0.01)
  if doPlot
      UpdatePlotBoidsNPreds(plotBoidHandler, plotPredHandler);
      drawnow;
  end
  if doDataGathering
      dataMeanVelocity(i,:) = DataGatherVelocity(boidVelocities);
      dataMeanSeparation(i) = DataGatherSeparation(boidPositions);
  end
  
end

if doDataGathering
    PlotBoidVelocity(time, dataMeanVelocity);
    PlotBoidSeparationDistance(time, dataMeanSeparation);
end
toc();
