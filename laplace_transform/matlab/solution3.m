%% solution3 - Solution for Example 3 from Week 3 notes.

% ADD NEW CODE HERE (1)
%% 
% In the lecture we showed that after simplification for Example 3
% 
% $V_{\mathrm{out}}(s)=\frac{2s(s+3)}{s^3 + 8s^2 + 10s + 4}$ (1)
% 
% We will use MATLAB to factorize the denominator $D(s)$ of the equation into 
% a linear and a quadratic factor.
% 
% Note that, when the denominator is factorized, equation (1) will be 
% 
% $V_{\mathrm{out}}(s)=\frac{2s(s+3)}{(s - p_1)(s - p_2)(s - p_3)}$ (2)
% 
% where $p_1$ is real and $p_2$ and $p_3$ are complex with $p_3 =p_2^*$ (the 
% complex conjugate of $p_2$).
%% Find roots of D(s)

d = [1, 8, 10, 4];
format long
p = roots(d)
%% Find quadratic form

syms s t
y = expand((s - p(2))*(s - p(3)))
%% Simplify coefficients of y
% Change coefficients to decimal with 10 digits.

y = vpa(y,10)
%% Now use inverse Laplace transform to solve
% Define the factors of the denominator and rewrite |Vout| in factored form

% ADD NEW CODE HERE (2)
%% Plot result

t=0:0.01:10;
Vout = 1.36.*exp(-6.57.*t)+0.64.*exp(-0.715.*t).*cos(0.316.*t)-1.84.*exp(-0.715.*t).*sin(0.316.*t);
plot(t, Vout); grid
title('Plot of Vout(t) for the circuit of Example 3')
ylabel('Vout(t) V'),xlabel('Time t s')
%% Alternative solution using transfer functions

Vout = tf(2*conv([1, 0],[1, 3]),[1, 8, 10, 4])
%%
impulse(Vout), grid