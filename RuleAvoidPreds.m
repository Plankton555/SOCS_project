function avoidPredVelocity = RuleAvoidPreds(predPositions, visiblePredators,iBoidPosition, avoidPredFactor, dimension)
%RuleAvoidPreds Summary of this function goes here


avoidPredVelocity = zeros(1,dimension);

for jPred = visiblePredators
    differVector = (predPositions(jPred,:) - iBoidPosition);
    avoidPredVelocity = avoidPredVelocity - 1./(differVector+0.1);
    %BEWARE OF MAGICAL NUMBERS!
end
avoidPredVelocity = avoidPredFactor * avoidPredVelocity;
end

