function separationVelocity = RuleSeparation(boidPositions, ...
  visibleNeighbours,iBoid, separationFactor, separationRadius, dimension)
%RuleSeparation Summary of this function goes here


separationVelocity = zeros(1,dimension);

for jBoid = visibleNeighbours
    differVector = (boidPositions(jBoid,:) - boidPositions(iBoid,:));
    if(norm(differVector) < separationRadius)  
      separationVelocity = separationVelocity - 1./(differVector+0.2);
      %BEWARE OF MAGICAL NUMBERS!
    end
end
separationVelocity = separationFactor * separationVelocity;
end

