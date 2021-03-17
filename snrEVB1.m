%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load txt file
load noiseDisplayOFF.txt;
load noiseDisplayON.txt;
load signalDisplayOFFhover.txt;
load signalDisplayONhover.txt;
load signalDisplayOFFink.txt;
load signalDisplayONink.txt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs                                  = 10^6;  
dt                                  = 1/Fs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% two noises
x_full_noiseDisplayOFF_RAW          = noiseDisplayOFF;
x_full_noiseDisplayOFF              = x_full_noiseDisplayOFF_RAW - mean(x_full_noiseDisplayOFF_RAW);
t_full_noiseDisplayOFF              = (1:1:length(x_full_noiseDisplayOFF))*dt;
%mean(x_full_noiseDisplayOFF)
x_full_noiseDisplayON_RAW           = noiseDisplayON;
x_full_noiseDisplayON               = x_full_noiseDisplayON_RAW - mean(x_full_noiseDisplayON_RAW);
t_full_noiseDisplayON               = (1:1:length(x_full_noiseDisplayON))*dt;
%mean(x_full_noiseDisplayON)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_full_signalDisplayOFFhover_RAW    = signalDisplayOFFhover;
x_full_signalDisplayOFFhover        = x_full_signalDisplayOFFhover_RAW - mean(x_full_signalDisplayOFFhover_RAW);
t_full_signalDisplayOFFhover        = (1:1:length(x_full_signalDisplayOFFhover))*dt;
%mean(x_full_signalDisplayOFFhover)
x_full_signalDisplayONhover_RAW     = signalDisplayONhover;
x_full_signalDisplayONhover         = x_full_signalDisplayONhover_RAW - mean(x_full_signalDisplayONhover_RAW);
t_full_signalDisplayONhover         = (1:1:length(x_full_signalDisplayONhover))*dt;
%mean(x_full_signalDisplayONhover)
x_full_signalDisplayOFFink_RAW      = signalDisplayOFFink;
x_full_signalDisplayOFFink          = x_full_signalDisplayOFFink_RAW - mean(x_full_signalDisplayOFFink_RAW);
t_full_signalDisplayOFFink          = (1:1:length(x_full_signalDisplayOFFink))*dt;
%mean(x_full_signalDisplayOFFink)
x_full_signalDisplayONink_RAW       = signalDisplayONink;
x_full_signalDisplayONink           = x_full_signalDisplayONink_RAW - mean(x_full_signalDisplayONink_RAW);
t_full_signalDisplayONink           = (1:1:length(x_full_signalDisplayONink))*dt;
%mean(x_full_signalDisplayONink)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SNR calculation
SNR_signalDisplayOFFhover           = snr(x_full_signalDisplayOFFhover - x_full_noiseDisplayOFF,x_full_noiseDisplayOFF);
SNR_signalDisplayONhover            = snr(x_full_signalDisplayONhover  - x_full_noiseDisplayON,x_full_noiseDisplayON);
SNR_signalDisplayOFFink             = snr(x_full_signalDisplayOFFink   - x_full_noiseDisplayOFF,x_full_noiseDisplayOFF);
SNR_signalDisplayONink              = snr(x_full_signalDisplayONink    - x_full_noiseDisplayON,x_full_noiseDisplayON);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot signal
figure(1);
subplot(3,1,1);
plot(t_full_noiseDisplayOFF,x_full_noiseDisplayOFF);
title('Noise display OFF.');
axis([0 0.016 -0.5 0.5]);
subplot(3,1,2);
plot(t_full_noiseDisplayON,x_full_noiseDisplayON);
title('Noise display ON.');
axis([0 0.016 -0.5 0.5]);
figure(2);
subplot(3,1,1);
plot(t_full_signalDisplayOFFhover,x_full_signalDisplayOFFhover);
title('Signal display OFF - hover.');
axis([0 0.016 -0.5 0.5]);
subplot(3,1,2);
plot(t_full_signalDisplayONhover,x_full_signalDisplayONhover);
title('Signal display ON - hover.');
axis([0 0.016 -0.5 0.5]);
figure(3);
subplot(3,1,1);
plot(t_full_signalDisplayOFFink,x_full_signalDisplayOFFink);
title('Signal display OFF - ink.');
axis([0 0.016 -0.5 0.5]);
subplot(3,1,2);
plot(t_full_signalDisplayONink,x_full_signalDisplayONink);
title('Signal display ON - ink.');
axis([0 0.016 -0.5 0.5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%