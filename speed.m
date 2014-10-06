% Sensitivity Plot

figure('Position',[100 500 1800 600])

% Avian

subplot(1, 3, 1)

%colors = winter(10);
colors = [.2  .2   .8  ;
          .35 .35   .725 ;
          .50   .50  .65 ;
          .65 .50   .50 ;
          .725  .35  .35 ;
          .8  .2   .2 ;
          .1 .1 .1];

plot(time, infect(speeda100), 'color', colors(1,:), 'LineWidth', 2);
hold on
plot(time, infect(speeda30), 'color', colors(2,:), 'LineWidth', 2);      
plot(time, infect(speeda10), 'color', colors(3,:), 'LineWidth', 2);
plot(time, infect(speeda3), 'color', colors(4,:), 'LineWidth', 2); 
plot(time, infect(speeda1), 'color', colors(5,:), 'LineWidth', 2); 
plot(time, infect(speeda03), 'color', colors(6,:), 'LineWidth', 2);
plot(time, infect(speeda03_1), 'color', colors(7,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 18)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 600])
set(gca, 'YTick', [0 100 200 300 400 500 600])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count')
title('aH5N1 Influenza')
lh = legend('10 \mum/s', '3 \mum/s', '1 \mum/s', '0.3 \mum/s', '0.1 \mum/s',  '0.03 \mum/s', '0.03 \mum/s', 2);
set(lh, 'FontSize', 14)

% Seasonal

subplot(1, 3, 2)

plot(time, infect(speeds100), 'color', colors(1,:), 'LineWidth', 2);
hold on
plot(time, infect(speeds30), 'color', colors(2,:), 'LineWidth', 2);      
plot(time, infect(speeds10), 'color', colors(3,:), 'LineWidth', 2);
plot(time, infect(speeds3), 'color', colors(4,:), 'LineWidth', 2); 
plot(time, infect(speeds1), 'color', colors(5,:), 'LineWidth', 2); 
plot(time, infect(speeds03), 'color', colors(6,:), 'LineWidth', 2);
plot(time, infect(speeds03_1), 'color', colors(7,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 18)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 600])
set(gca, 'YTick', [0 100 200 300 400 500 600])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count')
title('sH1N1 Influenza')
lh = legend('10 \mum/s', '3 \mum/s', '1 \mum/s', '0.3 \mum/s', '0.1 \mum/s',  '0.03 \mum/s', '0.03 \mum/s', 2);
set(lh, 'FontSize', 14)


% Swine

subplot(1, 3, 3)

plot(time, infect(speedw100), 'color', colors(1,:), 'LineWidth', 2);
hold on
plot(time, infect(speedw30), 'color', colors(2,:), 'LineWidth', 2);      
plot(time, infect(speedw10), 'color', colors(3,:), 'LineWidth', 2);
plot(time, infect(speedw3), 'color', colors(4,:), 'LineWidth', 2); 
plot(time, infect(speedw1), 'color', colors(5,:), 'LineWidth', 2); 
plot(time, infect(speedw03), 'color', colors(6,:), 'LineWidth', 2);
plot(time, infect(speedw03_1), 'color', colors(7,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 18)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 600])
set(gca, 'YTick', [0 100 200 300 400 500 600])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count')
title('pH1N1 Influenza')
lh = legend('10 \mum/s', '3 \mum/s', '1 \mum/s', '0.3 \mum/s', '0.1 \mum/s',  '0.03 \mum/s', '0.03 \mum/s', 4);
set(lh, 'FontSize', 14)

