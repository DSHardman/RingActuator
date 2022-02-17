
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

%%
q = squareprobe(20:end-20,2);

v = VideoWriter('matlabvideo');
v.FrameRate = 50;
v.Quality = 100;
open(v);
for i = 1:2000:length(q)
    plot(0:0.02:(i-1)/100000, q(1:2000:i), 'Color', 'b', 'LineWidth', 2);
    axis([0,40,0.62,0.76]);
    set(gca, 'LineWidth', 2, 'FontSize', 15);
    set(gcf, 'Color', 'w');
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    box off
    set(gcf, 'Position', 1000*[0.3394    0.4380    1.0432    0.4200]);
    v.writeVideo(getframe(gcf));
end
close(v);