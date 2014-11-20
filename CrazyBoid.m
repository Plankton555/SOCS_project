function boidVelocities = CrazyBoid(boidVelocities,pCrazy,maxVelocity)
nBoids = size(boidVelocities,1);
for iBoid = 1:nBoids
    if(rand<pCrazy)
        boidVelocities(iBoid,:) = InitializeVelocities(1,maxVelocity);
    end
end
end

