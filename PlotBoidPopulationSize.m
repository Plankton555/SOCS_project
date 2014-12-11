function PlotBoidPopulationSize(time, dataPopulationSize, numberOfBoids)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

handler = figure;
plot(time, dataPopulationSize);
grid on;
ylim([0 numberOfBoids]);
title('Population size');
xlabel('Time');
ylabel('Percentage of population size');

saveas(handler,'Images/Population size.png')
saveas(handler,'Images/Population size.eps')

end

