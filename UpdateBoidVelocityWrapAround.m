function boidVelocity = UpdateBoidVelocityWrapAround(boidPositions, boidVelocities,...
    predPositions,distFactors ,paramVector,visibleNeighbours, iBoid)
  %UpdateBoidVelocity Function to update the velocities of the boids
  
  numberOfBoids = length(visibleNeighbours);
  [~, dimension] = size(boidPositions);
  v1 = zeros(1,dimension);
  v2 = zeros(1,dimension);
  v3 = zeros(1,dimension);
  v4 = zeros(1,dimension);
  v5 = zeros(1,dimension);
  
  % Extract parameters from paramVector
  cohesionFactor = paramVector(1);
  alignmentFactor = paramVector(2);
  separationFactor = paramVector(3);
  separationRadius = paramVector(4);
  maxVelocity = paramVector(5);
  maxPos = paramVector(6:8);
  restrictionFactor = paramVector(9);
  avoidPredFactor = paramVector(13);
  
  if any(visibleNeighbours)
    %Cohesion part
    %     v1 = RuleCohesion(boidPositions, visibleNeighbours, iBoid, cohesionFactor, ...
    %       numberOfBoids);
    
    v1 = RuleCohesionWrapAround(boidPositions, visibleNeighbours, distFactors,maxPos, ...
      iBoid, cohesionFactor, numberOfBoids);
    
    %Alignment part
    v2 = RuleAlignment(boidVelocities, visibleNeighbours, ...
      alignmentFactor, numberOfBoids);
    
    %Separation part
    v3 = RuleSeparationWrapAround(boidPositions, visibleNeighbours,...
      distFactors, maxPos,iBoid,...
      separationFactor, separationRadius, dimension);
    
  end
  %   %Keep them in a region
  %   v4 = RuleRestrictedRegion(boidPositions, maxPos,iBoid, ...
  %     restrictionFactor);
  
  %Avoid predators
  % Can see all predators atm
  visiblePredators = 1:size(predPositions,1);
  v5 = RuleAvoidPreds(predPositions, visiblePredators,...
    boidPositions(iBoid,:), avoidPredFactor, dimension);
  
  boidVelocity = boidVelocities(iBoid,:) + v1 + v2 + v3 + v4 + v5;
  
  % Restrict maximum velocity
  n = norm(boidVelocity);
  if n>maxVelocity
    boidVelocity = boidVelocity.*(maxVelocity/n);
  end
  
end

