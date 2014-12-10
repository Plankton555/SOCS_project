function [  ] = PlotBoidsRelations(boidPositions,maxPositions)
%PlotBoidsRelations Summary of this function goes here
 [numberOfBoids,~] = size(boidPositions);


  distanceMatrix = zeros(numberOfBoids,numberOfBoids);
  for givenBoid = 1:numberOfBoids
    for otherBoid = 1:numberOfBoids
      [xDistSquare] = min([...
        (boidPositions(givenBoid,1) - boidPositions(otherBoid,1) + maxPositions(1))^2,...
        (boidPositions(givenBoid,1) - boidPositions(otherBoid,1))^2,...
        (boidPositions(givenBoid,1) - boidPositions(otherBoid,1) - maxPositions(1))^2]);
      
      [yDistSquare] = min([...
        (boidPositions(givenBoid,2) - boidPositions(otherBoid,2) + maxPositions(2))^2,...
        (boidPositions(givenBoid,2) - boidPositions(otherBoid,2))^2,...
        (boidPositions(givenBoid,2) - boidPositions(otherBoid,2) - maxPositions(2))^2]);
      
      [zDistSquare] = min([...
        (boidPositions(givenBoid,3) - boidPositions(otherBoid,3) + maxPositions(3))^2,...
        (boidPositions(givenBoid,3) - boidPositions(otherBoid,3))^2,...
        (boidPositions(givenBoid,3) - boidPositions(otherBoid,3) - maxPositions(3))^2]);
      
      distanceMatrix(otherBoid,givenBoid) = sqrt(xDistSquare + yDistSquare + zDistSquare);
      
    end
  end
  
  [numAtDist,distance] = hist(distanceMatrix,150);
  
  meanNumAtDist = mean(numAtDist,2);
  maxMean = max(meanNumAtDist);
  figure
  plot(distance,meanNumAtDist/maxMean)
  xlabel('Distance')
  ylabel('Quantity')
end

