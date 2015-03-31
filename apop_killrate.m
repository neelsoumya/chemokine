% Instant kill rate and apoptosis plot

figure('Position',[100 100 960 540])

colors = [.625  0  .2 ;
          1 .75  0 ;
          .28  .625 0 ;
          .1 .1 .9 ;
          .75 .25 .75];

plot(time, infect(a_apopandkill), 'color', colors(3,:), 'LineWidth', 2);
hold on
plot(time, infect(s_apopandkill), 'color', colors(4,:), 'LineWidth', 2);
plot(time, infect(w_apopandkill), 'color', colors(1,:), 'LineWidth', 2);
hold off

% set(gca, 'YLim', [ymin ymax])
set(gca, 'XLim', [0 10])
set(gca, 'FontSize', 20)
%set(gca, 'FontWeight', 'bold')

ylabel('Infected Cells')
xlabel('Time (days)')
lh = legend('aH5N1', 'sH1N1', 'pH1N1');
set(lh, 'FontSize', 14)

title('Instant Kill and Apoptosis', 'FontSize', 24);
