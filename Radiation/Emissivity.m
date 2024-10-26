M1 = readmatrix('experiment2_withoutplate.xlsx');
M2 = readmatrix('experiment2_withplate.xlsx');

%% Getting Data
T1 = mean(M1(:, 8));
I1 = M1(:, 9);
T2 = mean(M2(:, 8));
I2 = M2(:, 9);

%% Calculating emissivity and distance
eA = 0.2565;
sigma = 5.67*1e-8;
c1 = eA*sigma*(T1+273.15)^4/(4*pi);
c2 = eA*sigma*(T2+273.15)^4/(4*pi);
r = sqrt(c1/mean(I1))
e_plate = mean(I2)* r^2/c2
%% Plotting the Data
s1 = sprintf('Without Plate, Mean = %.2f', mean(I1));
s2 = sprintf('With Plate, Mean = %.2f', mean(I2));

figure1 = figure;
axes1 = axes('Parent', figure1);
hold(axes1, 'on')
plot(I1, 'LineWidth', 2.0)
plot(I2, 'LineWidth', 2.0)

title('Intensity vs Time')
xlabel('Time[s]');
ylabel('Intensity [W/m^2]');
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');

legend(s1, s2)

set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')
set(gca,'FontSize',12)