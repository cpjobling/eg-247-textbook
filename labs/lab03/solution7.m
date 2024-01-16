%% solution7 - Verification of Solution for Example 7 from notes
% Basis for Mini Project 3.

syms s;
%%
R1 = 200*10^3; 
R2 = 40*10^3;
R3 = 50*10^3;

C1 = 25*10^(-9);
C2 = 10*10^(-9);
%%
den = R1*((1/R1+ 1/R2 + 1/R3 + s*C1)*(s*R3*C2) + 1/R2);
simplify(den)
% 
% Result is: 100*s*((7555786372591433*s)/302231454903657293676544 + 1/20000) + 5
%% 
% Simplify coefficient of s^2

a = 100*7555786372591433/302231454903657293676544
% Simplify coefficient of s
b = 100/20000
%
denG = [a, b, 5];
numG = -1;
%% Plot

w = 1:10:10000;
%
% $$G(j\omega) = \frac{-1}{a\omega^2 - jb\omega + 5}$$
%
Gs = -1./(a*w.^2 - j.*b.*w + 5);
%
semilogx(w, abs(Gs))
xlabel('Radian frequency w (rad/s')
ylabel('|Vout/Vin|')
title('Magnitude Vout/Vin vs. Radian Frequency')
grid
%% 
% *TODO*: open this file as a Live Script file and saveas |proj3.mlx. A|dapt 
% using component values based on your student number as stated in the notes for 
% Mini Project 3. 
% 
% Repeat the computations above then add code to:
%% 
% # compute and plot the phase response of |Gs| - see function |angle|
% # make a transfer function LTI object |Gs2 = tf(numG,denG)|
% # Compare frequency response with result of |bode(Gs2)|
% # Plot the pole-zero map of |Gs2| using the |pzmap| function.
% # Plot the step response of |Gs2| using the |step| function.
% # Compute and plot the response of GS2 to the sinusoid using the |lsim| function.
% # Repeat the simulation of the sinsoudal response in Simulink - save model 
% as |proj3.slx|.