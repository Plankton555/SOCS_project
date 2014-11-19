function [restrictionVelocities] = RuleRestrictedRegion(...
    boidPositions, maxPos,iBoid,restrictionFactor)
%RuleRestrictedRegion Summary of this function goes here

restrictionVelocities = zeros(1,3);

% Restrict the axes
    differensVector = boidPositions(iBoid,:) - maxPos;
    indexLow = find(boidPositions(iBoid,:) < 0);
    indexHigh = find(differensVector > 0);
    
    
    for k=indexLow
      restrictionVelocities(k) = -boidPositions(iBoid,k)*restrictionFactor;
    end
    for k=indexHigh
      restrictionVelocities(k) = -differensVector(k)*restrictionFactor;
    end 
    

end


