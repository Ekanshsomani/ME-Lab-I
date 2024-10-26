%% Data and errors
x = [19.4,18.4, 17.4, 16.1, 15, 14, 13, 12, 11.2, 9.8, 10.5, 9, 8, 7, 6, 5, 4, 3, 2, 1.7];
y = [29.5, 28, 26.5, 25.35, 24.1, 23.2, 22.8, 22, 21.5, 21.6, 21.3, 22.2, 23, 23.5, 24, 24.9, 25.8, 27.1, 29, 29.5];

e_r = 0.2 .* ones(size(x));
e_r_neg = e_r; e_r_pos = e_r;

e_H = 0.5 .* ones(size(y));
e_H_neg = e_H; e_H_pos = e_H;

%% To plot theoretical results as a smooth curve 
% consider a larger a number of points

r_range_theory = linspace(1,20,100);
H_theory = 21.8 + 0.1 .* (r_range_theory - 10.5).^2;

%% Plot
figure;
errorbar(x,y,e_H_neg,e_H_pos,...
    e_r_neg, e_r_pos,'o', ...
    'DisplayName','forced vortex', ...
    'MarkerFaceColor','red', ...
    'MarkerEdgeColor','none', ...
    'Color','black', ...
    'LineWidth', 1);
hold on;    % allows you to overlay a new plot on the same figure
plot(r_range_theory,H_theory, 'b', ...  % blue line plot
    'DisplayName','theory');
hold off;

title('Forced Vortex 130 rpm')
xlim([0,20]);
ylim([20,32]);   % optional to resize axis limits
xlabel('Radial position [cm]');
ylabel('Height of interface [cm]');
lgd = legend; 
lgd.Location = 'SouthEast';

grid on; grid minor;

set(gca,'FontSize',12)