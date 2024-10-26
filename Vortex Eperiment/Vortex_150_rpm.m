%% Data and errors
x = [19.9,19.3,18.1,16.9,15.9,14.2,12.3,10.8,10.2, 8.9, 7.3, 6.3 , 5.3, 4.1, 3.1, 2.1, 1.6];
y = [30.1, 28.6, 27.4, 25.4, 24.5, 22.2, 20.8, 20.3, 20.4, 20.7, 21.7, 22.8, 23.7, 25.5, 27.5, 29.5, 30.5];

e_r = 0.2 .* ones(size(x));
e_r_neg = e_r; e_r_pos = e_r;

e_H = 0.5 .* ones(size(y));
e_H_neg = e_H; e_H_pos = e_H;

%% To plot theoretical results as a smooth curve 
% consider a larger a number of points

r_range_theory = linspace(1,20,100);
H_theory = 20.3 + 0.126 .* (r_range_theory - 10.8).^2;

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

title('Forced Vortex 150 rpm')
xlim([0,20]);
ylim([20,32]);   % optional to resize axis limits
xlabel('Radial position [cm]');
ylabel('Height of interface [cm]');
grid on; grid minor;
ax = gca;
ax.GridAlpha = 0.5;
lgd = legend; 
lgd.Location = 'SouthEast';