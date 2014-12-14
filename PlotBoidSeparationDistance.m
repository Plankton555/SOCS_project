function PlotBoidSeparationDistance(time, dataMeanSeparation)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

handler = figure;
plot(time, dataMeanSeparation);
grid on;
ylim([0 max(dataMeanSeparation)*1.1]);
title('Average separation distance')
xlabel('Time');
ylabel('Unit length');

%saveas(handler,'Images/Average-separation-distance.png')
%saveas(handler,'Images/Average-separation-distance.eps','epsc')
saveas(handler,'C:/tmpplots/Average-separation-distance.png')
saveas(handler,'C:/tmpplots/Average-separation-distance.eps','epsc')

end

