%Main file for SOCS project group 11
% clear all;
close all; clc;
tic();

numberOfIterations = 2000;
numberOfBoids = 100;
numberOfPreds = 0; % do not use this...
deltaT = 0.5;
addPredIteration = 300;
numberOfAddedPred =1;

doPlot = 1;
doDataGathering = 1;
doFlocking = 0;

targetIndex = ones(numberOfIterations,numberOfAddedPred);
% Parameters
if doFlocking
    cohesionFactor = 0.01;
    alignmentFactor = 0.15;
else
    cohesionFactor = 0;
    alignmentFactor = 0;
end
separationFactor = 0.02;
separationRadius = 30;
maxVelocityBoid = 3;
maxVelocityPred = maxVelocityBoid*1.05;
maxPositions = [300,300,300];
restrictionFactor = 0.05; %not used currently
huntingFactor = 0.8;
avoidPredFactor = 3;
visibilityRange = 40;
pCrazy = 0.01;
huntRadius = 2;

nrDimens = numel(maxPositions);

% Putting all parameters in a vector to reduce nr of parameters into
% functions. Remember that order is important here!
paramVector = [cohesionFactor, alignmentFactor, separationFactor, ...
  separationRadius, maxVelocityBoid, maxPositions,restrictionFactor, ...
  visibilityRange, huntingFactor, maxVelocityPred, avoidPredFactor];

% Initialise simulation
boidPositions = InitializePositions(numberOfBoids, maxPositions);
boidVelocities = InitializeVelocities(numberOfBoids, maxVelocityBoid);
predPositions = InitializePositions(0, maxPositions);
predVelocities = InitializeVelocities(0, maxVelocityPred);

if doPlot
  [plotBoidHandler, plotPredHandler] = PlotBoidsNPreds(boidPositions,boidVelocities,predPositions,predVelocities,maxPositions);
end
if doDataGathering
  time = (1:numberOfIterations)'*deltaT;
  dataMeanVelocity = zeros(numberOfIterations, nrDimens+1);
  dataMeanSeparation = zeros(numberOfIterations,1);
  dataPopulationSize = zeros(numberOfIterations,1);
end

%%
for i = 1:numberOfIterations
  fprintf('Iteration: %i \t Time: %.1f\n', i, i*deltaT);
  
  if(i == addPredIteration)
    numberOfPreds = numberOfAddedPred;
    predPositions = InitializePositions(numberOfPreds, maxPositions);
    predVelocities = InitializeVelocities(numberOfPreds, maxVelocityPred);
  end
  
  [visibilityMatrix, dataMeanSeparation(i)] = GetVisibilityWrapAround(boidPositions,maxPositions,...
    visibilityRange);
    
  for iBoid = 1:numberOfBoids
    visibleNeighbours = find(visibilityMatrix(iBoid,:,1));
    boidVelocities(iBoid,:) = UpdateBoidVelocityWrapAround(boidPositions, ...
      boidVelocities, predPositions,visibilityMatrix(iBoid,:,2:4), ...
      paramVector,visibleNeighbours, iBoid);
    
  end
  for iPred = 1:numberOfPreds
    [predVelocities(iPred,:),targetIndex(i,iPred)] = UpdatePredVelocity(boidPositions,...
      predPositions, predVelocities,iPred, paramVector);
  end
  if (sum(targetIndex(i,:)) == 0)
    fprintf('Stopping simulation, no boids left');
    break;  %stop simulation if no more boids
  end
  boidVelocities = CrazyBoid(boidVelocities,pCrazy,maxVelocityBoid);
  
  boidPositions = mod(boidPositions + deltaT.*boidVelocities,maxPositions(1));
  predPositions = mod(predPositions + deltaT.*predVelocities,maxPositions(1));
  
  [boidPositions, boidVelocities] = CheckPredsVSPrey(boidPositions, ...
    boidVelocities, predPositions,targetIndex ,huntRadius, i);
  
  if doPlot
    UpdatePlotBoidsNPreds(plotBoidHandler, plotPredHandler);
    drawnow;
  end
  if doDataGathering
    dataMeanVelocity(i,:) = DataGatherVelocity(boidVelocities);
    dataPopulationSize(i) = DataGatherPopulationSize(boidPositions);
    if i==30 || i==round(numberOfIterations/2)
      PlotBoidsRelations(boidPositions,maxPositions, i*deltaT)
    end
  end
  
end

if doDataGathering
  PlotBoidVelocity(time, dataMeanVelocity);
  PlotBoidSeparationDistance(time, dataMeanSeparation);
  PlotBoidPopulationSize(time, dataPopulationSize, numberOfBoids);
  PlotBoidsRelations(boidPositions,maxPositions, numberOfIterations*deltaT)
end
toc();
