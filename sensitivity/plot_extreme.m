width = 8;
height = 6;

fig = figure();

set(fig, 'PaperUnits', 'inches');
set(fig, 'PaperSize', [width height]);
set(fig, 'Units', 'inches');
set(fig, 'Position', [0 0 width height]);
set(fig, 'PaperPosition', [0 0 width height]);

font_size = 14;
title_font_size = 16;
legend_font_size = 11;

temp = importdata('/nfs/adaptive/drew/chemokine/sensitivity/hist/seasonal_1_023.hist');
extreme_1 = infect(temp.data);
temp = importdata('/nfs/adaptive/drew/chemokine/sensitivity/hist/seasonal_2_023.hist');
extreme_2 = infect(temp.data);
temp = importdata('/nfs/adaptive/drew/chemokine/sensitivity/hist/seasonal_3_023.hist');
extreme_3 = infect(temp.data);

plot(time, [extreme_1, extreme_2, extreme_3, infect(vars00)]);
lh = legend('Sample 1', 'Sample 2', 'Sample 3', 'Baseline');
title('Exhaustive Growth Example', 'FontSize', title_font_size);
xlabel('Time (days)')
ylabel('Infected Cells')

set(gca, 'FontSize', font_size)
set(gca, 'FontWeight', 'normal')
set(lh, 'FontSize', legend_font_size)
