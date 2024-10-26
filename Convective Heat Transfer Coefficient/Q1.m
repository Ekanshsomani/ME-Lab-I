function [h_bar, h_t, h_overall] = Q1(rho, c_p, V, A, T, T_infin, start, last, name)
const = rho*V*c_p/A ;
l = length(T);
delT = -T(1:l-1) + T(2:l);

T = T(start:last);
delT = delT(start:last);
T_infin = T_infin(start:last);

%heat transfer coefficient
T_infin_average = mean(T_infin);
h_t = const * (delT ./ (T_infin_average - T));
h_bar = mean(h_t)

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(h_t, 'r');
yline(h_bar, 'g');
title(name)
xlabel('Time [sec]');
ylabel('h(t) [W/m^2-K]');
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')
set(gca,'FontSize',12)

h_overall = createFit(T, const, T_infin_average, name)