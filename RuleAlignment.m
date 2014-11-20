function alignmentVelocity = RuleAlignment(boidVelocities, ...
  visibleNeighbours, iBoid, alignmentFactor, numberOfBoids)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

centerOfVelocity = (sum(boidVelocities(visibleNeighbours,:)))/...
  (numberOfBoids);
alignmentVelocity = alignmentFactor * centerOfVelocity;

end

