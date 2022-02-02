window=1000;

% Much quicker to just take a smoothed envelope
% extractions = smooth(envelope(x), window);
% extractions = extractions(2:end-2); % Remove edge artefacts 

% Including phase for capacitance model
extractions = zeros(size(x,1)-window, 1);

for i=1:length(x)-window
    ax=fft(x(0+i:i+window));
    ay=fft(y(0+i:i+window));

    [mag_x, idx_x] = max(abs(ax));
    [mag_y, idx_y] = max(abs(ay));
    %extractions(i,1) = mag_x;

    %extractions(i,1) = 220000/(mag_y/mag_x-1);
    extractions(i,1) = mag_y/mag_x;
    extractions(i,2) = angle(ay(idx_y)) - angle(ax(idx_x));
end

%% First capacitance model: p502
A = 1.26^2;
B = 2*220000;
C = 220000^2;
for i = 1:size(extractions, 1)
    alpha = A - extractions(i,1)^2;
    extractions(i,1) = (- B - sqrt(B^2 - 4*alpha*C))/(2*alpha);
end

%% Second capacitance model: p504 & 511
complex = zeros(size(extractions, 1), 4);
for i = 1:size(extractions,1)
    D = tan(extractions(i,2));
    E = extractions(i,1);
    F = (1/E)*sqrt(1 + 1/(D^2)) - (1/D);

    b = -(220000/D + 220000*F)/(1 + F^2);
    a = b*F;

    complex(i,1:2) = [a b];
    complex(i, 3) = (a^2 + b^2)/a;
    complex(i, 4) = -b/(a^2 + b^2);
end