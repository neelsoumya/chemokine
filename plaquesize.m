% Plaque Size Plots

figure('Position',[100 500 1800 1400])

colors = [.75  0  0 ;
          .75  .5  0 ;
          0  .75 0 ;
          0 0 .75];

% Avian

subplot(2, 3, 1)
semilogy(time, infect(ar26)+ar26(:,5), 'color', colors(1,:), 'LineWidth', 2)
hold on
semilogy(time, ar26(:,3), 'color', colors(2,:), 'LineWidth', 2)
semilogy(time, ar26(:,4), 'color', colors(3,:), 'LineWidth', 2)
semilogy(time, ar26(:,7), 'color', colors(4,:), 'LineWidth', 2)
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 6000])
set(gca, 'YTick', [1 10 100 1000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count (log10)')
title('aH5N1')
%set(gca, 'FontSize', 12)
legend('Plaque size (cells)', 'Virus-incubating cells', 'Virus-secreting cells', 'T-cells at FOI', 2)

% Seasonal

subplot(2, 3, 2)
semilogy(time, infect(sb26)+sb26(:,5), 'color', colors(1,:), 'LineWidth', 2)
hold on
semilogy(time, sb26(:,3), 'color', colors(3,:), 'LineWidth', 2)
semilogy(time, sb26(:,4), 'color', colors(2,:), 'LineWidth', 2)
semilogy(time, sb26(:,7), 'color', colors(4,:), 'LineWidth', 2)
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 6000])
set(gca, 'YTick', [1 10 100 1000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count (log10)')
title('sH1N1')
set(gca, 'FontSize', 12)
% legend('Plaque size (cells)', 'Virus-incubating cells', 'Virus-secreting cells', 'T-cells at FOI', 2)

% Swine

subplot(2, 3, 3)
semilogy(time, infect(wb26)+wb26(:,5), 'color', colors(1,:), 'LineWidth', 2)
hold on
semilogy(time, wb26(:,3), 'color', colors(3,:), 'LineWidth', 2)
semilogy(time, wb26(:,4), 'color', colors(2,:), 'LineWidth', 2)
semilogy(time, wb26(:,7), 'color', colors(4,:), 'LineWidth', 2)
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [0 6000])
set(gca, 'YTick', [1 10 100 1000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count (log10)')
title('pH1N1')
set(gca, 'FontSize', 12)
% legend('Plaque size (cells)', 'Virus-incubating cells', 'Virus-secreting cells', 'T-cells at FOI', 2)

% T-Cell Ratios

subplot(2, 3, [4 6])

semilogy(time, ar26(:,7) ./ (infect(ar26) + ar26(:,5)), 'color', colors(1,:), 'LineWidth', 2)
hold on
semilogy(time, sb26(:,7) ./ (infect(sb26) + sb26(:,5)), 'color', colors(3,:), 'LineWidth', 2)
semilogy(time, wb26(:,7) ./ (infect(wb26) + wb26(:,5)), 'color', colors(4,:), 'LineWidth', 2)
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [.01 20])
set(gca, 'YTick', [.01 .1 1 10])
set(gca, 'XLim', [5 10])
set(gca, 'XTick', 5:1:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count (log10)')
title('log10 plot of T-cell to infection size ratio')
legend('aH5N1', 'sH1N1', 'pH1N1', 2)
