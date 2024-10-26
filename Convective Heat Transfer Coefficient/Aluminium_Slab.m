M = readmatrix('Aluminium_Slab.xlsx');
T = M(:, 2);
T_infin = M(:, 4);

l = 0.15;
b = 0.04;
h = 0.01;

A = 2*(l*b+h*(l+b));
V = l*b*h;

[h_bar, h_t, h_overall] = Q1(2700, 890, V, A, T, T_infin, 44, 110, 'Aluminium Slab');