%% Explore spectra of rectangular pulse as a function of duty cycle
% Prepared for EG-247 by C.P. Jobling
%% Duty cycle 50%

eta = 1/2;
t0 = 1;
T = 2*t0/eta;
%%
figure
k = -10:10;
stem(k.*(2*pi/T),2*t0*sinc(k.*(2*t0/T)))
%% 
% Add envelope
%%
hold on
omega = linspace(-20,20,1000); % crossings k pi/t0 
envelope = 2*t0*sinc(omega/pi);
plot(omega,envelope,'r:')
grid
title('Duty cycle 50%')
xlabel('\pi/t_0 [rad/s]')
ylabel('T C_k')
hold off
%% Duty cycle 12.5%
%%
eta = 1/8;
T = 2*t0/eta;
%%
figure
k = -40:40;
stem(k.*(2*pi/T),(2*t0*sinc(k.*(2*t0/T))));

%% 
% Add envelope
%%
hold on
plot(omega,envelope,'r:')
grid
title('Duty cycle 12.5%')
xlabel('\pi/t_0 [rad/s]')
ylabel('T C_k')
hold off