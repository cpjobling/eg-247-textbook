%% LAPLACE_LAB - Using MATLAB to Solve Laplace Transforms
% Inspired by Steven Karris, Signals and Systems: With MATLAB Computing and 
% Simulink Modelling, 5th Edition, Orchard Publications, 2012. Ebook: <http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416 
% Karris, Signals and Systems>
%% The Laplace Transform
% When the <http://uk.mathworks.com/products/symbolic/Symbolic Symbolic
% Math Toolbox> is installed, MATLAB is able to compute *Laplace transforms* using 
% the |laplace| function.
% 
% In this lab exercise we will demonstrate the use of the |laplace| function 
% by confirming some of the standard transforms and properties found in published 
% tables and properties of the Laplace Transform. We will then use the |laplace| 
% function to find the Laplace transform of some typical elementary signals. We 
% will conclude this exercise by using the laplace function to solve a selection 
% of problems from Chapter 2 of the textbook.
% 
% Please note that all citations of "the textbook" refer to Chapter 2 of Karris 
% (2012) which is accessible by following <https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=44853&ppg=43 
% the link>. 
%% 
% This next command opens the documentation for the |laplace| function. You 
% may wish to leave this open for consulation as you work through these exercises.

clearvars
doc laplace
%% Tranform Tables
% Let's start our exploration by verifying some simple transforms from the tables

syms s t f(t) a b n omega;
%% 
% Dirac Delta
% 
% $$\delta(t)$$

delta(t) = dirac(t);
laplace(delta(t))
%% 
% Unit Step
% 
% $$u_0(t)$$

u0(t) = heaviside(t);
laplace(u0(t))
%% Unit Ramp
% $$u_1(t)$$

u1(t) = t*u0(t);
laplace(u1(t))
%% Parabolic function
% $$u_2(t)$$

u2(t) = t^2*u0(t);
laplace(u2(t))
%% General power of t
% $$u_n(t)$$

un(t) = (t^n)*u0(t);
laplace(un(t))
%% What is gamma?
% See the development in Section 2.3.3 of the textbook
% 
% $$\Gamma (n + 1) = n!$$

factorial(5) == gamma(5 + 1) % In MATLAB 1 == TRUE
%%
laplace((t^5)*u0(t))
%% Delayed delta
% $$\delta(t - a)$$

laplace(delta(t-a))
%% Problem 1
% Use MATLAB to find the laplace transforms of |exp(-a*t)*u0(t)|, |t*exp(a*t)|,  
% |t^3*exp(b*t)*u0(t)|, |cos(b*t)*u0(t)|, |sin(b*t)*u0(t)|
% 
% Here's the first example done for you

laplace(exp(-a*t)*u0(t))
% Now do the other four!
%% Problem 2
% Find the Laplace Transform of |(t^n)*exp(-b*t)*u0(t)|
%% Problem 3
% Use MATLAB to compute the Laplace Transform of |exp(-a*t)*sin(omega*t)*u0(t)| 
% and |exp(-a*t)*cos(omega*t)*u0(t)|
%% Proble 4 - Laplace Transform Properties
% Give examples to prove each of the following:
%% 
% # The Linearity Property
% # The Time Shifting Property (use |syms T positive| to give Matlab a hint!)
% # The Frequency Shifting Property 
% # The Scaling Property
% # The Transform of First and Second Order Time Derviatives
% # The Integration in Time Domain Property
%% Problem 5
% Calculate the Laplace Transform of a rectangular pulse with a height 2 that 
% starts at t = 1 seconds and ends at t = 3 seconds. Plot the pulse.
%% Problem 6
% Plot a piecewise-linear signal that starts at 0 when t=0, goes to -1 at t 
% = 1, +1 at t = 2, and returns to 0 at t = 3. Calculate the Laplace Transform 
% of the waveform.
%% Problem 7
% Give the laplace transform of the waveform in Problem 5 assuming that it repeats 
% every 3 seconds. 
% 
% _Hint_: use the periodicity property 
% 
% $$f(t-nT)\Leftrightarrow \frac{\int_{0}^{T}\,f(t)e^{-st}\,dt}{1-e^{-sT}}$$
%% Problem 8
% Use MATLAB to plot a fully rectified sinusoidal signal |abs(sin(omega*t))| 
% over 3 full cycles. Find the Laplace Transform of this signal.
%% Homework
% (Not assessed.)
% 
% Chose one example from each of the End of Chapter Exercises 2.8 Q1-Q7 and 
% validate the solution using MATLAB.