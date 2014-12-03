function boidVisibilityMatrix = GetVisibility(boidPositions,predPositions, visibilityRange)
%getVisibility Returns a n x n matrix with which visible for all boids.
%With the visible neigbours as 1 in the row vector for each boid.

[numberOfBoids,~] = size(boidPositions);
[numberOfPredators,~] = size(predPositions);
boidVisibilityMatrix = zeros(numberOfBoids,numberOfBoids);
boidPredatorVisibilityMatrix = zeros(numberOfBoids,numberOfPredators);
predatorBoidVisibilityMatrix = zeros(numberOfPredators,numberOfBoids);

for i = 1:numberOfBoids
    for j = i+1:numberOfBoids
        distance = norm(boidPositions(i,:) - boidPositions(j,:));
        if(distance < visibilityRange)
            boidVisibilityMatrix(i,j) = 1;
            boidVisibilityMatrix(j,i) = 1;
        end
    end
end

end

