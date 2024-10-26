M = readmatrix('TemperatureDependence.xlsx');
T_source = M(:, 8);
I = M(:, 9);
T_source = T_source+273.15;
[xData, yData] = prepareCurveData(T_source, I);

const = 20.05*10e-9;
%s = sprintf('%f*a*x^4', const);
ft = fittype('20.05*10e-9*a*x^4', 'independent', 'x', 'dependent', 'y');
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = 0.12;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
h = plot( fitresult, xData, yData );

title('Radiation Dependence on Temperature')
xlabel('Temperature [K]');
ylabel('Intensity [w/m^2]');
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');


legend( h, 'Intensity', 'Best Fit', 'Location', 'SouthEast', 'Interpreter', 'none' );

% Set the remaining axes properties
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')
set(gca,'FontSize',12)