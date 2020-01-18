clear;

x = 1:0.1:2;
% obliczone doœwiadczalnie
y1 = [1.594 1.52 1.455 1.398 1.347 1.298 1.254 1.211 1.172 1.136 1.1];
y2 = [1.692 1.677 1.64 1.592 1.537 1.48 1.426 1.372 1.321 1.272 1.223];

plot(x,y1,'bx');
title('Wykres zale¿noœci K0/K0n od T0/T0n dla modelu ze sterowaniem PID');
xlabel('T0/T0n');
ylabel(sprintf('K0/K0n'));
%saveas(gcf,'picture/6_PID_out.png');

plot(x,y2,'r+');
title('Wykres zale¿noœci K0/K0n od T0/T0n dla modelu ze sterowaniem DMC');
xlabel('T0/T0n');
ylabel(sprintf('K0/K0n'));
%saveas(gcf,'picture/6_DMC_out.png');

plot(x,y1,'bx');
hold on;
plot(x,y2,'r+');
ylim([0 2.5]);
title('Wykres zale¿noœci K0/K0n od T0/T0n dla sterowania PID i DMC');
xlabel('T0/T0n');
ylabel(sprintf('K0/K0n'));
legend ('PID','DMC','Location','best');
%saveas(gcf,'picture/6_OUT.png');
hold off;