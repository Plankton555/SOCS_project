function boidPositions = InitializePositions(numberOfBoids,positionMax)

boidPositions = zeros(numberOfBoids,3);

for iBoid = 1:numberOfBoids
  r = rand(1,3);
  boidPositions(iBoid,:) =  positionMax./2 - r.*positionMax; 
end
