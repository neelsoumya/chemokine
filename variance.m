width = 20;
height = 8;

font_size = 18;
title_font_size = 24;
legend_font_size = 14;

fig = figure();

set(fig, 'PaperUnits', 'inches');
set(fig, 'PaperSize', [width height]);
set(fig, 'Units', 'inches');
set(fig, 'Position', [0 0 width height]);
set(fig, 'PaperPosition', [0 0 width height]);

% Avian

subplot(1, 3, 1)

aavg = mean(vara);
asorted = sort(vara);

plot(time(1:100:end), vara(:,1:100:end), 'color', [.75 .75 .75]);
hold on
plot(time(1:100:end), aavg(:,1:100:end), '-k', 'LineWidth', 2)
plot(time(1:100:end), asorted(3,1:100:end), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2);
plot(time(1:100:end), asorted(98,1:100:end), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
hold off


set(gca, 'FontSize', font_size)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 8000])
set(gca, 'YTick', [0 2000 4000 6000 8000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count')
%lhandle = legend([hline1 hline3 hline2], 'Mean', '95% Confidence', 'Outlier');
title('aH5N1 Influenza', 'FontSize', title_font_size)

astd = std(asorted);
[mstd, t] = max(astd);
t_days = time(t);

fprintf('Avian Max Std: %0.02f at day %0.02f, mean value %5d\n', mstd, t_days, aavg(t));

% Seasonal

subplot(1, 3, 2)

savg = mean(vars);
ssorted = sort(vars);    
    
plot(time(1:100:end), vars(:,1:100:end), 'color', [.75 .75 .75]);
hold on
plot(time(1:100:end), savg(:,1:100:end), '-k', 'LineWidth', 2)
plot(time(1:100:end), ssorted(3,1:100:end), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
plot(time(1:100:end), ssorted(98,1:100:end), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
hold off

set(gca, 'FontSize', font_size)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 8000])
set(gca, 'YTick', [2000 4000 6000 8000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
%ylabel('Infected Cell Count')
title('sH1N1 Influenza', 'FontSize', title_font_size)

sstd = std(ssorted);
[mstd, t] = max(sstd);
t_days = time(t);

fprintf('Seasonal Max Std: %0.02f at day %0.02f, mean value %5d\n', mstd, t_days, savg(t));

% Swine

subplot(1, 3, 3)

wavg = mean(varw);
wsorted = sort(varw);    
    
plot(time(1:100:end), varw(:,1:100:end), 'color', [.75 .75 .75]); 
hold on
plot(time(1:100:end), wavg(:,1:100:end), '-k', 'LineWidth', 2)
plot(time(1:100:end), wsorted(3,1:100:end), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
plot(time(1:100:end), wsorted(98,1:100:end), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
hold off

set(gca, 'FontSize', font_size)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 8000])
set(gca, 'YTick', [2000 4000 6000 8000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection');
%ylabel('Infected Cell Count')
title('pH1N1 Influenza', 'FontSize', title_font_size);

wstd = std(wsorted);
[mstd, t] = max(wstd);
t_days = time(t);

fprintf('Pandemic Max Std: %0.02f at day %0.02f, mean value %5d\n', mstd, t_days, wavg(t));

%print('-depsc2', '-loose', '/nfs/adaptive/drew/chemokine/paper/figures/Figure_4.eps');