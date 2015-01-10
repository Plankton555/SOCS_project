function separationVelocity = RuleSeparationWrapAround(boidPositions, ...
    visibleNeighbours, distFactors, maxPos, iBoid, separationFactor, ...
    separationRadius, dimension)
%RuleSeparation Summary of this function goes here


separationVelocity = zeros(1,dimension);

for jBoid = visibleNeighbours
    differVector = (boidPositions(jBoid,:) + ...
        [maxPos(1)*distFactors(1,jBoid,1)',...
        maxPos(2)*distFactors(1,jBoid,2)',...
        maxPos(3)*distFactors(1,jBoid,3)']...
        - boidPositions(iBoid,:));
    if(norm(differVector) < separationRadius)
        separationVelocity = separationVelocity - 1./(differVector);
    end
end
separationVelocity = separationFactor * separationVelocity;
end

