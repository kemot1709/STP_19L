slicz = conv(b1, b2);
smian = conv(a1,conv(a2,a3));

[zlicz, zmian] = c2dm (slicz, smian, T, 'zoh');

roots(slicz)
roots(smian)
roots(zlicz)
roots(zmian)
