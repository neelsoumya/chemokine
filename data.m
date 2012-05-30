% Creates Data Plot

% --- Avian Data ---
avt = [480, 600, 960, 1200, 1440, 1680, 1920,  2280, 2520]/60;
av  = [ 63, 125, 825, 2563,  988, 1650, 2838, 17375, 5775];

ait = [120, 480, 600, 960, 1200, 1440, 1680,  1920,  2280,  2880]/60;
ai  = [ 24,  87, 296, 770, 3048, 3901, 8261, 12935, 26970, 24120];

art = [120, 480, 600, 960, 1200, 1440, 1680, 1920, 2280, 2880]/60;
ar  = [ 45,  50,  57,  87,  134,  151,  150,  245,  780,  695];

% --- Seasonal Data ---
svt = [600,  720,  960,  1200,  1440,  1800,  2280,  2880]/60;
sv  = [ 20, 5846, 6900, 38500, 39738, 20238, 15138, 20453];

sit = [120,  480,  720,  960, 1200, 1440]/60;
si  = [391, 1723, 3462, 4618, 6807, 8164] - 300;

srt = [120, 480, 720, 960, 1200, 1440, 1800, 2280, 2880]/60;
sr  = [  1,   1,   1,   2,    6,   16,   68,  239,  655];

% --- Swine Data ---
wvt = [120,   720,   960,   1200,   1440,   1800,   2880]/60;
wv  = [ 20, 64620, 84053, 254587, 665559, 814586, 654773];

wit = [480,  720,  960,  1200,  1440,  1920,  2880]/60;
wi  = [ 75+1, 1835, 1349, 23458, 12073, 30700, 19814] - 75;

wrt = [480, 720,  960, 1200, 1440, 1920, 2880]/60;
wr  = [ 36,  55,   46,  150,   93,  380, 1224];

% --- Plot ---

% Avian
subplot(1, 3, 1)
[haxes, hline1, hline2] = plotyy(avt, av, art, ar, 'semilogy', 'semilogy');
hold on
hline3 = plot(ait, ai);
hold off

set(hline1, 'Marker', 'o')
set(hline1, 'Color', 'b')

set(hline2, 'Marker', 's')
set(hline2, 'Color', [0 .5 0])

set(hline3, 'Marker', '^')
set(hline3, 'Color', 'r')

axes(haxes(1))
set(haxes(1), 'FontSize', 16)
set(haxes(1), 'YColor', 'k')
set(haxes(1), 'YLim', [1 1e6])
set(haxes(1), 'YTick', [1 10 100 1000 10000 100000 1000000])
set(haxes(1), 'XLim', [0 48])
set(haxes(1), 'XTick', 0:4:48)
set(haxes(1), 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})
xlabel('Time (hours)')
ylabel('Virus (PFU/ml)')

axes(haxes(2))
set(haxes(2), 'FontSize', 16)
set(haxes(2), 'YColor', 'k')
set(haxes(2), 'YLim', [1 1e6])
set(haxes(2), 'YTick', [1 10 100 1000 10000 100000 1000000])
set(haxes(2), 'XLim', [0 48])
set(haxes(2), 'XTick', 0:4:48)
set(haxes(2), 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})
ylabel('Chemokine (ng/ml)')

lhandle = legend('Virus', 'IP-10', 'RANTES', 4);
set(lhandle, 'Color', 'w')

title('Avian H5N1 Influenza')

% Seasonal
subplot(1, 3, 2)
[haxes, hline1, hline2] = plotyy(svt, sv, srt, sr, 'semilogy', 'semilogy');
hold on
hline3 = plot(sit, si);
hold off

set(hline1, 'Marker', 'o')
set(hline1, 'Color', 'b')

set(hline2, 'Marker', 's')
set(hline2, 'Color', [0 .5 0])

set(hline3, 'Marker', '^')
set(hline3, 'Color', 'r')



axes(haxes(1))
set(haxes(1), 'FontSize', 16)
set(haxes(1), 'YColor', 'k')
set(haxes(1), 'YLim', [1 1e6])
set(haxes(1), 'YTick', [1 10 100 1000 10000 100000 1000000])
set(haxes(1), 'XLim', [0 48])
set(haxes(1), 'XTick', 0:4:48)
set(haxes(1), 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})
xlabel('Time (hours)')
ylabel('Virus (PFU/ml)')

axes(haxes(2))
set(haxes(2), 'FontSize', 16)
set(haxes(2), 'YColor', 'k')
set(haxes(2), 'YLim', [1 1e6])
set(haxes(2), 'YTick', [1 10 100 1000 10000 100000 1000000])
set(haxes(2), 'XLim', [0 48])
set(haxes(2), 'XTick', 0:4:48)
set(haxes(2), 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})
ylabel('Chemokine (ng/ml)')

lhandle = legend('Virus', 'IP-10', 'RANTES', 4);
set(lhandle, 'Color', 'w')

title('Seasonal sH1N1 Influenza')

% Swine
subplot(1, 3, 3)

[haxes, hline1, hline2] = plotyy(wvt, wv, wrt, wr, 'semilogy', 'semilogy');
hold on
hline3 = plot(wit, wi);
hold off

set(hline1, 'Marker', 'o')
set(hline1, 'Color', 'b')

set(hline2, 'Marker', 's')
set(hline2, 'Color', [0 .5 0])

set(hline3, 'Marker', '^')
set(hline3, 'Color', 'r')



axes(haxes(1))
set(haxes(1), 'FontSize', 16)
set(haxes(1), 'YColor', 'k')
set(haxes(1), 'YLim', [1 1e6])
set(haxes(1), 'YTick', [1 10 100 1000 10000 100000 1000000])
set(haxes(1), 'XLim', [0 48])
set(haxes(1), 'XTick', 0:4:48)
set(haxes(1), 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})
xlabel('Time (hours)')
ylabel('Virus (PFU/ml)')

axes(haxes(2))
set(haxes(2), 'FontSize', 16)
set(haxes(2), 'YColor', 'k')
set(haxes(2), 'YLim', [1 1e6])
set(haxes(2), 'YTick', [1 10 100 1000 10000 100000 1000000])
set(haxes(2), 'XLim', [0 48])
set(haxes(2), 'XTick', 0:4:48)
set(haxes(2), 'XTickLabel', {'0', '', '8', '', '16', '', '24', '', '32', '', '40', '', '48'})
ylabel('Chemokine (ng/ml)')

lhandle = legend('Virus', 'IP-10', 'RANTES', 4);
set(lhandle, 'Color', 'w')

title('Pandemic pH1N1 Influenza')