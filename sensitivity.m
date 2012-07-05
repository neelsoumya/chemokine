% Sensitivity Plot

figure('Position',[100 500 1800 700])

% Avian

subplot(1, 3, 1)

colors = winter(10);
colors = [.75  0  0 ;
          .8  .4  0 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .1  .1 .9 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ];

hline1 = plot(time, infect(ar17), 'color', colors(1,:), 'LineWidth', 2);
hold on
hline2 = plot(time, infect(ar18), 'color', colors(2,:), 'LineWidth', 2);
hline3 = plot(time, infect(ar19), 'color', colors(3,:), 'LineWidth', 2);
plot(time, infect(ar20), 'color', colors(4,:), 'LineWidth', 2) 
plot(time, infect(ar21), 'color', colors(5,:), 'LineWidth', 2) 
plot(time, infect(ar22), 'color', colors(6,:), 'LineWidth', 2) 
plot(time, infect(ar23), 'color', colors(7,:), 'LineWidth', 2)
plot(time, infect(ar25), 'color', colors(9,:), 'LineWidth', 2) 
plot(time, infect(ar26), 'color', colors(10,:), 'LineWidth', 2)
hline4 = plot(time, infect(ar24), 'color', colors(8,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 1200])
set(gca, 'YTick', [0 200 400 600 800 1000 1200])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Time (hours)')
ylabel('Infected Cell Count')
title('aH5N1 Influenza')
legend([hline1 hline2 hline4 hline3], '1e7 ng/mL', '1e6 ng/mL', '1 ng/mL', '1e5 to .01 ng/mL', 2)

% Seasonal

subplot(1, 3, 2)

hline1 = plot(time, infect(sb17), 'color', colors(1,:), 'LineWidth', 2);
hold on
hline2 = plot(time, infect(sb18), 'color', colors(2,:), 'LineWidth', 2);
hline3 = plot(time, infect(sb19), 'color', colors(3,:), 'LineWidth', 2);
plot(time, infect(sb20), 'color', colors(4,:), 'LineWidth', 2) 
plot(time, infect(sb21), 'color', colors(5,:), 'LineWidth', 2) 
plot(time, infect(sb22), 'color', colors(6,:), 'LineWidth', 2) 
plot(time, infect(sb23), 'color', colors(7,:), 'LineWidth', 2) 
plot(time, infect(sb25), 'color', colors(9,:), 'LineWidth', 2) 
plot(time, infect(sb26), 'color', colors(10,:), 'LineWidth', 2)
hline4 = plot(time, infect(sb24), 'color', colors(8,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 1200])
set(gca, 'YTick', [0 200 400 600 800 1000 1200])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Time (hours)')
%ylabel('Infected Cell Count')
title('sH1N1 Influenza')
legend([hline1 hline2 hline4 hline3], '1e7 ng/mL', '1e6 ng/mL', '1 ng/mL', '1e5 to .01 ng/mL', 2)

% Swine

subplot(1, 3, 3)

hline1 = plot(time, infect(wb17), 'color', colors(1,:), 'LineWidth', 2);
hold on
hline2 = plot(time, infect(wb18), 'color', colors(2,:), 'LineWidth', 2);
hline3 = plot(time, infect(wb19), 'color', colors(3,:), 'LineWidth', 2);
plot(time, infect(wb20), 'color', colors(4,:), 'LineWidth', 2) 
plot(time, infect(wb21), 'color', colors(5,:), 'LineWidth', 2) 
plot(time, infect(wb22), 'color', colors(6,:), 'LineWidth', 2) 
plot(time, infect(wb23), 'color', colors(7,:), 'LineWidth', 2) 
plot(time, infect(wb25), 'color', colors(9,:), 'LineWidth', 2) 
plot(time, infect(wb26), 'color', colors(10,:), 'LineWidth', 2)
hline4 = plot(time, infect(wb24), 'color', colors(8,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 16)
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 1200])
set(gca, 'YTick', [0 200 400 600 800 1000 1200])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Time (hours)')
%ylabel('Infected Cell Count')
title('pH1N1 Influenza')
legend([hline1 hline2 hline4 hline3], '1e7 ng/mL', '1e6 ng/mL', '1 ng/mL', '1e5 to .01 ng/mL', 2)
