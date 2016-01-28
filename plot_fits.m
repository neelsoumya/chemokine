% Creates Data Plot

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

% --- Avian Data ---
avt = [480, 600, 960, 1200, 1440, 1680, 1920,  2280, 2520]/60;
av  = [ 100, 150, 825, 2563, 988, 1650, 2838, 17375, 5775];
ave = [   0,  29, 229,  348, 166,  390,  112,  3062, 1261];

ait = [120, 480, 600, 960, 1200, 1440, 1680,  1920,  2280,  2880]/60;
ai  = [ 24,  87, 296, 770, 3048, 3901, 8261, 12935, 26970, 24120];

art = [120, 480, 600, 960, 1200, 1440, 1680, 1920, 2280, 2880]/60;
ar  = [ 45,  50,  57,  87,  134,  151,  150,  245,  780,  695];

% --- Seasonal Data ---
svt = [600,  720,  960,  1200,  1440,  1800,  2280,  2880]/60;
sv  = [ 20, 5846, 6900, 38500, 39738, 20238, 15138, 20453];
sve = [  0, 1676, 1578, 15695, 17271,  2992,  2886,  3837];

sit = [120,  480,  720,  960, 1200, 1440]/60;
si  = [391, 1723, 3462, 4618, 6807, 8164] - 300;

siit  = [1440, 1800, 2280, 2880]/60;
%sii   = [8164, 10200, 12913, 16306] - 300;
sii   = [8164, 8500, 8500, 8500] - 300;

srt = [120, 480, 720, 960, 1200, 1440, 1800, 2280, 2880]/60;
sr  = [  1,   1,   1,   2,    6,   16,   68,  239,  655];

% --- Swine Data ---24
wvt = [120,   720,   960,   1200,   1440,   1800,   2880]/60;
wv  = [ 20, 64620, 84053, 254587, 665559, 814586, 654773];
wve = [  0, 18294, 36080,  43752, 156340, 229980,  47662];

wit = [480,  720,  960,  1200,  1440,  1920,  2880]/60;
wi  = [ 75+1, 1835, 1349, 23458, 12073, 30700, 19814] - 75;

wrt = [480, 720,  960, 1200, 1440, 1920, 2880]/60;
wr  = [ 36,  55,   46,  150,   93,  380, 1224];

colors = [.75   0   .2 ;
          1    .75   0 ;
          .28  .625  0 ;
          .1   .1   .9 ;
          .5    0   .1 ;
          .75  .625  0 ;
          .2   .375  0 ;
          .075 .075 .7 ];

% --- Plot ---

% Avian
subplot(1, 3, 1)
hline2 = semilogy(art, ar);
hold on
hline3 = plot(ait, ai);
hline4 = plot(aft/60, aif);
hline5 = plot(aft/60, arf);
hold off

set(hline2, 'LineWidth', 2)
set(hline2, 'LineStyle', 'none')
set(hline2, 'Marker', 's')
set(hline2, 'MarkerSize', 10)
set(hline2, 'Color', colors(2,:))
set(hline2, 'MarkerEdgeColor', colors(6,:))
set(hline2, 'MarkerFaceColor', colors(2,:))

set(hline3, 'LineWidth', 2)
set(hline3, 'LineStyle', 'none')
set(hline3, 'Marker', '^')
set(hline3, 'MarkerSize', 10)
set(hline3, 'Color', colors(1,:))
set(hline3, 'MarkerEdgeColor', colors(5,:))
set(hline3, 'MarkerFaceColor', colors(1,:))

set(hline4, 'LineWidth', 2)
set(hline4, 'LineStyle', '--')
set(hline4, 'Color', colors(1,:))

set(hline5, 'LineWidth', 2)
set(hline5, 'LineStyle', '--')
set(hline5, 'Color', colors(2,:))

set(gca, 'FontSize', font_size)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 2e6])
set(gca, 'YTick', [1 10 100 1000 10000 100000 1000000])
set(gca, 'XLim', [0 48])
set(gca, 'XTick', 0:4:48)
set(gca, 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})

xlabel('Time (hours)')
ylabel('Chemokine (pg/mL)')

lhandle = legend([hline3 hline2], 'IP-10', 'RANTES', 4);
set(lhandle, 'Color', 'w')
set(lhandle, 'FontSize', legend_font_size);

title('aH5N1 Influenza', 'FontSize', title_font_size)

