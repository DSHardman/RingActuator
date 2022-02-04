
clear h
%plot(0:0.000001:17.999801, q)

h = animatedline('Color', 'b', 'LineWidth', 2);
axis([0,180,362000,378000]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Color', 'w');
xlabel('Time (s)');
ylabel('Resistance (\Omega)');

times = 0:0.00001:179.99801;

a = tic;
for k = 0:length(q)/1000
    addpoints(h,times(k*1000+1),q(k*1000+1));
    b = toc(a);
    drawnow
%     if b > 1/30
%         drawnow
%     end
end