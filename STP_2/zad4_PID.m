clear;
params;
zad3;

time=250; % czas symulacji
delay=13; % wynika z koniecznoœci ustabilizowania siê sygna³u steruj¹cego, który potrzebuje danych z próbki u(k-12)

% pocz¹tkowe wartoœci
u(1:delay) = 0;
y(1:delay) = 0;
e(1:delay) = 0;

% Wartoœæ zadana
yzad(1:delay)=0; % Czekanie na wystajczaj¹co stary sygna³ sterowania
yzad(delay:time)=1;

[Num,Den] = tfdata(Gdyskr,'v');
b1 = Num(1,2);
b2 = Num(1,3);
a1 = Den(1,2);
a2 = Den(1,3);

% Oblicznie sygna³u wyjœciowego
for k=delay:time
    y(k) = -a1*y(k-1)-a2*y(k-2)+b1*u(k-11)+b2*u(k-12);
    e(k) = yzad(k)-y(k);
    u(k) = r2*e(k-2) + r1*e(k-1) + r0*e(k) + u(k-1);
end

stairs(yzad,'--r','LineWidth',1);
hold on;
stairs(u,'g');
stairs(y,'b');
xlabel('k'); 
ylabel(sprintf('y(k)\nu(k)'));
legend ('Wyjœcie zadane modelu', 'Sygna³ steruj¹cy',  'Wyjœcie modelu','Location','best');
title('Wykres sterowania i wyjœcia modelu na tle wartoœci zadanej');
%saveas(gcf,'picture/PID.png');
hold off;