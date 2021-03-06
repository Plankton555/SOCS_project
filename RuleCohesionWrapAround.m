function cohesionVelocity = RuleCohesionWrapAround(boidPositions, ...
    visibleNeighbours, distFactors, maxPos,iBoid, cohesionFactor, ...
    numberOfBoids)
%RuleCohesion Summary of this function goes here
% boidPositions(visibleNeighbours,:)
% distFactors(1,visibleNeighbours,:)
% maxPos.*distFactors(1,visibleNeighbours,:)
centerOfMass = (sum(boidPositions(visibleNeighbours,:) + ...
    [maxPos(1)*distFactors(1,visibleNeighbours,1)',...
    maxPos(2)*distFactors(1,visibleNeighbours,2)',...
    maxPos(3)*distFactors(1,visibleNeighbours,3)']...
    ,1))/numberOfBoids;
cohesionVelocity = cohesionFactor * ...
    (centerOfMass - boidPositions(iBoid,:));

end
