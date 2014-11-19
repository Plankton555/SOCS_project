function separationVelocity = RuleSeparation(boidPositions, iBoid, ...
    separationFactor, separationRadius, numberOfBoids, dimension)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

separationVelocity = zeros(1,dimension);

for jBoid = 1:numberOfBoids
  if(iBoid ~= jBoid)
    differVector = (boidPositions(jBoid,:) - boidPositions(iBoid,:));
%     if(sqrt(sum(differVector.^2)) < separationRadius)
    if(norm(differVector) < separationRadius)  
      separationVelocity = separationVelocity - 1./(differVector+0.2);
      %BEWARE OF MAGICAL NUMBERS!
    end
  end
end
separationVelocity = separationFactor * separationVelocity;
end

