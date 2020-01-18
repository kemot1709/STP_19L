clear zo1;
clear zo2;
clear zo3;

zo1=0.3;
zo2=0.1;
zo3=0.5;
%L=acker(A1',C1',[zo1 zo2 zo3]);
zo=0.5;
L=acker(A1',C1',[zo zo zo]);

xo1(1)=0;
xo2(1)=0; 
xo3(1)=0;

for k=2:k_konc
     pom=(y(k-1)-C1*[xo1(k-1);xo2(k-1);xo3(k-1)]);
     xo1(k)=A1(1,1)*xo1(k-1)+A1(1,2)*xo2(k-1)+A1(1,3)*xo3(k-1)+u(k-1)+L(1,1)*pom;
     xo2(k)=xo1(k-1)+L(1,2)*pom;
     xo3(k)=xo2(k-1)+L(1,3)*pom;
end 

subplot(2,2,1);
stairs(x1,'b'); 
title('x1'); 
xlabel('k');
hold on;
stairs(xo1,'r');
hold off;

subplot(2,2,2);
stairs(x2,'b'); 
title('x2'); 
xlabel('k');
hold on;
stairs(xo2,'r');
hold off;

subplot(2,2,3);
stairs(x3,'b'); 
title('x3'); xlabel('k');
hold on;
stairs(xo3,'r');
hold off;

legend('stan rzeczywisty','stan obserwowany');
