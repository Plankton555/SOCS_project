function PlotBoidVelocity(time, dataMeanVelocity)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

figure;
plot(time, dataMeanVelocity);
grid on;
legend('velocity (x axis)', 'velocity (y axis)', 'velocity (z axis)',...
  'speed', 'Location', 'best');

end

