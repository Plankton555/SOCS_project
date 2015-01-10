function [boidPositions, boidVelocities] = CheckPredsVSPrey(...
    boidPositions, boidVelocities, predPositions, targetIndex, ...
    huntRadius, i)
%CheckPredsVSPrey Summary of this function goes here
%   Detailed explanation goes here
numberOfPreds = size(predPositions,1);

for iPred = 1:numberOfPreds
    distance = norm(predPositions(iPred,:) - ...
        boidPositions(targetIndex(i,iPred),:));
    
    if(distance <= huntRadius)
        boidPositions(targetIndex(i,iPred),:) = NaN;
        boidVelocities(targetIndex(i,iPred),:) = NaN;
        fprintf('One Down \n')
    end
    
end

end

