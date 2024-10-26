M = readmatrix('intensitydistance.xlsx');

%% Getting Data
T = mean(M(:, 8));
I1 = M(1:141,9);
I2 = M(143:634, 9);
I3 = M(635:1336, 9);

I_noise = M(:, 9);
I = [satu(I1) satu(I2) satu(I3)];
R = 1e-2 * [15 20 25];

e_r = 2e-3*ones(size(R));
e_i = 10*ones(size(I));

%Const Calculations
sigma = 5.67*1e-8;
const = (T+273.15)^4*sigma/(4*pi);

%% Fitting the curve
[xData, yData] = prepareCurveData( R, I );

% Set up fittype and options.
s = sprintf('a*%f*1/x^2', const);
ft = fittype( s, 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.12;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
errorbar(R,I,e_i,e_i,...
    e_r, e_r,'o', ...
    'DisplayName','forced vortex', ...
    'MarkerFaceColor','red', ...
    'MarkerEdgeColor','none', ...
    'Color','black', ...
    'LineWidth', 1);
h = plot( fitresult, xData, yData );

title('Intensity vs Distance')
xlabel('Distance[m]');
ylabel('Intensity[W/m^2]');
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');


legend( h, 'Intensity', 'Best Fit', 'Location', 'NorthEast', 'Interpreter', 'none' );

% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')
set(gca,'FontSize',12)

%% Plotting Intensity with time
figure2 = figure;
axes2 = axes('Parent', figure2);
hold(axes1, 'on')
plot(I_noise, 'LineWidth', 2.0, 'Color', 'b')

title('Intensity vs Time')
xlabel('Time[s]');
ylabel('Intensity[W/m^2]');
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'off');
set(axes2,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')
set(gca,'FontSize',12)
