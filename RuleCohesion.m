function cohesionVelocity = RuleCohesion(boidPositions, iBoid, ...
    cohesionFactor, numberOfBoids)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

centerOfMass = (sum(boidPositions) - boidPositions(iBoid,:))/ ...
  (numberOfBoids-1);
cohesionVelocity = cohesionFactor * (centerOfMass - boidPositions(iBoid,:));

end

