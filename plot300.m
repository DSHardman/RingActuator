load('Extracted/Geometries/ramptrap3.mat');
x = x(50:end-50);
plot(0:0.00001:59.99901, x, 'LineWidth', 3, 'Color', 'b');
set(gca, 'FontSize', 25, 'LineWidth', 2);
box off
set(gcf, 'Position', 1000*[0.0834 0.5386 1.2816 0.3194]);
xlabel('Time (s)');
ylabel('Response (V)');