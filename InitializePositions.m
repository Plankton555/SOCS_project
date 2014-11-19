function boidPositions = InitializePositions(numberOfBoids,positionMax)
r = rand(numberOfBoids,3);
boidPositions = r.*(repmat(positionMax, numberOfBoids, 1));
end

