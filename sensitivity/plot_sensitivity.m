width = 20;
height = 13.7;

fig = figure();

set(fig, 'PaperUnits', 'inches');
set(fig, 'PaperSize', [width height]);
set(fig, 'Units', 'inches');
set(fig, 'Position', [0 0 width height]);
set(fig, 'PaperPosition', [0 0 width height]);

[n, ~] = size(prcc3);
x = 1:n;

colors = [196, 196, 196; ...
          221, 156, 25; ...
          31,  66,  148; ...
          0,   0,   0] / 256;


for i = 1:16

    % generate color vector
    
    c = colors(1,:)' * ones(1,n);
    
    % P < 0.05
    mask = find(sign3(:,i) < 0.05);
    c(:, mask) = colors(2, :)' * ones(1, length(mask));
    
    % P < 0.01
    mask = find(sign3(:,i) < 0.01);
    c(:, mask) = colors(3, :)' * ones(1, length(mask));
    
    % P < 0.001
%    mask = find(sign3(:,i) < 0.001);
%    c(:, mask) = colors(4, :)' * ones(1, length(mask));
    
    subplot(4, 4, i);

    plot(x*6/864, zeros(1,n), 'k--');
    hold on
    sh = scatter(x*6/864, prcc3(:,i), 16, c', 'filled');
    hold off
    
    title(labels_long(i), 'FontSize', title_font_size);
    
    if i > 12
        xlabel('Time (days)');
    end
    
    if mod(i, 4) == 1
        ylabel('Spearman Correlation');
    end
    
    ylim([-1 1]);
    xlim([0, 10]);

    set(gca, 'FontSize', font_size)
    set(gca, 'FontWeight', 'normal')
end

