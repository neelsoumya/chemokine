cd('/nfs/adaptive/drew/chemokine');

% Sensitivity Plot

figure('Position',[100 500 1800 600])

% Avian

subplot(1, 3, 1)

%colors = winter(10);
colors = [.625  0  .2 ;
          1  .75  0 ;
          .1  .1  .9 ;
%          .28 .625  0 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ;
          .5  .5 .5 ];

hline4 = plot(time, infect(ar20), 'color', colors(4,:), 'LineWidth', 2);
hold on
plot(time, infect(ar21), 'color', colors(5,:), 'LineWidth', 2); 
plot(time, infect(ar22), 'color', colors(6,:), 'LineWidth', 2); 
plot(time, infect(ar23), 'color', colors(7,:), 'LineWidth', 2);
plot(time, infect(ar24), 'color', colors(8,:), 'LineWidth', 2);
plot(time, infect(ar25), 'color', colors(9,:), 'LineWidth', 2); 
plot(time, infect(ar26), 'color', colors(10,:), 'LineWidth', 2);
hline2 = plot(time, infect(ar18), 'color', colors(2,:), 'LineWidth', 2);      
hline1 = plot(time, infect(ar17), 'color', colors(1,:), 'LineWidth', 2);
hline3 = plot(time, infect(ar19), 'color', colors(3,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 18)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 8000])
set(gca, 'YTick', [0 2000 4000 6000 8000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
ylabel('Infected Cell Count')
title('aH5N1 Influenza')
lh = legend([hline1 hline2 hline3 hline4], '10 \mug/mL', '1 \mug/mL', '100 ng/mL', '10 ng/mL to .01 pg/mL', 2);
set(lh, 'FontSize', 14)

% Seasonal

subplot(1, 3, 2)

hline4 = plot(time, infect(sb20), 'color', colors(4,:), 'LineWidth', 2); 
hold on
plot(time, infect(sb21), 'color', colors(5,:), 'LineWidth', 2); 
plot(time, infect(sb22), 'color', colors(6,:), 'LineWidth', 2); 
plot(time, infect(sb23), 'color', colors(7,:), 'LineWidth', 2); 
plot(time, infect(sb24), 'color', colors(8,:), 'LineWidth', 2);
plot(time, infect(sb25), 'color', colors(9,:), 'LineWidth', 2); 
plot(time, infect(sb26), 'color', colors(10,:), 'LineWidth', 2);
hline2 = plot(time, infect(sb18), 'color', colors(2,:), 'LineWidth', 2);
hline1 = plot(time, infect(sb17), 'color', colors(1,:), 'LineWidth', 2);
hline3 = plot(time, infect(sb19), 'color', colors(3,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 18)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 8000])
set(gca, 'YTick', [0 2000 4000 6000 8000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
%ylabel('Infected Cell Count')
title('sH1N1 Influenza')
lh = legend([hline1 hline2 hline3 hline4], '10 \mug/mL', '1 \mug/mL', '100 ng/mL', '10 ng/mL to .01 pg/mL', 2);
set(lh, 'FontSize', 14)

% Swine

subplot(1, 3, 3)

hline4 = plot(time, infect(wb20), 'color', colors(4,:), 'LineWidth', 2);
hold on
plot(time, infect(wb21), 'color', colors(5,:), 'LineWidth', 2); 
plot(time, infect(wb22), 'color', colors(6,:), 'LineWidth', 2); 
plot(time, infect(wb23), 'color', colors(7,:), 'LineWidth', 2); 
plot(time, infect(wb24), 'color', colors(8,:), 'LineWidth', 2);
plot(time, infect(wb25), 'color', colors(9,:), 'LineWidth', 2); 
plot(time, infect(wb26), 'color', colors(10,:), 'LineWidth', 2);
hline2 = plot(time, infect(wb18), 'color', colors(2,:), 'LineWidth', 2);
hline1 = plot(time, infect(wb17), 'color', colors(1,:), 'LineWidth', 2);
hline3 = plot(time, infect(wb19), 'color', colors(3,:), 'LineWidth', 2);
hold off

set(gca, 'FontSize', 18)
set(gca, 'FontWeight', 'bold')
set(gca, 'YColor', 'k')
set(gca, 'YLim', [1 8000])
set(gca, 'YTick', [0 2000 4000 6000 8000])
set(gca, 'XLim', [0 10])
set(gca, 'XTick', 0:2:10)
xlabel('Days Post-Infection')
%ylabel('Infected Cell Count')
title('pH1N1 Influenza')
lh = legend([hline1 hline2 hline3 hline4], '10 \mug/mL', '1 \mug/mL', '100 ng/mL', '10 ng/mL to .01 pg/mL', 4);
set(lh, 'FontSize', 14)

% Avian Histogram

% subplot(2, 3, 4);
% 
% a17 = ar17(end,3) + ar17(end,4) + ar17(end,6);
% a18 = ar18(end,3) + ar18(end,4) + ar18(end,6);
% a19 = ar19(end,3) + ar19(end,4) + ar19(end,6);
% a20 = ar20(end,3) + ar20(end,4) + ar20(end,6);
% a21 = ar21(end,3) + ar21(end,4) + ar21(end,6);
% a22 = ar22(end,3) + ar22(end,4) + ar22(end,6);
% a23 = ar23(end,3) + ar23(end,4) + ar23(end,6);
% a24 = ar24(end,3) + ar24(end,4) + ar24(end,6);
% a25 = ar25(end,3) + ar25(end,4) + ar25(end,6);
% a26 = ar26(end,3) + ar26(end,4) + ar26(end,6);
% 
% hbar1 = bar(17, a17);
% hold on
% hbar2 = bar(18, a18);
% hbar3 = bar(19, a19);
% hbar4 = bar(20, a20);
% hbar5 = bar(21:26, [a21 a22 a23 a24 a25 a26]);
% hold off
% set(hbar1, 'FaceColor', colors(1,:))
% set(hbar2, 'FaceColor', colors(2,:))
% set(hbar3, 'FaceColor', colors(3,:))
% set(hbar4, 'FaceColor', colors(4,:))
% set(hbar5, 'FaceColor', colors(5,:))
% 
% set(gca, 'FontSize', 18)
% set(gca, 'FontWeight', 'bold')
% set(gca, 'YColor', 'k')
% set(gca, 'YLim', [1 12000])
% set(gca, 'YTick', [0 2000 4000 6000 8000 10000 12000])
% set(gca, 'XLim', [16 27])
% set(gca, 'XTick', 17:26)
% set(gca, 'XTickLabel', {'1e4' '' '' '10' '' '' '.01' '' '' '1e-5'})
% xlabel('Sensitivity Threshold (ng/mL)')
% ylabel('Infected Cell Count at Day 10')
% %title('aH1N1 Influenza')
% lh = legend([hbar1 hbar2 hbar3 hbar4 hbar5], '10 \mug/mL', '1 \mug/mL', '100 ng/mL', '10 ng/mL', '1 ng/mL to .01 pg/mL');
% set(lh, 'FontSize', 14)
% 
% % Seasonal Histogram
% 
% subplot(2, 3, 5);
% 
% s17 = sb17(end,3) + sb17(end,4) + sb17(end,6);
% s18 = sb18(end,3) + sb18(end,4) + sb18(end,6);
% s19 = sb19(end,3) + sb19(end,4) + sb19(end,6);
% s20 = sb20(end,3) + sb20(end,4) + sb20(end,6);
% s21 = sb21(end,3) + sb21(end,4) + sb21(end,6);
% s22 = sb22(end,3) + sb22(end,4) + sb22(end,6);
% s23 = sb23(end,3) + sb23(end,4) + sb23(end,6);
% s24 = sb24(end,3) + sb24(end,4) + sb24(end,6);
% s25 = sb25(end,3) + sb25(end,4) + sb25(end,6);
% s26 = sb26(end,3) + sb26(end,4) + sb26(end,6);
% 
% hbar1 = bar(17, s17);
% hold on
% hbar2 = bar(18, s18);
% hbar3 = bar(19, s19);
% hbar4 = bar(20, s20);
% hbar5 = bar(21:26, [s21 s22 s23 s24 s25 s26]);
% hold off
% set(hbar1, 'FaceColor', colors(1,:))
% set(hbar2, 'FaceColor', colors(2,:))
% set(hbar3, 'FaceColor', colors(3,:))
% set(hbar4, 'FaceColor', colors(4,:))
% set(hbar5, 'FaceColor', colors(5,:))
% 
% set(gca, 'FontSize', 18)
% set(gca, 'FontWeight', 'bold')
% set(gca, 'YColor', 'k')
% set(gca, 'YLim', [1 12000])
% set(gca, 'YTick', [0 2000 4000 6000 8000 10000 12000])
% set(gca, 'XLim', [16 27])
% set(gca, 'XTick', 17:26)
% set(gca, 'XTickLabel', {'1e4' '' '' '10' '' '' '.01' '' '' '1e-5'})
% xlabel('Sensitivity Threshold (ng/mL)')
% %ylabel('Infected Cell Count at Day 10')
% %title('aH1N1 Influenza')
% lh = legend([hbar1 hbar2 hbar3 hbar4 hbar5], '10 \mug/mL', '1 \mug/mL', '100 ng/mL', '10 ng/mL', '1 ng/mL to .01 pg/mL');
% set(lh, 'FontSize', 14)
% 
% % Swine Histogram
% 
% subplot(2, 3, 6);
% 
% w17 = wb17(end,3) + wb17(end,4) + wb17(end,6);
% w18 = wb18(end,3) + wb18(end,4) + wb18(end,6);
% w19 = wb19(end,3) + wb19(end,4) + wb19(end,6);
% w20 = wb20(end,3) + wb20(end,4) + wb20(end,6);
% w21 = wb21(end,3) + wb21(end,4) + wb21(end,6);
% w22 = wb22(end,3) + wb22(end,4) + wb22(end,6);
% w23 = wb23(end,3) + wb23(end,4) + wb23(end,6);
% w24 = wb24(end,3) + wb24(end,4) + wb24(end,6);
% w25 = wb25(end,3) + wb25(end,4) + wb25(end,6);
% w26 = wb26(end,3) + wb26(end,4) + wb26(end,6);
% 
% hbar1 = bar(17, w17);
% hold on
% hbar2 = bar(18, w18);
% hbar3 = bar(19, w19);
% hbar4 = bar(20, w20);
% hbar5 = bar(21:26, [w21 w22 w23 w24 w25 w26]);
% hold off
% set(hbar1, 'FaceColor', colors(1,:))
% set(hbar2, 'FaceColor', colors(2,:))
% set(hbar3, 'FaceColor', colors(3,:))
% set(hbar4, 'FaceColor', colors(4,:))
% set(hbar5, 'FaceColor', colors(5,:))
% 
% set(gca, 'FontSize', 18)
% set(gca, 'FontWeight', 'bold')
% set(gca, 'YColor', 'k')
% set(gca, 'YLim', [1 12000])
% set(gca, 'YTick', [0 2000 4000 6000 8000 10000 12000])
% set(gca, 'XLim', [16 27])
% set(gca, 'XTick', 17:26)
% set(gca, 'XTickLabel', {'1e4' '' '' '10' '' '' '.01' '' '' '1e-5'})
% xlabel('Sensitivity Threshold (ng/mL)')
% %ylabel('Infected Cell Count at Day 10')
% %title('aH1N1 Influenza')
% lh = legend([hbar1 hbar2 hbar3 hbar4 hbar5], '10 \mug/mL', '1 \mug/mL', '100 ng/mL', '10 ng/mL', '1 ng/mL to .01 pg/mL');
% set(lh, 'FontSize', 14)
