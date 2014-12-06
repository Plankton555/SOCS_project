function PlotBoidSeparationDistance(time, dataMeanSeparation)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

figure;
plot(time, dataMeanSeparation);
grid on;
ylim([0 max(dataMeanSeparation)*1.1]);
legend('average separation distance', 'Location', 'best');

end

