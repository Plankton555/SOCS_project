function alignmentVelocity = RuleAlignment(boidVelocities, iBoid, alignmentFactor, numberOfBoids)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

centerOfVelocity = (sum(boidVelocities) - boidVelocities(iBoid,:))/ ...
  (numberOfBoids-1);
alignmentVelocity = alignmentFactor * centerOfVelocity;

end

