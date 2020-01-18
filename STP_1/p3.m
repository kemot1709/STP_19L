syms z;
G1 = simplify(C1*inv(z*eye(3)-A1)*B1+D1);
G2 = simplify(C2*inv(z*eye(3)-A2)*B2+D2);
double(solve(G1))
double(solve(G2))
roots(zlicz)
G1-G2