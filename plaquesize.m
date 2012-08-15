% Plaque Size Plots

figure('Position',[100 500 1800 500])

colors = [.625  0  .2 ;
          1 .75  0 ;
          .28  .625 0 ;
          .1 .1 .9];

% Avian

subplot(1, 3, 1)
semilogy(time, infect(ar20)+ar20(:,5), 'color', colors(4,:), 'LineWidth', 2)
hold on
semilogy(time, ar20(:,3), 'color', colors(2,:), 'LineWidth', 2)
semilogy(time, ar20(:,4), 'color', colors(3,:), 'LineWidth', 2)
semilogy(time, ar20(:,7), 'color', colors(1,:), 'LineWidth', 2)
hold off

set(gca, 'FontSize', 20)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 6000])
set(gca, 'YTick', [1 10 100 1000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count (log10)')
title('aH5N1 Influenza')
lh = legend('Plaque size (cells)', 'Virus-incubating cells', 'Virus-secreting cells', 'T-cells at FOI', 2);
set(lh, 'FontSize', 16)
set(lh, 'FontWeight', 'normal')
% Seasonal

subplot(1, 3, 2)
semilogy(time, infect(sb20)+sb20(:,5), 'color', colors(4,:), 'LineWidth', 2)
hold on
semilogy(time, sb20(:,3), 'color', colors(2,:), 'LineWidth', 2)
semilogy(time, sb20(:,4), 'color', colors(3,:), 'LineWidth', 2)
semilogy(time, sb20(:,7), 'color', colors(1,:), 'LineWidth', 2)
hold off

set(gca, 'FontSize', 20)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 6000])
set(gca, 'YTick', [1 10 100 1000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
%ylabel('Infected Cell Count (log10)')
title('sH1N1 Influenza')
%set(gca, 'FontSize', 12)
% legend('Plaque size (cells)', 'Virus-incubating cells', 'Virus-secreting cells', 'T-cells at FOI', 2)

% Swine

subplot(1, 3, 3)
semilogy(time, infect(wb20)+wb20(:,5), 'color', colors(4,:), 'LineWidth', 2)
hold on
semilogy(time, wb20(:,3), 'color', colors(2,:), 'LineWidth', 2)
semilogy(time, wb20(:,4), 'color', colors(3,:), 'LineWidth', 2)
semilogy(time, wb20(:,7), 'color', colors(1,:), 'LineWidth', 2)
hold off

set(gca, 'FontSize', 20)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 6000])
set(gca, 'YTick', [1 10 100 1000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
%ylabel('Infected Cell Count (log10)')
title('pH1N1 Influenza')
%set(gca, 'FontSize', 12)
% legend('Plaque size (cells)', 'Virus-incubating cells', 'Virus-secreting cells', 'T-cells at FOI', 2)

% T-Cell Ratios

% subplot(2, 3, [4 6])
% 
% semilogy(time, ar20(:,7) ./ (infect(ar20) + ar20(:,5)), 'color', colors(1,:), 'LineWidth', 2)
% hold on
% semilogy(time, sb20(:,7) ./ (infect(sb20) + sb20(:,5)), 'color', colors(3,:), 'LineWidth', 2)
% semilogy(time, wb20(:,7) ./ (infect(wb20) + wb20(:,5)), 'color', colors(4,:), 'LineWidth', 2)
% hold off
% 
% set(gca, 'FontSize', 20)
% set(gca, 'FontWeight', 'bold')
% set(gca, 'YColor', 'k')
% set(gca, 'YLim', [.01 20])
% set(gca, 'YTick', [.01 .1 1 10])
% set(gca, 'XLim', [5 10])
% set(gca, 'XTick', 5:1:10)
% xlabel('Days Post-Infection')
% ylabel('T Cell to Plaque Size Ratio (log10)')
% title('log10 plot of T-cell to infection size ratio')
% legend('aH5N1', 'sH1N1', 'pH1N1', 2)
