clc;
clear;
close all;
%SoC, mducng
%https://www.mathworks.com/matlabcentral/answers/717213-signal-to-noise-ratio-snr
%A simple example
%-------------------------------------------------------------------------------
Fs             = 1000;
f1             = 40;
%x1             = rectpuls((-1:1/Fs:1),Tpulse);
x2             = cos(2*pi*(-1:1/Fs:1)*f1); 
n              = 0.5*randn(size(x2));
s              = x2 + n;
% 1. method, in MATLAB, use 'snr'
pulseSNR_ML    = snr(x2,n);
% 2. definition method, 
pulseSNR_Eq    = mean(x2.^2) / mean(n.^2);
pulseSNR_Eq_db = 10 * log10(pulseSNR_Eq); % in dB
%-------------------------------------------------------------------------------
figure(1);
subplot(3,1,1);
plot(x2);
axis([-50 2050 -2 2]);
subplot(3,1,2);
plot(n);
axis([-50 2050 -2 2]);
subplot(3,1,3);
plot(s);
axis([-50 2050 -2 2]);
%-------------------------------------------------------------------------------