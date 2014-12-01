function meanVelocities = DataGatherVelocity(velocities)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

meanVelocities = [mean(velocities), mean(sqrt(sum(velocities.^2, 2)))];

end

