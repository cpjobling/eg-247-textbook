%  Three Band Graphic EQ design and Simulink Controller  (MB 3/26/2013)

%  Updated for 2021 using peak-filter as defined by Mark Wickert.

clear 
close all

fs = 22050;

% 4 dB at 125 Hz
[B1,A1] = peaking_filter(125,4,fs);
% -2 dB at 1000 Hz
[B2,A2] = peaking_filter(1000,-2,fs);
% 1 dB at 4000 Hz
[B3,A3] = peaking_filter(4000,2,fs);

[H1,W1] = freqz(B1,A1,1024);
[H2,W2] = freqz(B2,A2,1024);
[H3,W3] = freqz(B3,A3,1024);

subplot(211)
semilogx(W1/pi,20*log10(abs(H1)), W2/pi,20*log10(abs(H2)), W3/pi,20*log10(abs(H3)))
grid on
title('Freq Response of individual filters')
xlabel('Freq/Nyquist Freq')
ylabel('lin Mag')

absH = abs(H1)+abs(H2)+abs(H3);

subplot(212)
plot(W1/pi, 20*log10(absH))
axis([0 1 -10 10])
grid on
title('Freq Response of sum of filters')
xlabel('Freq/Nyquist Freq')
ylabel('20log Mag')

%sim('Three_Band_EQ_Model')

