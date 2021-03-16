clc;
clear;
close all;
%generate the noisy signal which will be filtered
t              = 0:0.001:1.23;
x              = cos(2*pi*12*t);
[b,a]          = butter(2,[0.6 0.7],'bandpass');
filtered_noise = filter(b,a,randn(1, length(x)*2));
y              = (x + 0.5*filtered_noise(500:500+length(x)-1));
%Use matlabs built-in buttord function to get the optimum order to meet a specification
[N,Wn]         = buttord(0.1, 0.5, 5, 40);
%use the N and Wn values obtained above to design the filter in the usual way
[b,a]          = butter(N, Wn, 'low');
%-------------------------------------------------------------------------------

%filter the signal and plot the ouput of the filter
Y_filtered     = filter(b,a,y);
%calculation of snr before filtering
snr_before     = mean(x.^2) / mean(filtered_noise.^2);
snr_before_db  = 10 * log10(snr_before); % in dB
snr_before_ML  = snr(x,filtered_noise);
%calculation of snr after filtering
residual_noise = y - Y_filtered; 
snr_after      = mean(x.^2) / mean(residual_noise.^2); 
snr_after_db   = 10 * log10(snr_after);
%snr_after_ML   = snr(x,residual_noise);