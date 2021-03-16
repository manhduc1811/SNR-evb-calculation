clc;
clear;
close all;
%SoC, mducng
%-------------------------------------------------------------------------------
Tpulse   = 20e-3;
Fs       = 10e3;
t        = -1:1/Fs:1;
x        = rectpuls(t,Tpulse);
y        = 0.00001*randn(size(x));
s        = x + y;

%calculation of snr before filtering
snr_before     = mean(x.^2) / mean(y.^2);
snr_before_db  = 10 * log10(snr_before) % in dB

%calculation of snr MATLAB
pulseSNRMATLAB = snr(x,s-x)