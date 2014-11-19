function boidVelocity = UpdateBoidVelocity(boidPositions, boidVelocities,...
    iBoid, paramVector)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[numberOfBoids, dimension] = size(boidPositions);
cohesionVelocity = zeros(1,dimension);
alignmentVelocity = zeros(1,dimension);
separationVelocity = zeros(1,dimension);
restrictionVelocity = zeros(1,dimension);

% Extract parameters from paramVector
cohesionFactor = paramVector(1);
alignmentFactor = paramVector(2);
separationFactor = paramVector(3);
separationRadius = paramVector(4);
maxVelocity = paramVector(5);
maxPos = paramVector(6:8);
restrictionFactor = paramVector(9);

%Cohesion part
v1 = RuleCohesion(boidPositions, iBoid, cohesionFactor, numberOfBoids);

%Alignment part
v2 = RuleAlignment(boidVelocities, iBoid, alignmentFactor, numberOfBoids);

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

restrictionVelocity = RuleRestrictedRegion(boidPositions, maxPos,iBoid, ...
  restrictionFactor);

boidVelocity = boidVelocities(iBoid,:) + v1 + v2 + separationVelocity + ...
  restrictionVelocity;

% Restrict maximum velocity
n = norm(boidVelocity);
if n>maxVelocity
    boidVelocity = boidVelocity.*(maxVelocity/n);
end

end

