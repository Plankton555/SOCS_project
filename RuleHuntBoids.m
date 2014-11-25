function huntingVelocity = RuleHuntBoids(predPositions, boidPositions, iPred, huntingFactor)
%RuleAlignment Summary of this function goes here

nrBoids = size(boidPositions, 1);
myPos = repmat(predPositions(iPred, :), nrBoids, 1);

%Calc distance, pick the closest
relativePositions = boidPositions - myPos;
distance = sqrt(sum(relativePositions.^2, 2)); % norm() no work for matrix
[value, minIndex] = min(distance);

relativeClosest = relativePositions(minIndex, :);

huntingVelocity = relativeClosest./value;
huntingVelocity = huntingFactor .* huntingVelocity;

end

