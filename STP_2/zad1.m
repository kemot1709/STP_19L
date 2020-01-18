clear;
params;

Gciagly = tf(K,[T1*T2 T2+T1 1], 'InputDelay', T0); % transmitancja ci�g�a
Gdyskr = c2d(Gciagly,Tp,'zoh'); % transmitancja dyskretna

stepplot(Gciagly, 50,'b');
xlabel('t');
ylabel('y(t)');
title('Odpowied� skokowa transmitancji ci�g�ej');
%saveas(gcf,'picture/transciagla.png');

stepplot(Gdyskr, 50,'r');
xlabel('t');
ylabel('y(t)');
title('Odpowied� skokowa transmitancji dyskretnej');
%saveas(gcf,'picture/transdyskr.png');

stepplot(Gciagly, 50,'b');
hold on;
stepplot(Gdyskr, 50,'r');
xlabel('t');
ylabel('y(t)');
title('Wykres odpowiedzi skokowej transmitancji dyskretnej na tle transmitancji ci�g�ej');
legend ('transmitancja ci�g�a', 'transmitancja dyskretna','Location','best');
%saveas(gcf,'picture/transobie.png');
hold off;