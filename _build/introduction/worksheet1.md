---
interact_link: content/introduction/worksheet1.ipynb
title: 'Worksheet 1'
prev_page:
  url: /worksheets/index
  title: 'Worksheets'
next_page:
  url: /introduction/worksheet2
  title: 'Worksheet 2'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 1

## To accompany Chapter 1 Introduction

We will step through this worksheet in class. 

This give us an opportunity to demonstrate the electronic resources, OneNote, Teams, TurningPoint, MATLAB, Simulink and Wolfram Alpha, that we will use to make our time in class more active and enaging. We will also test your background knowledge coming into the module. 

You are expected to have at least watched the video presentation of [Chapter 1](https://cpjobling.github.io/eg-247-textbook/introduction) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to the first class.

## Setup

We will be using TurningPoint mobile response system polling in this session.

There are two ways to participate:
    



### 1. Use a web browser

This option always works providing you have a mobile web browser.

Browse to: [https://ttpoll.eu](https://ttpoll.eu). 

<img src="https://chart.googleapis.com/chart?cht=qr&chs=300x300&choe=UTF-8&chld=H&chl=https://ttpoll.eu" alt="QR Code" />

https://ttpoll.eu

### 2. Install and open the TurningPoint app

Browse to: [TurningPoint
app](https://www.turningtechnologies.com/turningpoint-app/)

<img alt="QR Code" src="https://chart.googleapis.com/chart?cht=qr&chs=300x300&choe=UTF-8&chld=H&chl=https://goo.gl/MEjxu7" />

https://goo.gl/MEjxu7

Use the links to the App stores at the bottom of that page or follow these links: [App Store](https://itunes.apple.com/us/app/responseware/id300028504?mt=8), [Google Play](https://play.google.com/store/apps/details?id=com.turningTech.Responseware&feature=search_result#?t=W251bGwsMSwyLDEsImNvbS50dXJuaW5nVGVjaC5SZXNwb25zZXdhcmUiXQ..).

When prompted: enter the **session ID**

## Today's Session ID
<pre>



</pre>
<div style="font-size: 32pt; font-face: bold;">EG2470001</div>
<pre>



</pre>

### Assign yourself to a group by table

There should be a card with a **group name** on your table.

Please use your TurningPoint app or the TurningPoint web app to assign yourself to your table's group name.

#### -> Launch Poll

The rest of the session will be anonymous and scored by teams.

### Icebreaker Questions

#### -> Launch Poll

### End of setup

## Continuous-time signals

Continuous signals are represented mathematically by functions which vary continuously with time.





Sinusoidal signals (e.g. AC) are pretty fundamental in electrical engineering. The mathematical model of a sinusoidal signal is:

$$x(t) = A \cos (2\pi f_0 t - \phi).$$ 

**Without talking to your anyone**, match each of the symbols to its definition

| Symbol     | Definition         |
|------------|--------------------|
| $A$        | Phase in radians   |
| $f_0$      | Frequency in Hz    |
| $\phi$     | Amplitude          |
| $2\pi f_0$ | Frequency in rad/s [rad s<sup>-1</sup>] |

#### -> Open Poll

### Gaining insight using computers

To help us answer these questions, let's use our mathematical tools to plot a signal like this and explore it. The example we will use is from *Signals and Systems for Dummies* (SS4D: page 12): 

$$3\cos(2\pi\cdot 2t - 3\pi/4)$$

#### Wolfram Alpha

Here's the link: <http://www.wolframalpha.com>

Paste this into the search box

    plot 3 cos(2 pi 2 t - 3 pi/4) 


#### Matlab

In Matlab we would need to tackle this by breaking down the steps.



{:.input_area}
```matlab
%Make sure that we have a clean workspace
clear all
format compact
```


Define `t`



{:.input_area}
```matlab
t = linspace(0, 1, 100);
```


Define `x`



{:.input_area}
```matlab
x = 3 * cos(2*pi*2*t - 3*pi/4);
```


Plot result, and label plot



{:.input_area}
```matlab
plot(t,x)
title('A Sinusoidal Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
grid
```


If you want to execute this in MATLAB, you can create a file.



{:.input_area}
```matlab
%%file sinewave.m
% SINEWAVE - plot function $x(t) = 3 \cos(2\pi t - 3 \pi/4)$ for $t = 0\ldots 1$

%% Set up the problem
% define t
t = linspace(0, 1, 100);
% define x
x = 3 * cos(2*pi*2*t - 3*pi/4);
%% Plot result and label plot
plot(t,x)
title('A Sinusoidal Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
grid
```


To run this script, just type the filename withount the `.m` extension



{:.input_area}
```matlab
sinewave
```


### Returning to the Question

Sinusoidal signals (e.g. AC) are pretty fundamental in electrical engineering. The mathematical model of a sinusoidal signal is:

$$x(t) = A \cos (2\pi f_0 t - \phi).$$ 

Using the insight just gained by exploring this function with a computer, try matching each of the symbols to its definition again.

**This time you may confer!**!

| Symbol     | Definition         |
|------------|--------------------|
| $A$        | Phase in radians   |
| $f_0$      | Frequency in Hz    |
| $\phi$     | Amplitude          |
| $2\pi f_0$ | Frequency in rad/s |

#### -> Open Poll

### Supplementary question

What is the period of the waveform in seconds?

1. $2\pi$
1. $f_0$
1. $t$
1. $1/f_0$
1. $2\pi/f_0$

#### -> Open poll

### Notes

* In communications and electronic signal processing, the frequency of sinusoidal signals us usually given in *cycles per second* or Hz. 
* In mathematics, the frequency is always expressed in *radians per second*. 
* In some courses, including later in this one and in EG-243 Control Systems, the frequency $2\pi f_0$ is often called the *natural frequency* and is usually written $\omega_n$.

### Try This Yourself

* Use any or all of computing tools that you have access to to explore other sinusoids. Change the values of the variables and explain what happens. 
* Try adding sinusoids of different amplitudes and different frequencies together and see what happens.
* Change `cos` to `sin` and see what happens.


## Continuous-time Systems

Systems operate on signals. In mathematical terms, a *system* is a function or an *operator*, $H\{\}$ that maps the input signal $x(t)$ to an output signal $y(t)$. 

Mathematically we would write this:

$$y(t) = H\{x(t)\}.$$

### Example

An example of a continuous-time system is an electronic amplifier with a gain of 5 and level shift of 2: $y(t) = H\{x(t)\} = 5x(t) + 2$.

In this course, we will model such systems as block diagram models in Simulink.

### Block diagram model in Simulink

<img src="pictures/css.png">

The Similink code can be downloaded from this file [gain_level_shift.slx](gain_level_shift.slx).

## Demonstration

If the input to this system is replaced with a sinewave $x(t)=\sin(t)$ and the output with a scope, what do you think the output will be? Sketch it in your notebook.

<pre style="border: 2px solid blue">





</pre>

If you get a chance, try this in youself in MATLAB and copy the result into your copy of this worksheet.




{:.input_area}
```matlab
open gain_level_shift
```


## Discrete-time Signals

Disrete-time signals are a function of a time index $n$. A discrete-time signal $x[n]$, unlike a continuous-time signal $x(t)$, is only defined at integer values of the independent variable $n$. This means that the signal is only active at specific periods of time. Discrete-time signals can be stored in computer memory.

### Demonstration

Consider the following simple signal, a pulse sequence:$$y[n] = \left\{ {\begin{array}{*{20}{c}}
{5,\;0 \le n < 10}\\
{0,\;{\rm{otherwise}}\quad \;}
\end{array}} \right.$$
We can plot this in Matlab as a *stem plot*

#### MATLAB run

Define function and save as [y.m](y.m).



{:.input_area}
```matlab
%%file y.m
% Define the function
function [ y ] = x( n )
  if n < 0 | n >= 10 
      y = 0;
  else 
      y = 5;
  end
end
```




{:.input_area}
```matlab
open y
```




{:.input_area}
```matlab
%% Define sample points
n = -15:18;
%% Make space for the signal
xn = zeros(size(n));

%% Compute the signal x[n]
for i = 1:length(xn)
    xn(i) = y(n(i));
end
```




{:.input_area}
```matlab
%% Plot the result
stem(n,xn)
axis([-15, 18, 0, 6])
title('Stem Plot for a Discrete Signal')
xlabel('Sample n')
ylabel('Signal x[n]')
grid
```


### Exercise 1

Draw a digital signal that represents your student number in some way. For example if your number was 765443, then you could generate a signal for which $x[n] = 0$ when $n < 7$, then $x[n] = 7$ for $7$ periods, then $x[n] = 6$ for the next 6 periods, $x[n] = 5$ for 5 periods, and so on. The signal should return to 0 when the last digit has been transmitted. 

Sketch your signal here:
<pre style="border: 2px solid blue;">









</pre>


To plot this on a computer you would need to transcribe $x[n]$ into an array and then use the stem plot to plot the data. You could just create the array by hand, but you could also create a MATLAB function if you would like a challenge.

### Exercise 2

For the example we started with $x(t) = 2 \cos (2\pi . 2t + 3\pi/4)$. Say we sample the cosine wave at 20 times the frequency of the sinusoid, what would the sampling period be and what would $N$ be if 1 seconds worth of data for the sampled waveform was to be stored?

#### Your Answer

<pre style="border: 2px solid blue">










</pre>

## Discrete-time Systems

A discrete-time system, like its continuous-time counterpart, is a function, $H\{\}$, that maps the input $x[n]$￼ ￼to the output $y[n] = H\{x[n]\}$. An example of a discrete-time system is the *two-tap* filter:

$$y[n] = H\{x[n]\} = \frac{3}{4}x[n] + \frac{1}{4}x[n-1]$$

The term *tap* denotes that output at time instant $n$ is formed from two time instants of the input, $n$ and $n – 1$. Check out a block diagram of a two-tap filter system:

<img src="pictures/ds.png" width="50%" />

This system is available as a Simulink model [discrete_system.slx](discrete_system.slx)



{:.input_area}
```matlab
open discrete_system
```


In words, this system scales the present input by 3/4 and adds it to the past value of the input scaled by 1/4. The notion of the past input comes about because ￼$x[n - 1]$ is lagging one sample value behind ￼$x[n]$. The term *filter* describes the output as an *averaging* of the present input and the previous input. *Averaging* is a form of filtering.

## Signal Classifications

### Periodic

Signals that repeat over and over are said to be *periodic*. In mathematical terms, a signal is periodic if:

* *Continuous signal* $x(t + T) = x(t)$
* *Discrete signal* $x[n + N] = x[n]$

￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼The smallest $T$ or $N$ for which the equality holds is the *signal period*.

The sinusoidal signal we saw earlier is periodic because of the $\mod 2\pi$ property of cosines. The signal of the sinusoid has period 0.5 seconds (s), which turns out to be the reciprocal of the frequency ￼ $1/f_0$￼ ￼ Hz.

#### Square Wave

This code generates a square wave.



{:.input_area}
```matlab
%% A Periodic signal (square wave)
t = linspace(0, 1, 500);
x = square(2 * pi * 5 * t);

```


This Square wave is a 5 Hz waveform sampled at 500 Hz for 1 second



{:.input_area}
```matlab
plot(t, x);
ylim([-2, 2]);
grid()
title('A Periodic Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
```


What is the period $T$ in milliseconds?

Write your answer here
<pre style="border: 2px solid blue">




</pre>

#### -> Open Poll

### Aperiodic

Signals that are *deterministic* (completely determined functions of time) but not periodic are known as *aperiodic*. Point of view matters. If a signal occurs infrequently, you may view it as aperiodic. 

This is how we generate an aperiodic rectangular pulse of duration $\tau$ in Matlab:





{:.input_area}
```matlab
%% An aperiodic function
tau = 1;
x = linspace(-1,5,1000);
y = rectangularPulse(0,tau,x);
```




{:.input_area}
```matlab
plot(x,y)
ylim([-0.2,1.2])
grid
title('An Aperiodic Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
```


### Random

A signal is random if one or more signal attributes takes on unpredictable
values in a probability sense.
￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼￼
Engineers working with communication receivers are concerned with random
signals, especially noise.




{:.input_area}
```matlab
%% Plot a Random Signal
plot(0.5 + 0.25 * rand(100,1))
ylim([0,1])
grid
title('Random Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
```


## Domains for Signals and Systems

Most of the signals we encounter on a daily basis reside in the time domain. They’re functions of independent variable $t$ or $n$. But sometimes when you’re working with continuous-time signals, you may need to transform away from the time domain ($t$) to another domain.

### Domain Quiz

A domain which is used in the analysis of signals and the design of systems is represented by complex numbers of the form:

$$\sigma + j\omega$$

**Without conferring**, tell me what domain is this?

#### -> Open Poll

### Now discuss your answer with your peers

### Domain Quiz (again)

A domain which is used in the analysis of signals and the design of systems is represented by complex numbers of the form:

$$\sigma + j\omega$$

Tell me what domain is this?

#### -> Open Poll

### Other Domains you will encounter

The most commonly used domains used when analysing continuous time signals are the frequency domain ($f$ or $\omega$) and the Laplace $s$-domain ($s$). 

Similarly, for discrete-time signals, you may need to transform from the discrete-time domain ($n$) to the frequency domain ($\hat{\omega}$￼) or the z-domain ($z$).


This section briefly introduces the world of signals and systems in the frequency, s-, and z-domains. More on these domains will follow.

Systems, continuous and discrete, can also be transformed to the frequency and s- and z-domains, respectively. Signals can, in fact, be passed through systems in these alternative domains. When a signal is passed through a system in the frequency domain, for example, the frequency domain output signal can later be returned to the time domain and appear just as if the time- domain version of the system operated on the signal in the time domain.


Consider the sum of a two-sinusoids signal
$$x(t) = \underbrace {A_1\cos(2\pi f_1 t)}_{s_1} + \underbrace {A_2\cos(2\pi f_2 t)}_{s_2}$$



{:.input_area}
```matlab
%%file two_sines.m
%... plot two sinusoids signal
A1 = 2; f1 = 1;
A2 = 1.5;f2 = 2.2;
t = linspace(0, 3*(1/f1), 1000);
s1 = A1*cos(2*pi*f1*t);
s2 = A2*cos(2*pi*f2*t);
subplot(4,1,1)
plot(t,s1),ylim([-5,5]),xlabel('Time t (s) '),ylabel('s1')
subplot(4,1,2)
plot(t,s2),ylim([-5,5]),xlabel('Time t (s) '),ylabel('s2')
subplot(4,1,3)
plot(t,s1+s2),ylim([-5,5]),xlabel('Time t (s) '),ylabel('x(t) = s2 + s2')
subplot(4,1,4)
axis([0,4,0,2.5])
arrow([f1,0],[f1,A1]),text(f1,A1+0.2,'A1'),text(f1+0.05,0.2,'f1')
arrow([f2,0],[f2,A2]),text(f2,A2+0.2,'A2'),text(f2+0.05,0.2,'f2')
ylabel('Frequency Spectrum X(f)'),xlabel('Frequency (Hz)')
```




{:.input_area}
```matlab
two_sines
```


### Polling Question

Which analysis method you have already encountered in the first year, would turn the time response shown in this picture to the frequency spectrum shown in the bottom graph? 

* Fourier transform
* Parsevel's theorem 
* Laplace transform
* Phasor analysis

#### -> Open Poll

### Challenge

I used the examples from **Signals and Systems for Dummies** to seed this Padlet collection [Examples of Signals and Systems](https://padlet.com/cpjobling/2f62bgl2q8dp).
![Examples of Signals and Systems QR Code](https://chart.googleapis.com/chart?cht=qr&chs=300x300&chl=https://padlet.com/cpjobling/2f62bgl2q8dp)

Can you add to it?

## Concluding Example: Some Basic Signal Operations

Consider a signal 

$$x = f(t) = \left\{ {\begin{array}{*{20}{c}}
{0\;:\;t <  - 1}\\
{t + 1\;:\; - 1 \le t \le 1}\\
{0\;:\;t > 1}
\end{array}} \right.$$

Sketch this signal.

<pre style="border: 2px solid blue">












</pre>

### Problem

Think about the effect on this signal of applying the following basic signal operations:

* $2 f(t)$
* $0.5 f(t)$
* $f(2t)$
* $f(0.5 t)$
* $-f(t)$
* $f(-t)$
* $-f(-t)$
* $f(t - 1)$
* $f(t + 1)$
* $-2f(-t+2)$

We will work through these after the break together then you will do some exercises based on [Chapter 1 of Karris](http://site.ebrary.com/lib/swansea/reader.action?docID=10547416&ppg=17).

## Answers to Selected Exercises



### Exercise 2

For the waveform given, $f_0 = 2$ Hz so the sampling frequency is $f_s = 20\times 2 = 40$ Hz. The sampling period will be $t_s = 1/f_s = 1/40 = 0.025$ s [$25$ ms]. The waveform shown is 1 second so $N = 1/t_s = 40$.
