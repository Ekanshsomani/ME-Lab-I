d = [0.03, 0.059, 0.088, 0.117, 0.146, 0.175, 0.204, 0.233, 0.262];
t_head = 0.01*[22.54, 22.36, 22.11, 22.14, 21.91, 21.24, 21.21, 21.46, 21.64];

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
    'DisplayName','Experimental Obsevation', ...
    'MarkerFaceColor','red', ...
    'MarkerEdgeColor','none', ...
    'Color','black', ...
    'LineWidth', 1);

title('Bernoulli Plot 51.8 cm^3/s')
xlim([0,0.3]);
ylim([0.21,0.23]);   % optional to resize axis limits
xlabel('Distance from inlet[m]');
ylabel('Bernoulli Constant [m]');

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')

set(gca,'FontSize',12)