function PlotHuntingTarget( targetIndex )

handler = figure;
plot(targetIndex,'.');
grid on;
title('Targeting of the predators')
xlabel('Time');
ylabel('Prey identifier');


saveas(handler,'Images/Targeting-of-the-predators.png')
saveas(handler,'Images/Targeting-of-the-predators.eps')

end

