function cohesionVelocity = RuleCohesion(boidPositions, visibleNeighbours, ...
  iBoid, cohesionFactor, numberOfBoids)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

centerOfMass = (sum(boidPositions(visibleNeighbours,:)))/numberOfBoids;
cohesionVelocity = cohesionFactor * (centerOfMass - boidPositions(iBoid,:));

if(cohesionVelocity(1)== inf || isnan(cohesionVelocity(1)))
  disp('Cohesian')
end

if(cohesionVelocity(2) == inf || isnan(cohesionVelocity(2)))
  disp('Cohesian')
end
if(cohesionVelocity(3) == inf || isnan(cohesionVelocity(3)))
  disp('Cohesian')
end

end

