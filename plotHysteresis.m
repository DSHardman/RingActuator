% variable hyst has already been converted to resistance in kOhm

troughs = [629 1412 2216 3013 3822 4608 5416 6229 7006 7827];

peaks = [186 988 1798 2591 3390 4191 4995 5787 6589 7392 8190];


for i = 1:10
    plot(linspace(100,-80,1+troughs(i)-peaks(i)), hyst(peaks(i):troughs(i)), 'color', 'k');
    hold on
    plot(linspace(-80,100,1+peaks(i+1)-troughs(i)), hyst(troughs(i):peaks(i+1)), 'color', 'k');
end

set(gca, 'linewidth', 2, 'FontSize', 18)
box off
ylabel('Resistance (k\Omega)');
xlabel('Pressure (kPa)');
axis square
grid on