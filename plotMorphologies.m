figure();
for i = 1:3
    subplot(1,4,1);
    plot(435000./([2./straightprobe(:,i)] - 1)); ylim([1.8e5 3.2e5]);
    hold on
    subplot(1,4,2);
    plot(435000./([2./squareprobe(:,i)] - 1)); ylim([1.8e5 3.2e5]);
    hold on
    subplot(1,4,3);
    plot(435000./([2./circleprobe(:,i)] - 1)); ylim([1.8e5 3.2e5]);
    hold on
    subplot(1,4,4);
    plot(435000./([2./triangprobe(:,i)] - 1)); ylim([1.8e5 3.2e5]);
    hold on
end

%%
figure();
initfail = [192 206; 101 248; 96.5 272; 75 273; 96 466; 275 483; 273 458; 122 386];
h = bar(initfail,'LineWidth',1.5);
h(1).FaceColor = 1/255*[166 206 227];
h(2).FaceColor = 1/255*[31 120 180];
set(gca, 'FontSize', 15, 'LineWidth', 2, 'XTickLabel', []);
ylabel('Strain (%)');
box off
set(gcf, 'Position', 1000*[0.1498    0.3594    1.1480    0.4200]);
legend({'Initiation';'Failure'}, 'Location', 'nw', 'Box', 'off');