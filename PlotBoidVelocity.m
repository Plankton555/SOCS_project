function PlotBoidVelocity(time, dataMeanVelocity)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

handler = figure;
plot(time, dataMeanVelocity);
grid on;
title('Velocity')
legend('x-axis', 'y-axis', 'z-axis','Speed', 'Location', 'best');
xlabel('Time');
ylabel('Unitlength per timestep');

saveas(handler,'Images/Velocity.png')

saveas(handler,'Images/Velocity.eps')

end

