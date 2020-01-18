clear;
params;
zad3;

clear M Mp s y u;

% Odczytany z wykresu odpowiedzi skokowej
D = 37/Tp; % D³ugoœæ horyzontu dynamiki

% Wyznaczane w trakcie strojenia
lambda = 50; % Wsó³czynnik kary za skoki sterowania
N = 16; % Dlugosc horyzontu predykcji
Nu = 1; % Dlugosc horyzontu sterowania

time = 100; % czas trwania symulacji

[Num,Den] = tfdata(Gdyskr,'v');
b1 = Num(1,2);
b2 = Num(1,3);
a1 = Den(1,2);
a2 = Den(1,3);

% Oblicznie wektora s
b = [zeros(10,1);b1;b2;zeros(D-12,1)];
s(1)=0;
s(2)=0;
for k=3:D
    pom = 0;
    for i=1:k
        pom = pom + b(i);
    end
    s(k) = pom - a1*s(k-1)- a2*s(k-2);
    clear pom;
end

% Obliczanie macierzy M
for i=1:N
   for j=1:Nu
      if (i>=j)
         M(i,j)=s(i-j+1);
      end
   end
end

% Obliczanie macierzy Mp
for i=1:N
   for j=1:D-1
      if i+j<D
         Mp(i,j)=s(i+j)-s(j);
      else
         Mp(i,j)=s(D)-s(j); % s(D) ~= K
      end     
   end
end

psi = eye(N);
lam_up = eye(Nu)*lambda;

% Wzmocnienie sygna³u
Kw = (M'*psi*M+lam_up)^(-1)*M'*psi;

% Pocz¹tkowy wektor predykcji sterowania
dUp = zeros(D-1,1);

% Wartoœæ zadana sta³a na ca³ej d³ugoœci
y_zad = ones(N,1);

% Oblicznaie sterowania i wyjscia
for k=1:time
    if k>12
        y(k)=-a1*y(k-1)-a2*y(k-2)+b1*u(k-11)+b2*u(k-12);
    elseif k>11
        y(k)=-a1*y(k-1)-a2*y(k-2)+b1*u(k-11);
    elseif k>2
        y(k)=-a1*y(k-1)-a2*y(k-2);
    elseif k>1
        y(k)=-a1*y(k-1);
    else
        y(k) = 0;
    end
    
    % Obliczanie wektora Y(k)
    y_N = ones(N,1)*y(k);
    
    % Obliczanie wektora Y0(k)
    y0 = y_N + Mp*dUp;
    
    % Obliczniae dU(k)
    dU = Kw*(y_zad-y0);
    
    % Wyci¹ganie sterowania z wektora dU(k)
    if k>1
        u(k) = u(k-1) + dU(1);
    else
        u(k) = dU(1);
    end
    
    % Obliczanie nowego wektora presykcji sterowania
    dUp = [dU(1);dUp(1:end-1)];
end

stairs( u, 'g');
hold on;
yzad(1:time) = 1;
stairs(yzad, 'r');
stairs(y, 'b');
title(sprintf('Dzialanie regulatora dla nastaw D = %i, N = %i, Nu = %i, lambda = %i',D,N,Nu,lambda));
legend('Sterowanie', 'Wyjœcie zadane', 'Wyjœcie regulatora', 'Location', 'best');
xlabel('k');
ylabel(sprintf('y(k)\nu(k)'));
% saveas(gcf,sprintf('picture/DMC_%i_%i_%i_%i.png',D,N,Nu,lambda));
hold off;