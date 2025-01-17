function [fitresult, gof] = createFit(Tin, e)
%CREATEFIT(TIN,E)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : Tin
%      Y Output: e
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 31-Oct-2022 13:13:28


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( Tin, e );
e_tin = 1*ones(1, 8);
e_tin_neg = e_tin; e_tin_pos = e_tin;
e_e = 0.0724*ones(1, 8);
e_e_neg = e_e; e_e_pos = e_e;

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure1 = figure( 'Name', 'Efficiency of Solar Thermal Water Heater' );
axes1 = axes('Parent', figure1);
hold(axes1,'on');
errorbar(Tin,e,e_e_neg,e_e_pos,...
    e_tin_neg, e_tin_pos,'o', ...
    'DisplayName','Hemispherical Vane Force', ...
    'MarkerFaceColor','red', ...
    'MarkerEdgeColor','none', ...
    'Color','black', ...
    'LineWidth', 1);
plot(fitresult, xData, yData );
% Label axes
title('Efficiency of Solar Thermal Water Heater');
xlabel( 'Inlet Temperature(T_in)[^oC]', 'Interpreter', 'none' );
ylabel( 'Efficiency', 'Interpreter', 'none' );

lgd = legend;
lgd.Location = 'SouthEast';

% Set the remaining axes properties
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on',...
    'YMinorGrid','on','ZMinorGrid','on')
set(gca,'FontSize',12)


