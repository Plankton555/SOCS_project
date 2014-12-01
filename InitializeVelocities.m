function boidPVelocities = InitializeVelocities(numberOfBoids,maxVelocity)
boidPVelocities = rand(numberOfBoids,3)*2-1;
%Norming the velocities
for iBoid=1:numberOfBoids
    boidPVelocities(iBoid,:) = rand/norm(boidPVelocities(iBoid,:))*maxVelocity.*(boidPVelocities(iBoid,:));
end
end

