clc;
clear;
close all;
%SoC, mducng
%-------------------------------------------------------------------------------
Fs              = 40000;
dt              = 1/Fs;
f1              = 6000;
t               = (0:1:1000)*dt;
s               = cos(2*pi*f1*t); 
%---- achieve SNR
SNR             = 10;
sstd            = std(s);
sdb2mag         = db2mag(SNR);
n               = randn(size(s))*sstd/sdb2mag;
x               = s + n;
%-------------------------------------------------------------------------------
snr_before      = mean(s.^2) / mean(n.^2);
snr_before_db   = 10 * log10(snr_before) % in dB
%calculation of snr MATLAB
snr_Matlab      = snr(s,n)
%-------------------------------------------------------------------------------
figure(1);
subplot(3,1,1);
plot(s);
axis([0 1100 -1.5 1.5 ]);
subplot(3,1,2);
plot(n);
axis([0 1100 -1.5 1.5 ]);
subplot(3,1,3);
plot(x);
axis([0 1100 -1.5 1.5 ]);