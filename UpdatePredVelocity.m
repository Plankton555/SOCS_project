function [predVelocity,targetPreyIndex] = UpdatePredVelocity(boidPositions, ...
  predPositions, predVelocities, iPred, paramVector)
    %UpdatePredVelocity Function to update the velocities of the predators

    % Extract parameters from paramVector
    maxPos = paramVector(6:8);
    huntingFactor = paramVector(11);
    maxVelocityPred = paramVector(12);

    %Cohesion part
    [v1,targetPreyIndex] = RuleHuntBoids(boidPositions, ...
      predPositions(iPred,:),maxPos, huntingFactor);

    predVelocity = predVelocities(iPred,:) + v1;

    % Restrict maximum velocity
    n = norm(predVelocity);
    if n>maxVelocityPred
        predVelocity = predVelocity.*(maxVelocityPred/n);
    end

end

