[A1, B1, C1, D1]=tf2ss(zlicz, zmian);

A2 = A1';
B2 = C1';
C2 = B1';
D2 = D1';

sim('p2sim',2.5);
plot(simout);
title('OdpowiedŸ skokowa uk³adu dla niezerowych warunków pocz¹tkowych');
xlabel('t');
ylabel('y');
%saveas(gcf,'p2nzero.png');