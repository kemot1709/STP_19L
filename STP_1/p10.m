clear u
clear x1
clear x2
clear x3
clear y
clear zo1;
clear zo2;
clear zo3;

zb = 0.5;
K1 = acker(A1, B1, [zb,zb,zb]);
zb1 = 0.3;
zb2 = 0.7+0.3i;
%K1 = acker(A1, B1, [zb1,zb2,conj(zb2)]);

zo=0.8;
L=acker(A1',C1',[zo zo zo]);

k_konc=50;
x1(1)=3; 
x2(1)=-1; 
x3(1)=-2;
x1(k_konc)=0; 
x2(k_konc)=0; 
x3(k_konc)=0;
xo1(1)=0;
xo2(1)=0; 
xo3(1)=0;

u(1)=-(K1(1,1)*x1(1)+K1(1,2)*x2(1)+K1(1,3)*x3(1));
y(1)=C1(1,1)*x1(1)+C1(1,2)*x2(1)+C1(1,3)*x3(1);

for k=2:k_konc
     x1(k)=A1(1,1)*x1(k-1)+A1(1,2)*x2(k-1)+A1(1,3)*x3(k-1)+u(k-1);
     x2(k)=x1(k-1);
     x3(k)=x2(k-1);
     y(k)=C1(1,1)*x1(k)+C1(1,2)*x2(k)+C1(1,3)*x3(k);
     
     pom=(y(k-1)-C1*[xo1(k-1);xo2(k-1);xo3(k-1)]);
     xo1(k)=A1(1,1)*xo1(k-1)+A1(1,2)*xo2(k-1)+A1(1,3)*xo3(k-1)+u(k-1)+L(1,1)*pom;
     xo2(k)=xo1(k-1)+L(1,2)*pom;
     xo3(k)=xo2(k-1)+L(1,3)*pom;
     
     u(k)=-(K1(1,1)*xo1(k)+K1(1,2)*xo2(k)+K1(1,3)*xo3(k));
end 

subplot(2,2,1);
stairs(x1,'m'); 
title('x1'); 
xlabel('k');
hold on;
stairs(xo1,'g');
hold off;

subplot(2,2,2);
stairs(x2,'m'); 
title('x2'); 
xlabel('k');
hold on;
stairs(xo2,'g');
hold off;

subplot(2,2,3);
stairs(x3,'m'); 
title('x3'); 
xlabel('k');
hold on;
stairs(xo3,'g');
legend('regulator','obserwator');
hold off;

subplot(2,2,4);
stairs(u);
xlabel('k');
hold on;
stairs(y);
legend('wartoœæ sterowania','odpowiedŸ uk³adu');
hold off;