function meanVelocities = DataGatherVelocity(velocities)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
velWoNaN = velocities(~any(isnan(velocities),2),:);
meanVelocities = [mean(velWoNaN,1), mean(sqrt(sum(velWoNaN.^2, 2)),1)];

end

