%% EFS_SQW
% Calculates the Exponential Fourier for a Square Wave with Odd Symmetry
%
clear all
%
%% Set up parameters
syms t A;

tau = 1;
T0 = 2*pi; % w = 2*pi*f -> t = 2*pi/omega
k_max = 11;

%% Define f(t)
%
% !!!IMPORTANT!!!: the signal definition must cover [0 to T0]
%
xt = A*(heaviside(t)-heaviside(t-T0/2)) - A*(heaviside(t-T0/2)-heaviside(t-T0));
%% Compute EFS
[a0, ak, bk, w] = TrigFourierSeries(xt, T0, k_max)
%% plot the numerical results from Matlab calculation
% Convert symbolic to numeric result
a0 = vpa(subs(a0, A, 1));
ak = vpa(subs(ak, A, 1));
bk = vpa(subs(bk, A, 1))
[0:k_max]
%% plot
figure
stem([0:k_max],[vpa(a0), vpa(abs(bk))], 'o-');
title('Trig. Fourier Series for Square Waveform with Odd Symmetry: b_k sin(k \Omega_0 t)')
xlabel('Hamonic frequencies: k\Omega_0 (rad/sec)');
ylabel('b_k');
