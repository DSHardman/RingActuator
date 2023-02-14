load('Extracted/Geometries/ramptrap3.mat');
x = x(50:end-50);
plot(0:0.00001:59.99901, x, 'LineWidth', 3, 'Color', 'b');
set(gca, 'FontSize', 25, 'LineWidth', 2);
box off
set(gcf, 'Position', 1000*[0.0834 0.5386 1.2816 0.3194]);
xlabel('Time (s)');
ylabel('Response (V)');


%% plot response with strain
n = 8000;
m = 17000;

up = [473009+n 788469; 1540200+n 1848120; 2600360+n 2914040; 3663480+n 3977610];
down = [1022200 1347380-m; 2080130 2404270-m; 3141960 3467190-m; 4201740 4535770-m];

figure();
for i = 1:4
    plot(0:300/(up(i,2)-up(i,1)):300, x(up(i,1):up(i,2)), 'LineWidth', 2, 'color', 'k');
    hold on
    plot(300:-300/(down(i,2)-down(i,1)):0, x(down(i,1):down(i,2)), 'LineWidth', 2, 'color', 'b');
end

my_defaults([488.0000  491.4000  266.6000  366.6000]);
set(gca, 'FontSize', 18);
ylim([1 1.4]);
ylabel('Response (V)');
xlabel('Strain (%)');
legend({'Loading';'Unloading'}, 'FontSize', 15, 'location', 'se');
legend boxoff
