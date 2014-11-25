function predVelocity = UpdatePredVelocity(predPositions, predVelocities,...
    boidPositions, iPred, paramVector)
    %UpdatePredVelocity Function to update the velocities of the predators

    % Extract parameters from paramVector
    maxPos = paramVector(6:8);
    restrictionFactor = paramVector(9);
    huntingFactor = paramVector(11);
    maxVelocityPred = paramVector(12);


    %Cohesion part
    v1 = RuleHuntBoids(predPositions, boidPositions, iPred, huntingFactor);
    fprintf('huntingVelocity: (%.4f, %.4f, %.4f) \n', v1(1), v1(2), v1(3));

    %Keep them in a region
    v2 = RuleRestrictedRegion(predPositions, maxPos,iPred, ...
        restrictionFactor);
    fprintf('restrictionVelocity: (%.4f, %.4f, %.4f) \n\n', v2(1), v2(2), v2(3));

    predVelocity = predVelocities(iPred,:) + v1 + v2;

    % Restrict maximum velocity
    n = norm(predVelocity);
    if n>maxVelocityPred
        predVelocity = predVelocity.*(maxVelocityPred/n);
    end

end

