
clear h
%plot(0:0.000001:17.999801, q)

q = squareprobe(20:end-20,2);

h = animatedline('Color', 'b', 'LineWidth', 2);
axis([0,40,0.62,0.76]);
set(gca, 'LineWidth', 2, 'FontSize', 15);
set(gcf, 'Color', 'w');
xlabel('Time (s)');
ylabel('Voltage (V)');
box off

times = 0:0.00001:39.99961;

a = tic;
for k = 0:length(q)/1000
    addpoints(h,times(k*1000+1),q(k*1000+1));
    b = toc(a);
    drawnow
%     if b > 1/30
%         drawnow
%     end
end