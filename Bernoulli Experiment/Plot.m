d = [0.03, 0.059, 0.088, 0.117, 0.146, 0.175, 0.204, 0.233, 0.262];
A_c = [6.1575, 4.9088, 3.4636, 2.4053, 1.5, 2.4053, 3.4636, 4.9088, 6.1575];
v = [0.108, 0.136, 0.193, 0.277, 0.445, 0.277, 0.193, 0.136, 0.108];
p_head = [0.26, 0.258, 0.256, 0.25, 0.241, 0.238, 0.239, 0.241, 0.244];
v_head = 0.0001 .* [5.987, 9.42, 18.92, 3.92, 100.9, 3.923, 18.92, 9.42, 5.99];
t_head = 0.01*[26.06, 25.9, 25.8, 25.4, 25.11, 24.2, 24.1, 24.2, 24.46];

%For plotting
e_r = 0.001 .* ones(size(d));
e_r_neg = e_r; e_r_pos = e_r;

e_H = 0.0015 .* ones(size(t_head));
e_H_neg = e_H; e_H_pos = e_H;

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
errorbar(d,t_head,e_H_neg,e_H_pos,...
    e_r_neg, e_r_pos,'o', ...
    'DisplayName','forced vortex', ...
    'MarkerFaceColor','red', ...
    'MarkerEdgeColor','none', ...
    'Color','black', ...
    'LineWidth', 1);

title('Bernoulli Plot 66.7 cm^3/s')
xlim([0,0.3]);
ylim([0.24,0.265]);   % optional to resize axis limits
xlabel('Distance from inlet[m]');
ylabel('Total Head [m]');

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')

set(gca,'FontSize',12)