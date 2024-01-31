%% FTEX1 - Using the Symbolic Math Toolbox to solve Fourier Transform
% Prepared by C.P.Jobling for EG-247 Digital Signal Processing. April 2020
%% *Example*
% Use MATLAB to confirm the Fourier transform pair:
% 
% $$e^{-\frac{1}{2}t^2}\Leftrightarrow \sqrt{2\pi}e^{-\frac{1}{2}\omega^2}$$

syms t v omega x;
ft = exp(-t^2/2);
Fw = fourier(ft,omega)
%%
pretty(Fw)
%% 
% Check by computing the inverse using |ifourier|
ft = ifourier(Fw,t)