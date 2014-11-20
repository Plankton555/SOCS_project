function boidVelocity = UpdateBoidVelocity(boidPositions, boidVelocities,...
    paramVector,visibleNeighbours, iBoid)
  %UpdateBoidVelocity Function to update the velocities of the boids
  
  numberOfBoids = length(visibleNeighbours);
  [~, dimension] = size(boidPositions);
  v1 = zeros(1,dimension);
  v2 = zeros(1,dimension);
  v3 = zeros(1,dimension);
  
  
  % Extract parameters from paramVector
  cohesionFactor = paramVector(1);
  alignmentFactor = paramVector(2);
  separationFactor = paramVector(3);
  separationRadius = paramVector(4);
  maxVelocity = paramVector(5);
  maxPos = paramVector(6:8);
  restrictionFactor = paramVector(9);
  
  if any(visibleNeighbours)
    %Cohesion part
    v1 = RuleCohesion(boidPositions, visibleNeighbours, iBoid, cohesionFactor, ...
      numberOfBoids);
    
    %Alignment part
    v2 = RuleAlignment(boidVelocities, visibleNeighbours, ...
      alignmentFactor, numberOfBoids);
    
    %Separation part
    v3 = RuleSeparation(boidPositions, visibleNeighbours, iBoid,...
      separationFactor, separationRadius, dimension);
    
  end
  %Keep them in a region
  v4 = RuleRestrictedRegion(boidPositions, maxPos,iBoid, ...
    restrictionFactor);
  
  boidVelocity = boidVelocities(iBoid,:) + v1 + v2 + v3 + v4;
  
  % Restrict maximum velocity
  n = norm(boidVelocity);
  if n>maxVelocity
    boidVelocity = boidVelocity.*(maxVelocity/n);
  end
  
end

