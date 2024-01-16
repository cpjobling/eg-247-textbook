%% EXP_FSERIES
% Calculates the Exponential Fourier for a Square Wave with Odd Symmetry

clear all
%
%% Set up parameters

syms t A;
u0(t) = heaviside(t)
%% Set up problem

f0 = 1000;         % Hz
T0 = 1/f0;          % s
omega_0 = 2*pi/T0; % rad/s
%% Specify which harmonics we want

k_max = 11;
%% Define f(t)
% !!!IMPORTANT!!!: the signal definition must cover [0 to T0]
% 
% So I've sythesized two periods so we can easily shift the waveform later. 
% 
% It's a good idea to plot the waveform so you can check it's OK!

% first period
f(t) = A*(u0(t)-u0(t-T0/2)) - A*(u0(t-T0/2) - u0(t-T0));
% Add second period - f(t) delayed by T0
f(t) = f(t) + f(t-T0)
fplot(subs(f(t),A,1),[0,2*T0],'LineWidth',2)

%% Compute EFS

[Ck, w] = FourierSeries(f(t), T0, k_max);
Ck
%% Reconstruct f(t) from expontial functions

Ft = 0;
for k=1:length(Ck)
    Ft = Ft + Ck(k)*exp(j*w(k)*t);
end
Ft = vpa(Ft,4)
%% plot the numerical results from Matlab calculation
% Convert symbolic to numeric result

Ck_num = subs(Ck,A,1);
Ck_num = vpa(Ck_num, 4);
%% plot
% note we need to convert to double

subplot(211)
stem(w/(2*pi),abs(double(Ck_num)), 'o-');
title('Exponential Fourier Series for Square Waveform with Odd Symmetry')
xlabel('f (Hz)');
ylabel('|C_k|');
%%
subplot(212)
stem(w/(2*pi),angle(double(Ck_num)), 'o-');
xlabel('f (rad/sec)');
ylabel('\angle C_k [Hz]');