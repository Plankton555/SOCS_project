
%Boids test
%Skrev en liten test funktion som implementerar en väldigt enkel boids
%model
clear all, close all, clc


numberOfIterations = 100;
numberOfBoids = 100;
cohesionFactor = 0.01;
alignmentFactor = 0.125;
separationFactor = 1;
separationRadius = 1;
maxPositions = [50,50,50];
maxVelocity = 5;
% TODO: Maybe put all parameters in a vector to reduce nr of parameters
% into functions?

boidPositions = InitializePositions(numberOfBoids,maxPositions);
boidVelocities = zeros(numberOfBoids,3);


plotHandler = PlotBoids(boidPositions);


for i = 1:numberOfIterations

  for iBoid = 1:numberOfBoids
    
    boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, ...
        boidVelocities, iBoid,cohesionFactor,alignmentFactor, ...
        separationFactor, separationRadius, maxVelocity);
    
  end
  
  boidPositions = boidPositions + boidVelocities;

  pause(0.1)
  UpdatePlotBoids(plotHandler);

  
end