% Seasonal
subplot(1, 3, 2)
%[haxes, hline2, hline1] = plotyy(srt, sr, svt, sv, 'semilogy', 'semilogy');
hline2 = semilogy(srt, sr);
hold on
hline4 = plot(siit, sii);
hline3 = plot(sit, si);
hline5 = plot(sft/60, sif);
hline6 = plot(sft/60, srf);
hold off

set(hline2, 'LineWidth', 2)
set(hline2, 'LineStyle', 'none')
set(hline2, 'Marker', 's')
set(hline2, 'MarkerSize', 10)
set(hline2, 'Color', colors(2,:))
set(hline2, 'MarkerEdgeColor', colors(6,:))
set(hline2, 'MarkerFaceColor', colors(2,:))


set(hline3, 'LineWidth', 2)
set(hline3, 'LineStyle', 'none')
set(hline3, 'Marker', '^')
set(hline3, 'MarkerSize', 10)
set(hline3, 'Color', 'r')
set(hline3, 'MarkerEdgeColor', [.5 0 0])
set(hline3, 'MarkerFaceColor', 'r')

set(hline4, 'LineWidth', 2)
set(hline4, 'LineStyle', 'none')
set(hline4, 'Marker', '^')
set(hline4, 'MarkerSize', 10)
set(hline4, 'Color', colors(1,:))

set(hline5, 'LineWidth', 2)
set(hline5, 'LineStyle', '--')
set(hline5, 'Color', colors(1,:))

set(hline6, 'LineWidth', 2)
set(hline6, 'LineStyle', '--')
set(hline6, 'Color', colors(2,:))

set(gca, 'FontSize', font_size)
%set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 2e6])
set(gca, 'YTick', [1 10 100 1000 10000 100000 1000000])
set(gca, 'XLim', [0 48])
set(gca, 'XTick', 0:4:48)
set(gca, 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})

%ylabel('Chemokine (pg/mL)')
xlabel('Time (hours)')

%lhandle = legend([hline3 hline2], 'IP-10', 'RANTES', 4);
%set(lhandle, 'Color', 'w')

title('sH1N1 Influenza', 'FontSize', title_font_size)

% Swine
subplot(1, 3, 3)

hline2 = semilogy(wrt, wr);
hold on
hline3 = plot(wit, wi);
hline4 = plot(wft/60, wif);
hline5 = plot(wft/60, wrf);
hold off

set(hline2, 'LineWidth', 2)
set(hline2, 'LineStyle', 'none')
set(hline2, 'Marker', 's')
set(hline2, 'MarkerSize', 10)
set(hline2, 'Color', colors(2,:))
set(hline2, 'MarkerEdgeColor', colors(6,:))
set(hline2, 'MarkerFaceColor', colors(2,:))

set(hline3, 'LineWidth', 2)
set(hline3, 'LineStyle', 'none')
set(hline3, 'Marker', '^')
set(hline3, 'MarkerSize', 10)
set(hline3, 'Color', colors(1,:))
set(hline3, 'MarkerEdgeColor', colors(5,:))
set(hline3, 'MarkerFaceColor', colors(1,:))

set(hline4, 'LineWidth', 2)
set(hline4, 'LineStyle', '--')
set(hline4, 'Color', colors(1,:))

set(hline5, 'LineWidth', 2)
set(hline5, 'LineStyle', '--')
set(hline5, 'Color', colors(2,:))

set(gca, 'FontSize', font_size)
%set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 2e6])
set(gca, 'YTick', [1 10 100 1000 10000 100000 1000000])
set(gca, 'XLim', [0 48])
set(gca, 'XTick', 0:4:48)
set(gca, 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})

%ylabel('Chemokine (pg/mL)')
xlabel('Time (hours)')


%lhandle = legend([hline3 hline2], 'IP-10', 'RANTES', 4);
%set(lhandle, 'Color', 'w')

title('pH1N1 Influenza', 'FontSize', title_font_size)

%print('-depsc2', '-loose', '/nfs/adaptive/drew/chemokine/paper/figures/Figure_3.eps');

% -------------------------------- Log RMSE Values ----------------------=
disp('RMSE Values')
disp(['Avian RANTES:    ' num2str(rmse(art, ar, aft/60, arf))])
disp(['Avian IP-10:     ' num2str(rmse(ait, ai, aft/60, aif))])
disp(['Seasonal RANTES: ' num2str(rmse(srt, sr, sft/60, srf))])
disp(['Seasonal IP-10:  ' num2str(rmse(sit, si, sft/60, sif))])
disp(['Pandemic RANTES: ' num2str(rmse(wrt, wr, wft/60, wrf))])
disp(['Pandemic IP-10:  ' num2str(rmse(wit, wi, wft/60, wif))])
