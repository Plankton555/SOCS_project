function [boidPositions, boidVelocities] = RestrictBoidsPosVel(...
    boidPositions, boidVelocities, maxPos)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Restrict the three axes
for k=1:3 %three dimensions
    indexLow = find(boidPositions(:,k) < 0);
    indexHigh = find(boidPositions(:,k) > maxPos(k));
    for i=indexLow
        boidPositions(i,k) = 0;
        boidVelocities(i,k) = 0;
    end
    for i=indexHigh
        boidPositions(i,k) = maxPos(k);
        boidVelocities(i,k) = 0;
    end 
end

end

