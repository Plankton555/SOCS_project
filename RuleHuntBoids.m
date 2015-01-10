function [huntingVelocity,targetPreyIndex] = RuleHuntBoids(...
    boidPositions, predPosition,maxPos, huntingFactor)
%RuleHuntBoids

nrBoids = size(boidPositions, 1);
myPos = predPosition;
minDist = inf;
differVector = zeros(1,3);
targetPreyIndex =0;

%Calc distance, pick the closest
for iBoid = 1:nrBoids
    [xDistSquare, xIndex] = min([...
        (boidPositions(iBoid,1) - myPos(1) + maxPos(1))^2,...
        (boidPositions(iBoid,1) - myPos(1))^2,...
        (boidPositions(iBoid,1) - myPos(1) - maxPos(1))^2]);
    xDiff = boidPositions(iBoid,1) - myPos(1) + ...
        (2-xIndex)*maxPos(1);
    
    [yDistSquare, yIndex] = min([...
        (boidPositions(iBoid,2) - myPos(2) + maxPos(2)).^2,...
        (boidPositions(iBoid,2) - myPos(2)).^2,...
        (boidPositions(iBoid,2) - myPos(2) - maxPos(2)).^2]);
    yDiff = boidPositions(iBoid,2) - myPos(2) + ...
        (2-yIndex)*maxPos(2);
    
    [zDistSquare, zIndex] = min([...
        (boidPositions(iBoid,3) - myPos(3) + maxPos(3)).^2,...
        (boidPositions(iBoid,3) - myPos(3)).^2,...
        (boidPositions(iBoid,3) - myPos(3) - maxPos(3)).^2]);
    zDiff = boidPositions(iBoid,3) - myPos(3) + ...
        (2-zIndex)*maxPos(3);
    
    distance = sqrt(xDistSquare + yDistSquare + zDistSquare);
    if(distance<=minDist)
        differVector = [xDiff,yDiff,zDiff];
        targetPreyIndex = iBoid;
        minDist = distance;
    end
end

huntingVelocity = differVector./minDist;
huntingVelocity = huntingFactor .* huntingVelocity;

end

