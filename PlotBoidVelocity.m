function PlotBoidVelocity(time, dataMeanVelocity)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

figure;
plot(time, dataMeanVelocity);
grid on;
legend('Velocity (x axis)', 'Velocity (y axis)', 'Velocity (z axis)',...
  'Speed', 'Location', 'best');
xlabel('Time');
ylabel('Quantity');

end

