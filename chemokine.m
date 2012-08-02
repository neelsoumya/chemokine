% Chemokine Effects% Sensitivity Plot

figure('Position',[100 500 1800 700])

% Avian

subplot(1, 3, 1)

colors = [.75  0  0 ;
          .75  .5  0 ;
          0  .5 0 ;
          0 0 .75];
      
plot(time, infect(an20), 'color', colors(1,:), 'LineWidth', 2)
hold on
plot(time, infect(ar20), 'color', colors(2,:), 'LineWidth', 2)
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 1200])
set(gca, 'YTick', [0 200 400 600 800 1000 1200])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count')
title('aH5N1 Influenza')
legend('None', 'RANTES', 2)

% Seasonal

subplot(1, 3, 2)

plot(time, infect(sn20), 'color', colors(1,:), 'LineWidth', 2)
hold on
plot(time, infect(sr20), 'color', colors(2,:), 'LineWidth', 2)
plot(time, infect(si20), 'color', colors(3,:), 'LineWidth', 2)
plot(time, infect(sb20), 'color', colors(4,:), 'LineWidth', 2) 
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 1200])
set(gca, 'YTick', [0 200 400 600 800 1000 1200])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
%ylabel('Infected Cell Count')
title('sH1N1 Influenza')
legend('None', 'RANTES', 'IP-10', 'Both', 2)

% Swine

subplot(1, 3, 3)

plot(time, infect(wn20), 'color', colors(1,:), 'LineWidth', 2)
hold on
plot(time, infect(wr20), 'color', colors(2,:), 'LineWidth', 2)
plot(time, infect(wi20), 'color', colors(3,:), 'LineWidth', 2)
plot(time, infect(wb20), 'color', colors(4,:), 'LineWidth', 2) 
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 1200])
set(gca, 'YTick', [0 200 400 600 800 1000 1200])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
%ylabel('Infected Cell Count')
title('pH1N1 Influenza')
legend('None', 'RANTES', 'IP-10', 'Both', 2)