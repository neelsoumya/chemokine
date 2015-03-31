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

avar = [infect(vara00) infect(vara01) infect(vara02) infect(vara03) infect(vara04) ...
        infect(vara05) infect(vara06) infect(vara07) infect(vara08) infect(vara09) ...
        infect(vara10) infect(vara11) infect(vara12) infect(vara13) infect(vara14) ...
        infect(vara15) infect(vara16) infect(vara17) infect(vara18) infect(vara19) ...
        infect(vara20) infect(vara21) infect(vara22) infect(vara23) infect(vara24) ...
        infect(vara25) infect(vara26) infect(vara27) infect(vara28) infect(vara29) ...
        infect(vara30) infect(vara31) infect(vara32) infect(vara33) infect(vara34) ...
        infect(vara35) infect(vara36) infect(vara37) infect(vara38) infect(vara39) ...        
        infect(vara40) infect(vara41) infect(vara42) infect(vara43) infect(vara44) ...
        infect(vara45) infect(vara46) infect(vara47) infect(vara48) infect(vara49)];

aavg = mean(avar, 2);
asorted = sort(avar, 2);

plot(time, avar, 'color', [.75 .75 .75]);
hold on
plot(time, aavg, '-k', 'LineWidth', 2)
plot(time, asorted(:,2), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2);
plot(time, asorted(:,49), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
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

astd = std(asorted,0,2);
[mstd, t] = max(astd);
t_days = time(t);

fprintf('Avian Max Std: %0.02f at day %0.02f, mean value %5d\n', mstd, t_days, aavg(t));

% Seasonal

subplot(1, 3, 2)

svar = [infect(vars00) infect(vars01) infect(vars02) infect(vars03) infect(vars04) ...
        infect(vars05) infect(vars06) infect(vars07) infect(vars08) infect(vars09) ...
        infect(vars10) infect(vars11) infect(vars12) infect(vars13) infect(vars14) ...
        infect(vars15) infect(vars16) infect(vars17) infect(vars18) infect(vars19) ...
        infect(vars20) infect(vars21) infect(vars22) infect(vars23) infect(vars24) ...
        infect(vars25) infect(vars26) infect(vars27) infect(vars28) infect(vars29) ...
        infect(vars30) infect(vars31) infect(vars32) infect(vars33) infect(vars34) ...
        infect(vars35) infect(vars36) infect(vars37) infect(vars38) infect(vars39) ...        
        infect(vars40) infect(vars41) infect(vars42) infect(vars43) infect(vars44) ...
        infect(vars45) infect(vars46) infect(vars47) infect(vars48) infect(vars49)];

savg = mean(svar, 2);
ssorted = sort(svar, 2);    
    
plot(time, svar, 'color', [.75 .75 .75]);
hold on
plot(time, savg, '-k', 'LineWidth', 2)
plot(time, ssorted(:,2), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
plot(time, ssorted(:,49), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
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

sstd = std(ssorted,0,2);
[mstd, t] = max(sstd);
t_days = time(t);

fprintf('Seasonal Max Std: %0.02f at day %0.02f, mean value %5d\n', mstd, t_days, savg(t));

% Swine

subplot(1, 3, 3)

wvar = [infect(varw00) infect(varw01) infect(varw02) infect(varw03) infect(varw04) ...
        infect(varw05) infect(varw06) infect(varw07) infect(varw08) infect(varw09) ...
        infect(varw10) infect(varw11) infect(varw12) infect(varw13) infect(varw14) ...
        infect(varw15) infect(varw16) infect(varw17) infect(varw18) infect(varw19) ...
        infect(varw20) infect(varw21) infect(varw22) infect(varw23) infect(varw24) ...
        infect(varw25) infect(varw26) infect(varw27) infect(varw28) infect(varw29) ...
        infect(varw30) infect(varw31) infect(varw32) infect(varw33) infect(varw34) ...
        infect(varw35) infect(varw36) infect(varw37) infect(varw38) infect(varw39) ...        
        infect(varw40) infect(varw41) infect(varw42) infect(varw43) infect(varw44) ...
        infect(varw45) infect(varw46) infect(varw47) infect(varw48) infect(varw49)];

wavg = mean(wvar, 2);
wsorted = sort(wvar, 2);    
    
plot(time, wvar, 'color', [.75 .75 .75]); 
hold on
plot(time, wavg, '-k', 'LineWidth', 2)
plot(time, wsorted(:,2), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
plot(time, wsorted(:,49), 'Color', [.75 0 0], 'LineStyle', '--', 'LineWidth', 2)
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

wstd = std(wsorted,0,2);
[mstd, t] = max(wstd);
t_days = time(t);

fprintf('Pandemic Max Std: %0.02f at day %0.02f, mean value %5d\n', mstd, t_days, wavg(t));

print('-depsc2', '-loose', '/nfs/adaptive/drew/chemokine/paper/figures/Figure_4.eps');