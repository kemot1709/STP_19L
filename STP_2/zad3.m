clear;
params;
zad1;

Kk = 0.41442; % wyznaczony doœwiadczalnie

Gzwr = (Kk*Gciagly)/(1+Kk*Gciagly); % Sprzê¿enie zwrotne

stepplot(Gzwr, 10000,'g');
xlabel('t');
ylabel('y(t)');
title('Oscylacje krytyczne obiektu dla d³ugiego czasu obserwacji');
%saveas(gcf,'picture/osc_krytyczne_dlugie.png');

stepplot(Gzwr, 100,'g');
xlabel('t');
ylabel('y(t)');
title('Oscylacje krytyczne obiektu dla krótkiego czasu obserwacji');
%saveas(gcf,'picture/osc_krytyczne_krotkie.png');

Tk = 20.04; % odczytane z wykresu
Kr = 0.6 * Kk;
Ti = 0.5 * Tk;
Td = 0.12 * Tk;
r0 = Kr*(Tp/(2*Ti)+Td/Tp+1);
r1 = Kr*(Tp/(2*Ti)-2*(Td/Tp)-1);
r2 = Kr*Td/Tp;
