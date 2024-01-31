%% Waves and Symmetry
% Prepared for EG-247 Digital Signal Processing by Chris Jobling
%% Square wave

t = [-3*pi,-2*pi,-2*pi,-2*pi,-pi,-pi,-pi,0,0,0,pi,pi,pi,2*pi,2*pi,2*pi,3*pi];
f = [-1,-1,0,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1,1];
plot(t,f,"LineWidth",2)
axis([-2*pi,2*pi,-1.5,1.5])
grid
title('Square waveform')
xlabel('Angle [radians]')
ylabel('f(t)')
%% Shifted square wave

t = [-3*pi,-2*pi,-2*pi,-2*pi,-pi,-pi,-pi,0,0,0,pi,pi,pi,2*pi,2*pi,2*pi,3*pi];
f = [-1,-1,0,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1,1];
plot(t-pi/2,f,"LineWidth",2)
axis([-2*pi,2*pi,-1.5,1.5])
grid
title('Shifted square waveform')
xlabel('Angle [radians]')
ylabel('f(t)')
%% Sawtooth waveform

t = [-3*pi,-2*pi,-2*pi,-2*pi,-pi,0,0,0,pi,2*pi,2*pi,2*pi,3*pi];
f = [0,1,0,-1,0,1,0,-1,0,1,0,-1,0];
plot(t,f,"LineWidth",2)
axis([-2*pi,2*pi,-1.5,1.5])
grid
title('Sawtooth waveform')
xlabel('Angle [radians]')
ylabel('f(t)')
%% Triangular waveform

t = [-2*pi,-5*pi/2,-2*pi,-3*pi/2,-pi,-pi/2,0,pi/2,pi,3*pi/2,2*pi,5*pi/2,2*pi];
f = [0,-1,0,1,0,-1,0,1,0,-1,0,1,0]
plot(t,f,"LineWidth",2)
axis([-2*pi,2*pi,-1.5,1.5])
grid
title('Triangular waveform')
xlabel('Angle [radians]')
ylabel('f(t)')
%% Fundamental

t = linspace(0,4*pi,100);
plot(t,sin(t),"LineWidth",2)
grid
axis([0,4*pi,-1.5,1.5])
title('Fourier series: The fundamental frequency')
xlabel('Angle [radians]')
ylabel('f(t) = sin(\Omega_0 t)')
%% Second harmonic

t = linspace(0,4*pi,100);
plot(t,sin(2*t),t,sin(t),'r:',"LineWidth",2)
grid
axis([0,4*pi,-1.5,1.5])
title('Fourier series: The second harmonic')
xlabel('Angle [radians]')
ylabel('f(t) = sin(2\Omega_0 t)')
%% Third harmonic

t = linspace(0,4*pi,100);
plot(t,sin(3*t),t,sin(t),'r:',"LineWidth",2)
grid
axis([0,4*pi,-1.5,1.5])
title('Fourier series: The third harmonic')
xlabel('Angle [radians]')
ylabel('f(t) = sin(3\Omega_0 t)')