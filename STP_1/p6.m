clear u
clear x1
clear x2
clear x3
clear y

zb = 0.5;
K1 = acker(A1, B1, [zb,zb,zb]);
zb1 = 0.3;
zb2 = 0.7+0.3i;
K2 = acker(A1, B1, [zb1,zb2,conj(zb2)]);

k_konc=50;
x1(1)=3; 
x2(1)=-1; 
x3(1)=-2;
x1(k_konc)=0; 
x2(k_konc)=0; 
x3(k_konc)=0;

u(1)=-(K1(1,1)*x1(1)+K1(1,2)*x2(1)+K1(1,3)*x3(1));
%u(1)=-(K2(1,1)*x1(1)+K2(1,2)*x2(1)+K2(1,3)*x3(1));
y(1)=C1(1,1)*x1(1)+C1(1,2)*x2(1)+C1(1,3)*x3(1);  
for k=2:k_konc
     x1(k)=A1(1,1)*x1(k-1)+A1(1,2)*x2(k-1)+A1(1,3)*x3(k-1)+u(k-1);
     x2(k)=x1(k-1);
     x3(k)=x2(k-1);
     y(k)=C1(1,1)*x1(k)+C1(1,2)*x2(k)+C1(1,3)*x3(k);
     u(k)=-(K1(1,1)*x1(k)+K1(1,2)*x2(k)+K1(1,3)*x3(k));
     %u(k)=-(K2(1,1)*x1(k)+K2(1,2)*x2(k)+K2(1,3)*x3(k));
end

subplot(2,2,1);
stairs(x1,'m'); 
title('x1'); 
xlabel('k');

subplot(2,2,2);
stairs(x2,'m'); 
title('x2'); 
xlabel('k');

subplot(2,2,3);
stairs(x3,'m'); 
title('x3'); 
xlabel('k');

subplot(2,2,4);
stairs(u);
hold on;
subplot(2,2,4);
stairs(y);
xlabel('k');
legend('wartoœæ sterowania','odpowiedŸ uk³adu');
hold off;