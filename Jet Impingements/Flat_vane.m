%%Data and Errors
Q_e = [374.32, 365.4, 362.51, 362.734, 372.8521, 376.2, 220.2232, 230.51, 230.5];
F_e = 10e-4.*[4958.71, 4724.99, 4650.73, 4656.6, 4919.881, 5008.03, 1716.36, 1880.52, 1880.28];


e_Q = 10e-4 .* ones(size(Q_e));
e_r_neg = e_Q; e_r_pos = e_Q;

e_f = 0.05 .* ones(size(F_e));
e_H_neg = e_f; e_H_pos = e_f;

%% Theoretical Calculations
A_n = 2.82*10e-6;
flow_t = 10e-7*linspace(220, 380, 100);
rho = 998;
F_t = (353.5*10e+4) .* (flow_t.^2);

flow_t = 10e+5*flow_t;

%% Plot
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
errorbar(Q_e,F_e,e_H_neg,e_H_pos,...
    e_r_neg, e_r_pos,'o', ...
    'DisplayName','Flat Vane Force', ...
    'MarkerFaceColor','red', ...
    'MarkerEdgeColor','none', ...
    'Color','black', ...
    'LineWidth', 1);
hold on;
plot(flow_t, F_t, 'b',...
    'DisplayName', 'Theory')

title('Force vs Flow Rate')
%xlim([0,0.3]);
%ylim([0.24,0.265]);   % optional to resize axis limits
xlabel('Flow Rate[cc]');
ylabel('Force [N]');
lgd = legend; 
lgd.Location = 'SouthEast';

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')

set(gca,'FontSize',12)