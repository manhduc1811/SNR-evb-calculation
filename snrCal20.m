clc;
clear;
close all;
%SoC, mducng
%https://www.mathworks.com/matlabcentral/answers/717213-signal-to-noise-ratio-snr
%A simple example
%-------------------------------------------------------------------------------
Fs             = 40000;
dt             = 1/Fs;
f1             = 6000;
t              = (0:1:1000)*dt;
x              = cos(2*pi*f1*t); 
noise          = 0.05*randn(size(x));
s              = x + noise;
% 1. method, in MATLAB, use 'snr'
SNR1_ML         = snr(s,noise);
% 2. definition method, 
SNR1_Eq         = mean(s.^2) / mean(noise.^2);
SNR1_Eq_db      = 10 * log10(SNR1_Eq); % in dB
%-------------------------------------------------------------------------------
figure(1);
subplot(3,1,1);
plot(x);
axis([-50 1100 -2 2]);
subplot(3,1,2);
plot(noise);
axis([-50 1100 -2 2]);
subplot(3,1,3);
plot(s);
axis([-50 1100 -2 2]);
%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
%Using filter
wp             = 5000;                              % passband frequency
ws             = 7000;                              % stopband frequency
n              = 2;                                 % filter order = 2*n = 12
w1             = (2 * wp)/Fs;
w2             = (2 * ws)/Fs;
wn             = [w1, w2];
[b, a]         = butter(n, wn, 'bandpass');
x_filter       = filter(b,a,s);
noise_filter   = s - x_filter;
%-------------------------------------------------------------------------------
% 1. method, in MATLAB, use 'snr'
SNR2_filter_ML    = snr(s,s - x_filter);
% 2. definition method, 
SNR2_filter_Eq    = mean(s.^2) / mean((s - x_filter).^2);
SNR2_filter_Eq_db = 10 * log10(SNR2_filter_Eq); % in dB
%-------------------------------------------------------------------------------
figure(2);
subplot(3,1,1);
plot(x_filter);
axis([-50 1100 -2 2]);
subplot(3,1,2);
plot(s - x_filter);
axis([-50 1100 -2 2]);
subplot(3,1,3);
plot(s);
axis([-50 1100 -2 2]);