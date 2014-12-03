function meanSeparation = DataGatherSeparation(positions)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

posWoNaN = positions(~any(isnan(positions),2),:);
pairwiseDistance = pdist(posWoNaN);
meanSeparation = mean(pairwiseDistance);

end

