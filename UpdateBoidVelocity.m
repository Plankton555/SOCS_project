function boidVelocity = UpdateBoidVelocity(boidPositions, boidVelocities,...
    iBoid, paramVector)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[numberOfBoids, dimension] = size(boidPositions);
cohesionVelocity = zeros(1,dimension);
alignmentVelocity = zeros(1,dimension);
separationVelocity = zeros(1,dimension);

% Extract parameters from paramVector
cohesionFactor = paramVector(1);
alignmentFactor = paramVector(2);
separationFactor = paramVector(3);
separationRadius = paramVector(4);
maxVelocity = paramVector(5);

%Cohesion part
centerOfMass = (sum(boidPositions) - boidPositions(iBoid,:))/ ...
  (numberOfBoids-1);
cohesionVelocity = cohesionFactor * centerOfMass;

%Alignment part
centerOfVelocity = (sum(boidVelocities) - boidVelocities(iBoid,:))/ ...
  (numberOfBoids-1);
alignmentVelocity = alignmentFactor * centerOfVelocity;

%Separation part
for jBoid = 1:numberOfBoids
  if(iBoid ~= jBoid)
    differVector = (boidPositions(jBoid,:) - boidPositions(iBoid,:));
    if(sqrt(sum(differVector.^2)) < separationRadius)
      separationVelocity = separationVelocity - differVector;
    end
  end
end
separationVelocity = separationFactor * separationVelocity;

boidVelocity = boidVelocities(iBoid,:) + cohesionVelocity + ...
  alignmentVelocity + separationVelocity;

% Restrict maximum velocity
n = norm(boidVelocity);
if n>maxVelocity
    boidVelocity = boidVelocity.*(maxVelocity/n);
end

end

