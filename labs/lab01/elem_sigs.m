%% EG-247 Signals and Systems: Lab 01: Elementary Signals
% This script file demonstrates the use of the |heaviside| and |dirac| functions. 
% To run the code select the commands in the cells.
% 
% This is also an example of the use of the publishing feature of MATLAB.
% 
% Please note that all citations of the "textbook" refer to <https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=17 
% Chapter 1 of Karris (2012)> which is accessible by following the link. 

clearvars % reset workspace
%% The Unit Step Function
% In the notes we define the unit step function as
% 
% $${u_0}(t) = \left\{ {\begin{array}{*{20}{c}}{0\quad t < 0}\\{1\quad t > 0}\end{array}} 
% \right.$$
% 
% In MATLAB the unit step is defined using the |heaviside| function

doc heaviside
%% 
% We can thus define and plot the unit step $u_0(t)$ with the command

syms t;
heaviside(t);
ezplot(ans,[-1,1]),grid
%% 
% If we are only interested in the value of the function at a particular instant 
% of time we can pass a number as the argument:

[heaviside(-1),heaviside(0),heaviside(1)]
%% Note that |heaviside(0)| returns the value $1/2$ which is not
% mathematically correct. The unit step function $u_o(t)$ is undefined at $t=0$.
% 
% The basic signal operations work as you'd expect

A = 2; T = 2;
v1 = A * heaviside(t - T);
ezplot(v1, [-1, 4]), grid
%% Part 1
% To validate Figure 1.8 in the textbook Karris (2012, page 1-4) use the |heaviside| 
% and |ezplot| functions to plot each of the following:
%% 
% # $-Au_0(t)$
% # $-Au_0(t-T)$
% # $-Au_0(t+T)$
% # $Au_0(-t)$
% # $Au_0(-t+T)$
% # $Au_0(-t-T)$
% # $-Au_0(-t)$
% # $-Au_0(-t+T)$
% # $-Au_0(-t-T)$
%% Part 2
% Use the |heaviside| and |ezplot| functionshow that $u_0(t) - u_0(t - 1)$ represents 
% the rectangular pulse shown in Figure 1.9 (a) in the textbook (Karris 2012).
%% Part 3
% Use the |heaviside| and |ezplot| functions to validate equations 1.13, 1.14, 
% 1.17 and 1.18 in the textbook (Karris 2012).
%% The Ramp Function
% The integral of the *unit step* function is the *ramp function*
% 
% $$u_1(t) = \int_{-\infty}^{t} u_0(\tau)d\tau$$
% 
% Gives
% 
% $${u_1}(t) = \left\{ {\begin{array}{*{20}{c}}{0\quad t < 0}\\{t\quad t > 0}\end{array}} 
% \right. = t{u_0}(t)$$
% 
% To verify this result:

syms tau
u1(t)= int(heaviside(tau),-inf, t)
%% 
% Plot the ramp function

ezplot(u1(t), [-1,5]), grid
title('u_1(t)')
%% Part 4
% Use |ezplot| to plot $u_2(t)$ and $u_3(t)$ as defined on Page 1-10 of the 
% textbook (Karris, 2012).
% 
% From the definitions
% 
% $$u_2(t) = 2\int_{-\infty}^{t} u_1(\tau)d\tau$$
% 
% so repeating the process:

u2(t)= 2*int(u1(tau),-inf, t)
%% 
% This returns a "case" statement which can't be plotted with |ezplot|. 
% 
% *Note*_: 
% 
% $$\frac{\left(\textrm{sign}\left(t\right)+1\right)}{2}=u_0 \left(t\right)\;\ldotp$$
% 
% As we are only interested in causal signals for which $t>0$, we can change 
% the limits of the integral.

2*int(u1(tau),0, t)
%% 
% and plot with zero origin

ezplot(ans, [0,5]), title('u_2(t)'), grid
%% 
% Alternatively, you can use the function |fplot| which is going to replace  
% |ezplot| in the future. This is able to correctly plot the _piecewise continuous_ 
% function returned in the original computation.

 fplot(u2(t),[-1,5]), title('u_2(t) plotted with fplot'), grid
%% 
% Now repeat this for $u_3 \left(t\right)$ using the definition
% 
% $$u_3(t) = 3\int_{0}^{t} u_2(\tau)d\tau$$
%% The Dirac Delta Function
% $\delta(t)$ is the derivative of $u_0(t)$

d(t) = diff(heaviside(t),t)
d(0)
%% 
% It's not easy to plot the Dirac delta function. We have to cheat a little 
% by drawing a line with height equal to the "weight" of the delta function

td = [-1,0,1]; delta = [0,1,0]
stem(td,delta)
%% 
% MATLAB has this function and its derivatives built-in

dirac(t)
%% 
% $$\delta'(t)$$

dirac(1,t)
%% 
% $$$\delta''(t)$$

dirac(2,t)
%% Part 5
% Use Matlab to solve Examples 1.8 and 1.9 from the textbook (Karris 2012). 
% You may not get the results you expect so if this is the case, just comment 
% on the result. Don't Forget to Save Your Work!