function PlotBoidSeparationDistance(time, dataMeanSeparation)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

figure;
plot(time, dataMeanSeparation);
grid on;
legend('average separation distance', 'Location', 'best');

end

