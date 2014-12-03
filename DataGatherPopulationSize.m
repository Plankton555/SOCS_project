function populationSize = DataGatherPopulationSize(positions)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

populationSize = numel(find(~any(isnan(positions), 2)));

end

