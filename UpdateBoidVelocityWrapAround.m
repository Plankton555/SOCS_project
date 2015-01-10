function boidVelocity = UpdateBoidVelocityWrapAround(boidPositions, ...
    boidVelocities, predPositions, distFactors, paramVector, ...
    visibleNeighbours, iBoid)
%UpdateBoidVelocity Function to update the velocities of the boids

numberOfBoids = length(visibleNeighbours);
[~, dimension] = size(boidPositions);
v1 = zeros(1,dimension);
v2 = zeros(1,dimension);
v3 = zeros(1,dimension);
v4 = zeros(1,dimension);
v5 = zeros(1,dimension);

% Extract parameters from paramVector
cohesionFactor = paramVector(1);
alignmentFactor = paramVector(2);
separationFactor = paramVector(3);
separationRadius = paramVector(4);
maxVelocity = paramVector(5);
maxPos = paramVector(6:8);
restrictionFactor = paramVector(9);
visibilityRange = paramVector(10);
avoidPredFactor = paramVector(13);

if any(visibleNeighbours)
    
    v1 = RuleCohesionWrapAround(boidPositions, visibleNeighbours, ...
        distFactors,maxPos, iBoid, cohesionFactor, numberOfBoids);
    
    %Alignment part
    v2 = RuleAlignment(boidVelocities, visibleNeighbours, ...
        alignmentFactor, numberOfBoids);
    
    %Separation part
    v3 = RuleSeparationWrapAround(boidPositions, visibleNeighbours,...
        distFactors, maxPos,iBoid,...
        separationFactor, separationRadius, dimension);
    
end

%Avoid predators
visiblePredators = 1:size(predPositions,1);
v5 = RuleAvoidPredsWrapAround(predPositions, visiblePredators,...
    boidPositions(iBoid,:), maxPos, avoidPredFactor, visibilityRange, ...
    dimension);

boidVelocity = boidVelocities(iBoid,:) + v1 + v2 + v3 + v4 + v5;

% Restrict maximum velocity
n = norm(boidVelocity);
if n>maxVelocity
    boidVelocity = boidVelocity.*(maxVelocity/n);
end

end

