clc;
clear;
close all;
%SoC, mducng
%-------------------------------------------------------------------------------
Tpulse   = 20e-3;
Fs       = 10e3;
t        = -1:1/Fs:1;
x        = rectpuls(t,Tpulse);
SNR      = 53;
y        = randn(size(x))*std(x)/db2mag(SNR);
s        = x + y;
%calculation of snr before filtering
snr_before     = mean(x.^2) / mean(y.^2);
snr_before_db  = 10 * log10(snr_before) % in dB
%calculation of snr MATLAB
snr_Matlab     = snr(x,y)
figure(1);
subplot(2,1,1);
plot(x);
%axis([0 2 0 2]);
subplot(2,1,2);
plot(y);
%axis([0 2 0 2]);