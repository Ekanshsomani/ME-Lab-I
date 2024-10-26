Re = [4231.9939, 3800.55, 3373.87];
f = [0.33985, 0.5678, 0.9658];

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
errorbar(Re,f,e_H_neg,e_H_pos,...
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
ylabel('Bernoulli Constant [m]');

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')

set(gca,'FontSize',12)