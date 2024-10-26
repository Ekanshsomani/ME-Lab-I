x = [44.1, 43, 42, 41, 40, 39, 38, 37.5, 37.2, 37.1, 37, 36.7, 36.5, 36.3, 36, 35, 34, 33.8, 33.6, 33, 32.7, 32.2, 32, 31, 30, 29, 28, 27, 26.3];
y = [23.8, 23.8, 23.8, 23.6, 23.4, 23.1, 22.7, 22, 21.3, 21, 20.4, 19, 16.8, 12.8, 0, 0, 0, 13, 16.9, 20.3, 21.5, 22.2, 22.9, 23.1, 23.4, 23.5, 23.8, 23.8, 23.8];
r = abs(x - 35);
r = [r(1:14),r(18:29)];
y = [y(1:14),y(18:29)];
x = r.^-2;
createFit(x, y)

% Create ylabel
ylabel('Height of interface [cm]');

% Create xlabel
xlabel('Inverse-Square of Distance From Centre (1/r^2) [cm^-2]');

% Create title
title('Free Vortex');

box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on');