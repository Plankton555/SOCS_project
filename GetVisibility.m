function visibilityMatrix = GetVisibility(boidPositions, visibilityRange)
%getVisibility Returns a n x n matrix with which visible for all boids.
%With the visible neigbours as 1 in the row vector for each boid. 

  [numberOfBoids, dimensions] = size(boidPositions);
  visibilityMatrix = zeros(numberOfBoids,numberOfBoids);
  for i = 1:numberOfBoids
    for j = i+1:numberOfBoids

%       distance = sqrt(sum((boidPositions(i,:) - boidPositions(j,:)).^2));
      distance = norm(boidPositions(i,:) - boidPositions(j,:));

      if(distance < visibilityRange)
        visibilityMatrix(i,j) = 1;
        visibilityMatrix(j,i) = 1;
      end

    end
  end
end

