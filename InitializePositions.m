function boidPositions = InitializePositions(numberOfBoids,positionMax)
r = rand(numberOfBoids,3);
boidPositions = r.*(zeros(numberOfBoids,3)+50);
end

