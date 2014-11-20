function alignmentVelocity = RuleAlignment(boidVelocities, ...
  visibleNeighbours, alignmentFactor, numberOfBoids)
%RuleAlignment Summary of this function goes here

centerOfVelocity = (sum(boidVelocities(visibleNeighbours,:),1))/...
  (numberOfBoids);
alignmentVelocity = alignmentFactor * centerOfVelocity;

end

