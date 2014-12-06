function PlotBoidPopulationSize(time, dataPopulationSize, numberOfBoids)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

figure;
plot(time, dataPopulationSize);
grid on;
ylim([0 numberOfBoids]);
legend('Population size', 'Location', 'best');

end

