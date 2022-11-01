load('closedLoopFirst50.mat');
plot(times, y(:,1)/1000, 'color', 'b', 'linewidth', 2);
my_defaults();
xlabel('Time (s)');
ylabel('Resistance (k\Omega)');
xlim([0 130]);
set(gcf, 'Position', [557.8000  587.4000  796.0000  270.6000]);