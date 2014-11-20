function cohesionVelocity = RuleCohesion(boidPositions, visibleNeighbours, ...
  iBoid, cohesionFactor, numberOfBoids)
%RuleCohesion Summary of this function goes here

centerOfMass = (sum(boidPositions(visibleNeighbours,:),1))/numberOfBoids;
cohesionVelocity = cohesionFactor * (centerOfMass - boidPositions(iBoid,:));

end

