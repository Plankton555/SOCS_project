function visibilityMatrix = GetVisibilityWrapAround(boidPositions, ...
  maxPositions,visibilityRange)
%getVisibility Returns a n x n matrix with which visible for all boids.
%With the visible neigbours as 1 in the row vector for each boid. 

  [numberOfBoids,~] = size(boidPositions);
%   visibilityMatrix = ones(numberOfBoids,numberOfBoids);
  visibilityMatrix = zeros(numberOfBoids,numberOfBoids,4);
  for i = 1:numberOfBoids
    for j = i+1:numberOfBoids
      [xDistSquare, xIndex] = min([...
        (boidPositions(i,1) - boidPositions(j,1) + maxPositions(1))^2,...
        (boidPositions(i,1) - boidPositions(j,1))^2,...
        (boidPositions(i,1) - boidPositions(j,1) - maxPositions(1))^2]);
      
      [yDistSquare, yIndex] = min([...
        (boidPositions(i,2) - boidPositions(j,2) + maxPositions(2))^2,...
        (boidPositions(i,2) - boidPositions(j,2))^2,...
        (boidPositions(i,2) - boidPositions(j,2) - maxPositions(2))^2]);
      
      [zDistSquare, zIndex] = min([...
        (boidPositions(i,3) - boidPositions(j,3) + maxPositions(3))^2,...
        (boidPositions(i,3) - boidPositions(j,3))^2,...
        (boidPositions(i,3) - boidPositions(j,3) - maxPositions(3))^2]);
      
      distance = sqrt(xDistSquare + yDistSquare + zDistSquare);

      if(distance < visibilityRange)
        visibilityMatrix(i,j,1) = 1;
        visibilityMatrix(j,i,1) = 1;
        
        visibilityMatrix(i,j,2) = -2 + xIndex;
        visibilityMatrix(i,j,3) = -2 + yIndex;
        visibilityMatrix(i,j,4) = -2 + zIndex;
        
        visibilityMatrix(j,i,2) = +2 - xIndex;
        visibilityMatrix(j,i,3) = +2 - yIndex;
        visibilityMatrix(j,i,4) = +2 - zIndex;

      end

    end
  end
end

