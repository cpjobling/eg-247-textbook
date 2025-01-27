---
jupytext:
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.15.2
kernelspec:
  display_name: MKernel
  language: matlab
  name: mkernel
---

+++ {"slideshow": {"slide_type": "slide"}}

**-> Start recording**

**-> Start slideshow**

+++ {"slideshow": {"slide_type": "slide"}}

# Worksheet 1

## To accompany Unit 1 Introduction

We will step through this worksheet in class.

This give us an opportunity to demonstrate the electronic resources, Canvas, OneNote, Slido, MATLAB, Simulink and Wolfram Alpha, that we will use to make our time in class more active and engaging. We will also test your background knowledge coming into the module.

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

This worksheet has been designed to be used in Microsoft's OneNote. Should you wish to use another note taking application, a version of this worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet1.pdf).

A copy of this worksheet will be distributed before the first class meeting in the **Week 1: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **In Class Workbooks** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote.

You are expected to have at least watched the video presentation of [Chapter 1](https://cpjobling.github.io/eg-247-textbook/introduction) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to the first class.

After class, the lecture recording and the annotated version of this worksheet will be made available to you through Canvas.

+++ {"slideshow": {"slide_type": "slide"}}

## How this will work

There will (usually) be two worksheets per week - one per class hour.

The worksheets are based on the corresponding sections of the notes.

We will use the worksheets as class whiteboards and the Slido audience response system to make the class as active as we can.

+++ {"slideshow": {"slide_type": "subslide"}}

### Before class

- I will have published a video of me presenting the slide-show version of the notes in advance of class.

- A copy of this worksheet will have been distributed to your **Worksheets** folder on OneNote so that you can make your own notes.

+++ {"slideshow": {"slide_type": "subslide"}}

### In class

- I will step through the worksheet in class using the Slide Show feature of Jupyter Notebooks.

- I can execute embedded examples of MATLAB code as we go (the notes contain all the results of these code examples).

- Any hand written notes that I would need to make on a White Board will be done on my copy of this worksheet. This means you have a copy of my handwritten notes as soon as the network syncs your class notebook.

+++ {"slideshow": {"slide_type": "subslide"}}

### After class

- My annotated version of this worksheet will be visible in the **\_Content Library** of the class notebook
- I will provide a link to the OneNote page on the Whiteboard pages in Canvas.
- Copies of the lecture recordings will be uploaded to Canvas.
- There will be a lab in which you can learn more about the topics covered using MATLAB.
- You should attempt the homework.

+++ {"slideshow": {"slide_type": "notes"}}

At the end of each week’s activities, you should have a complete record of everything that happened in class and ample opportunities to have made additional notes and practice the techniques shown.

+++ {"slideshow": {"slide_type": "skip"}}

## Setup MATLAB

```{code-cell}
---
slideshow:
  slide_type: skip
tags: [remove-output]
---
% Make sure that we have a clean workspace
clear all
format compact; 
setappdata(0, "MKernel_plot_format", 'svg')
```

+++ {"slideshow": {"slide_type": "subslide"}}

## Slido

We will be using a web-based audience response system called **Slido** for in-class quizzes and informal surveys.

+++ {"slideshow": {"slide_type": "slide"}}

Open slido [www.slido.com](www.slido.com)

+++ {"slideshow": {"slide_type": "fragment"}}

When prompted enter the session id **# 288 5587**

<img src="pictures/qr-code-slido.svg" alt="QR code for Slide session # 288 5587" width="25%" />

+++ {"slideshow": {"slide_type": "subslide"}}

### Icebreaker Questions

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Launch Icebreaker Poll**

+++ {"slideshow": {"slide_type": "slide"}}

## Continuous-time signals

Continuous signals are represented mathematically by functions which vary continuously with time.

+++ {"slideshow": {"slide_type": "fragment"}}

Sinusoidal signals (e.g. AC) are fundamental in electrical engineering.

+++ {"slideshow": {"slide_type": "subslide"}}

The mathematical model of a sinusoidal signal is:

$$x(t) = A \cos (2\pi f_0 t - \phi).$$

Which of the following symbols represents the frequecy of the signal in Hz (cycles per second)?

| Symbol             | Text           |
| ------------------ |----------------|
| $A$                | `A`            |
| $f_0$              | `f_0`          |
| $2\pi f_0$         | `2 pi f_0`     |
| $\phi$             | `phi`          |

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Launch Poll 1**

+++ {"slideshow": {"slide_type": "subslide"}}

### Gaining insight using computers

To help us answer these questions, let's use our mathematical tools to plot a signal like this and explore it. The example we will use is from _Signals and Systems for Dummies_ (SS4D: page 12):

$$3\cos(2\pi\cdot 2t - 3\pi/4)$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Wolfram Alpha

Here's the link: <https://www.wolframalpha.com>

Paste this into the search box

    plot 3 cos(2 pi 2 t - 3 pi/4)

The lecturer will change the numbers in class. Note what happens and try to gain insight.

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB

In MATLAB we would need to tackle this by breaking down the steps.

+++ {"slideshow": {"slide_type": "subslide"}}

Define `t`

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
t = linspace(0, 1, 100);
```

+++ {"slideshow": {"slide_type": "subslide"}}

Define `x`

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
x = 3 * cos(2*pi*2*t - 3*pi/4);
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot result, and label plot

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
plot(t,x)
title('A Sinusoidal Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
grid
```

+++ {"slideshow": {"slide_type": "notes"}}

If you want to execute this in MATLAB, you can create a file by copying this text into an `m-file` called `sinewave.m`:

```{matlab}
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

```{code-cell}
---
slideshow:
  slide_type: notes
---
edit sinewave
```

+++ {"slideshow": {"slide_type": "notes"}}

To run this script, just type the filename without the `.m` extension.

```{code-cell}
---
slideshow:
  slide_type: notes
---
sinewave
```

+++ {"slideshow": {"slide_type": "notes"}}

Next time you have access to MATLAB, download this script ([sinewave.m](https://cpjobling.github.io/eg-247-textbook/introduction/sinewave.m)) and adjust the values of the numerical constants and see what additional insights you gain about the meaning of the variables $A$, $f_0$, $2\pi f_0$, and $\phi$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Returning to the Question

Using the insight just gained by exploring this function with a computer, which of the following symbols do you now think represents the frequency of the signal in Hz?

| Symbol             |
| ------------------ |
| $A$                |
| $f_0$              |
| $2\pi f_0$         |
| $\phi$             |

**This time you may discuss with your neighbours!**

+++ {"slideshow": {"slide_type": "subslide"}}

## What are the other symbols?

Using the answer from the second poll, let's correct the table of properties of the sinewave. Insert the correct mathematical expression into the table using the symbols $A$, $f_0$, $2\pi f_0$, $\phi$.

| Quantity                  |  Symbol            | Units |
| --------------------------|--------------------|-------|
| Amplitude                 |                    | V     |
| Frequency                 |                    | Hz    |
| Angular frequency          |                    | rad/s |
| Phase shift               |                    | rad   |

+++ {"slideshow": {"slide_type": "subslide"}}

### Supplementary question

If a sinusoidal signal is $$x(t) = A \cos (2\pi f_0 t - \phi)$$ what is the period of the signal in seconds?

1. $f_0$
1. $2\pi$
1. $t$
1. $1/f_0$
1. $\phi$

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Launch poll 3**

+++ {"slideshow": {"slide_type": "notes"}}

**Notes**

- In communications and electronic signal processing, the frequency of sinusoidal signals us usually given in _cycles per second_ or Hz.
- In mathematics, the frequency is always expressed in _radians per second_.
- In some courses, including later in this one and in EG-243 Control Systems, the frequency $2\pi f_0$ is often called the _natural frequency_ and is usually written $\omega_n$.

+++ {"slideshow": {"slide_type": "notes"}}

### Try This Yourself

- Use any or all of computing tools that you have access to to explore other sinusoids. Change the values of the variables and explain what happens.
- Try adding sinusoids of different amplitudes and different frequencies together and see what happens.
- Change `cos` to `sin` and see what happens.

+++ {"slideshow": {"slide_type": "slide"}}

## Continuous-time Systems

Systems operate on signals. In mathematical terms, a _system_ is a function or an _operator_, $H\{\}$ that maps the input signal $x(t)$ to an output signal $y(t)$.

Mathematically we would write this:

$$y(t) = H\{x(t)\}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 1

An example of a continuous-time system is an electronic amplifier with a gain of 5 and level shift of 2: $y(t) = H\{x(t)\} = 5x(t) + 2$.

In this course, we will model such systems as block diagram models in Simulink.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Block diagram model in Simulink

![Simulink model of a continuous-time system](./pictures/css.png)

The Simulink code can be downloaded from this file [gain_level_shift.slx](https://cpjobling.github.io/eg-247-textbook/introduction/gain_level_shift.slx).

+++ {"slideshow": {"slide_type": "subslide"}}

#### Demonstration

If the input to this system is a sinewave $x(t)=\sin(t)$ and the output with a scope, what do you think the output will be? Sketch it in your notebook.

<pre style="border: 2px solid blue">
















</pre>

If you get a chance, try this in yourself in MATLAB and copy the result into your copy of this worksheet.

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
open gain_level_shift
```

+++ {"slideshow": {"slide_type": "slide"}}

## Discrete-time Signals

Discrete-time signals are a function of a time index $n$. A discrete-time signal $x[n]$, unlike a continuous-time signal $x(t)$, is only defined at integer values of the independent variable $n$. This means that the signal is only active at specific periods of time. Discrete-time signals can be stored in computer memory.

+++ {"slideshow": {"slide_type": "subslide"}}

### Demonstration

Consider the following simple signal, a pulse sequence:

$$
  y[n] = \left\{
    {
      \begin{array}{ll}
        {5,\;0 \le n < 10}\\
        {0,\;{\rm{otherwise}}\quad \;}
      \end{array}
    }
  \right.
$$

We can plot this in Matlab as a _stem plot_

+++ {"slideshow": {"slide_type": "subslide"}}

First define the signal by copying this text into an `m-file` called `y.m`:

```matlab
% Define the function
function [ y ] = x( n )
  if n < 0 | n >= 10 
      y = 0;
  else 
      y = 5;
  end
end
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
edit y
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
%% Define sample points
n = -15:18;
%% Make space for the signal
xn = zeros(size(n));

y(0)

%% Compute the signal x[n]
for i = 1:length(xn)
    xn(i) = y(n(i));
end
xn
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
%% Plot the result
stem(n,xn)
axis([-15, 18, 0, 6])
title('Stem Plot for a Discrete Signal')
xlabel('Sample n')
ylabel('Signal x[n]')
grid

```

+++ {"slideshow": {"slide_type": "notes"}}

Download [y.m](y.m)

+++ {"slideshow": {"slide_type": "notes"}}

### Exercise 1

Draw a digital signal that represents your student number in some way. For example if your number was 765443, then you could generate a signal for which $x[n] = 0$ when $n < 7$, then $x[n] = 7$ for $7$ periods, then $x[n] = 6$ for the next 6 periods, $x[n] = 5$ for 5 periods, and so on. The signal should return to 0 when the last digit has been transmitted.

Sketch your signal here:

<pre style="border: 2px solid blue;">









</pre>

+++ {"slideshow": {"slide_type": "notes"}}

To plot this on a computer you would need to transcribe $x[n]$ into an array and then use the stem plot to plot the data. You could just create the array by hand, but you could also create a MATLAB function if you would like a challenge.

+++ {"slideshow": {"slide_type": "subslide"}}

### Exercise 2

For the example we started with $x(t) = 2 \cos (2\pi . 2t + 3\pi/4)$. Say we sample the cosine wave at 20 times the frequency of the sinusoid, what would the sampling period be and what would $N$ be if 1 seconds worth of data for the sampled waveform was to be stored?

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Open Example poll **

+++ {"slideshow": {"slide_type": "notes"}}

#### Your Answer

<pre style="border: 2px solid blue">










</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## Discrete-time Systems

A discrete-time system, like its continuous-time counterpart, is a function, $H\{\}$, that maps the input $x[n]$￼ ￼to the output $y[n] = H\{x[n]\}$. An example of a discrete-time system is the _two-tap_ filter:

$$y[n] = H\{x[n]\} = \frac{3}{4}x[n] + \frac{1}{4}x[n-1]$$

+++ {"slideshow": {"slide_type": "subslide"}}

The term _tap_ denotes that output at time instant $n$ is formed from two time instants of the input, $n$ and $n – 1$. Check out a block diagram of a two-tap filter system:

![Simulink model of a discrete-time system](./pictures/ds.png)

This system is available as a Simulink model [discrete_system.slx](https://cpjobling.github.io/eg-247-textbook/introduction/discrete_system.slx)

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
open discrete_system
```

+++ {"slideshow": {"slide_type": "notes"}}

In words, this system scales the present input by 3/4 and adds it to the past value of the input scaled by 1/4. The notion of the past input comes about because $x[n - 1]$ is lagging one sample value behind $x[n]$. The term _filter_ describes the output as an _averaging_ of the present input and the previous input. _Averaging_ is a form of filtering.

+++ {"slideshow": {"slide_type": "slide"}}

## Signal Classifications

+++ {"slideshow": {"slide_type": "subslide"}}

### Periodic

Signals that repeat over and over are said to be _periodic_. In mathematical terms, a signal is periodic if:

- _Continuous signal_ $x(t + T) = x(t)$
- _Discrete signal_ $x[n + N] = x[n]$

The smallest $T$ or $N$ for which the equality holds is the _signal period_.

+++ {"slideshow": {"slide_type": "notes"}}

The sinusoidal signal we saw earlier is periodic because of the $\mod 2\pi$ property of cosines. The signal of the sinusoid has period 0.5 seconds (s), which turns out to be the reciprocal of the frequency $1/f_0$ Hz.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Square Wave

This code generates a square wave.

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
%% A Periodic signal (square wave)
t = linspace(0, 1, 500);
x = square(2 * pi * 5 * t);
```

+++ {"slideshow": {"slide_type": "notes"}}

This Square wave is a 5 Hz waveform sampled at 500 Hz for 1 second

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
plot(t, x);
ylim([-2, 2]);
grid
title('A Periodic Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
```

+++ {"slideshow": {"slide_type": "fragment"}}

What is the period $T$ in milliseconds?

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Launch poll 4**

+++ {"slideshow": {"slide_type": "notes"}}

Write your answer here

<pre style="border: 2px solid blue">




</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Aperiodic

Signals that are _deterministic_ (completely determined functions of time) but not periodic are known as _aperiodic_. Point of view matters. If a signal occurs infrequently, you may view it as aperiodic.

This is how we generate an aperiodic rectangular pulse of duration $\tau$ in MATLAB:

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
%% An aperiodic function
tau = 1;
x = linspace(-1,5,1000);
y = rectangularPulse(0,tau,x);
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
plot(x,y)
ylim([-0.2,1.2])
grid
title('An Aperiodic Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Random

A signal is random if one or more signal attributes takes on unpredictable
values in a probability sense.

Engineers working with communication receivers are concerned with random
signals, especially noise.

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
%% Plot a Random Signal
plot(0.5 + 0.25 * rand(100,1))
ylim([0,1])
grid
title('Random Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
```

+++ {"slideshow": {"slide_type": "slide"}}

## Domains for Signals and Systems

Most of the signals we encounter on a daily basis reside in the time domain. They’re functions of independent variable $t$ or $n$. But sometimes when you’re working with continuous-time signals, you may need to transform away from the time domain ($t$) to another domain.

+++ {"slideshow": {"slide_type": "subslide"}}

### Domain Quiz

A domain which is used in the analysis of signals and the design of systems is represented by complex numbers of the form:

$$\sigma + j\omega$$

**Without conferring**, tell me what domain is this?

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Lanch Poll 5**

+++ {"slideshow": {"slide_type": "subslide"}}

### Now discuss your answer with your peers

+++ {"slideshow": {"slide_type": "subslide"}}

### Domain Quiz with Peer Instruction

A domain which is used in the analysis of signals and the design of systems is represented by complex numbers of the form:

$$\sigma + j\omega$$

Tell me what domain is this?

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Launch Poll 5**

+++ {"slideshow": {"slide_type": "subslide"}}

### Other Domains you will encounter

The most commonly used domains used when analysing continuous time signals are the frequency domain ($f$ or $\omega$) and the Laplace $s$-domain ($s$).

Similarly, for discrete-time signals, you may need to transform from the discrete-time domain ($n$) to the frequency domain ($\hat{\omega}$) or the z-domain ($z$).

This section briefly introduces the world of signals and systems in the frequency, s-, and z-domains. More on these domains will follow.

+++ {"slideshow": {"slide_type": "notes"}}

Systems, continuous and discrete, can also be transformed to the frequency and s- and z-domains, respectively. Signals can, in fact, be passed through systems in these alternative domains. When a signal is passed through a system in the frequency domain, for example, the frequency domain output signal can later be returned to the time domain and appear just as if the time- domain version of the system operated on the signal in the time domain.

+++ {"slideshow": {"slide_type": "subslide"}}

Consider the sum of a two-sinusoids signal

$$x(t) = \underbrace {A_1\cos(2\pi f_1 t)}_{s_1} + \underbrace {A_2\cos(2\pi f_2 t)}_{s_2}$$

+++ {"slideshow": {"slide_type": "subslide"}, "tags": ["remove-output"]}

This can be coded as

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
open two_sines
```

+++ {"slideshow": {"slide_type": "subslide"}}

Run

```{code-cell}
---
slideshow:
  slide_type: fragment
---
two_sines
```

+++ {"slideshow": {"slide_type": "notes"}}

(Download [two_sines.m](https://cpjobling.github.io/eg-247-textbook/introduction/two_sines.m))

+++ {"slideshow": {"slide_type": "subslide"}}

### Polling Question

Which analysis method that you may have already encountered would turn the time response shown in this picture to the frequency spectrum shown in the bottom graph?

- Laplace transform
- Fourier analsysis
- Parseval's theorem
- Phasor analysis

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Launch Poll 6**

+++ {"slideshow": {"slide_type": "subslide"}}

## Wrap up

+++ {"slideshow": {"slide_type": "fragment"}}

What do you think of Slido so far? Please give a one word or short sentence answer.

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Launch Poll 7**

+++ {"slideshow": {"slide_type": "fragment"}}

**-> Stop recording**

+++ {"slideshow": {"slide_type": "notes"}}

### Answer to Exercise 2

For the waveform given, $f_0 = 2$ Hz so the sampling frequency is $f_s = 20\times 2 = 40$ Hz. The sampling period will be $t_s = 1/f_s = 1/40 = 0.025$ s [$25$ ms]. The waveform shown is 1 second so $N = 1/t_s = 40$.
