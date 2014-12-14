function PlotHuntingTarget(deltaT, targetIndex, addPredIteration)

nrIterations = size(targetIndex,1);
xAxis = (deltaT*addPredIteration):deltaT:(deltaT*nrIterations);
handler = figure;
plot(xAxis, targetIndex(addPredIteration:end),'.');
grid on;
title('Targeting of the predators')
xlabel('Time');
ylabel('Prey identifier');


%saveas(handler,'Images/Targeting-of-the-predators.png')
%saveas(handler,'Images/Targeting-of-the-predators.eps','epsc')
saveas(handler,'C:/tmpplots/Targeting-of-the-predators.png')
saveas(handler,'C:/tmpplots/Targeting-of-the-predators.eps','epsc')

end

