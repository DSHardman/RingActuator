subtight = @(m,n,p)subtightplot(m,n,p,[0.02 0.02], [0.2 0.1], [0.06 0.01]);

xvalues = 0:0.00001:20.34757;

figure();
subtight(1,3,1);
plot(xvalues, traps_2, 'LineWidth', 2);
box off
set(gca, 'LineWidth', 2, 'FontSize', 15);
ylabel('Response (V)');
ylim([0.8 1.4]);
xlim([0 20]);
title('w = 2mm');

subtight(1,3,2);
plot(xvalues, traps_4, 'LineWidth', 2);
box off
set(gca, 'LineWidth', 2, 'FontSize', 15, 'yticklabel', []);
xlabel('Time (s)');
ylim([0.8 1.4]);
xlim([0 20]);
title('w = 4mm');
legend({'t = 1mm'; 't = 2mm'; 't = 3mm'}, 'FontSize', 15,...
    'Orientation', 'horizontal', 'Location', 's');
legend boxoff

subtight(1,3,3);
plot(xvalues, traps_6, 'LineWidth', 2);
box off
set(gca, 'LineWidth', 2, 'FontSize', 15, 'yticklabel', []);
ylim([0.8 1.4]);
xlim([0 20]);
title('w = 6mm');

set(gcf, 'Position', 1000*[0.0874    0.4562    1.2936    0.3232]);


%%
figure();
sensitivities = zeros(3);

sensitivities(1,1) = sensitivity(traps_2(:,1));
sensitivities(1,2) = sensitivity(traps_2(:,2));
sensitivities(1,3) = sensitivity(traps_2(:,3));
sensitivities(2,1) = sensitivity(traps_4(:,1));
sensitivities(2,2) = sensitivity(traps_4(:,2));
sensitivities(2,3) = sensitivity(traps_4(:,3));
sensitivities(3,1) = sensitivity(traps_6(:,1));
sensitivities(3,2) = sensitivity(traps_6(:,2));
sensitivities(3,3) = sensitivity(traps_6(:,3));

h = heatmap(flipud(sensitivities), 'CellLabelColor','none');

h.XData = {'1','2','3'};
xlabel('t (mm)');
h.YData = {'6','4','2'};
ylabel('w (mm)');
set(gca, 'FontSize', 15);
colormap winter

set(gcf, 'Position', [488.0000  384.2000  534.6000  473.8000]);
title('Sensitivities');

function sens = sensitivity(response)
    maximum = max(response);
    minimum = min(response);
    maximum = 220000/(2/maximum - 1);
    minimum = 220000/(2/minimum - 1);

    sens = (maximum - minimum)/minimum;
end