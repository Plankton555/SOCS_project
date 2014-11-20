function separationVelocity = RuleSeparation(boidPositions, ...
  visibleNeighbours,iBoid, separationFactor, separationRadius, numberOfBoids,dimension)
%RuleSeparation Summary of this function goes here


separationVelocity = zeros(1,dimension);

for jBoid = visibleNeighbours
%   if(iBoid ~= jBoid)
    differVector = (boidPositions(jBoid,:) - boidPositions(iBoid,:));
%     if(sqrt(sum(differVector.^2)) < separationRadius)
    if(norm(differVector) < separationRadius)  
      separationVelocity = separationVelocity - 1./(differVector+0.2);
      %BEWARE OF MAGICAL NUMBERS!
    end
%   end
end
separationVelocity = separationFactor * separationVelocity;
end

