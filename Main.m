
%Boids test
%Skrev en liten test funktion som implementerar en väldigt enkel boids
%model
numberOfBoids = 100;
cohesionFactor = 0.01;
alignmentFactor = 0.125;
separationFactor = 1;
separationRadiee = 1;
maxPositions = [50,50,50];

boidPositions = InitializePositions(numberOfBoids,maxPositions);
boidVelocities = zeros(numberOfBoids,3);

figure
PlotBoids(boidPositions);

for i = 1:100
  for iBoid = 1:numberOfBoids
    
    boidVelocities(iBoid,:) = UpdateBoidVelocity(boidPositions, boidVelocities,...
      iBoid,cohesionFactor,alignmentFactor, separationFactor, separationRadiee);
    
  end
  
  boidPositions = boidPositions + boidVelocities;
  pause(0.1)
  PlotBoids(boidPositions);
  
end
