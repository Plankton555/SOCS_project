function boidVelocity = UpdateBoidVelocity(boidPositions, boidVelocities,...
    iBoid, paramVector)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[numberOfBoids, dimension] = size(boidPositions);

% Extract parameters from paramVector
cohesionFactor = paramVector(1);
alignmentFactor = paramVector(2);
separationFactor = paramVector(3);
separationRadius = paramVector(4);
maxVelocity = paramVector(5);

%Cohesion part
v1 = RuleCohesion(boidPositions, iBoid, cohesionFactor, numberOfBoids);

%Alignment part
v2 = RuleAlignment(boidVelocities, iBoid, alignmentFactor, numberOfBoids);

%Separation part
v3 = RuleSeparation(boidPositions, iBoid, separationFactor, separationRadius, numberOfBoids, dimension);


boidVelocity = boidVelocities(iBoid,:) + v1 + v2 + v3;

% Restrict maximum velocity
n = norm(boidVelocity);
if n>maxVelocity
    boidVelocity = boidVelocity.*(maxVelocity/n);
end

end

