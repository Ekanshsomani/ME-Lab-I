M = readmatrix('Brass_Sphere.xlsx');
T = M(:, 2);
T_infin = M(:, 4);

r = 0.02;
A = 4*pi*r^2;
V = 4/3 * pi * r^3;

[h_bar, h_t, h_overall] = Q1(8500, 380, V, A, T, T_infin, 15, 100, 'Brass Sphere');