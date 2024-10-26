M = readmatrix('SS_Cylinder.xlsx');
T = M(:, 2);
T_infin = M(:, 4);

l = 0.15;
r = 0.007;

A = 2*pi*r*(r+l);
V = pi*l*r^2;

[h_bar, h_t, h_overall] = Q1(8000, 490, V, A, T, T_infin, 24, 110, 'SS Cylinder');