---
jupytext:
  formats: ipynb,md:myst
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

# Unit 1: Introducing Digital Signal Processing

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

An annotatable copy of the notes for this presentation is available as [**Worksheet 1**](worksheet1).

- The [Jupytext](https://jupytext.readthedocs.io/en/latest/index.html) source code for this page is [introduction/index.md](https://github.com/cpjobling/eg-247-textbook/blob/master/introduction/index.md).

- You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/introduction/index.html)).

- This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/introduction/introduction.pdf) file.

+++ {"slideshow": {"slide_type": "slide"}}

## Signals and Systems for Dummies

Signals and Systems for Dummies (**SS4D**) {cite}`ss4d` provides a useful introduction to the topics that will be covered in this module and it is in the [Reading List](https://eu.alma.exlibrisgroup.com/leganto/readinglist/searchlists/27328240030002417) as a _recommended text_. I have based this presentation on Chapter 1 which is available as a [downloadable PDF](https://www.dummies.com/store/product/Signals-and-Systems-For-Dummies.productCd-111847581X.html) from the publishers.

You should read Chapter 1 of SS4D in conjunction with the notes for this presentation.

+++ {"slideshow": {"slide_type": "notes"}}

Note that Signals and Systems for Dummies is available as an e-book from the [University Library](https://whel-primo.hosted.exlibrisgroup.com/primo_library/libweb/action/dlDisplay.do?vid=44WHELF_SWA_VU1&search_scope=LSCOP_44WHELF_SWA_ALMA_DS&docId=44WHELF_SWA_ALMA_DS5177422270002417&fn=permalink).

+++ {"slideshow": {"slide_type": "slide"}}

## Topics

- [Continuous-time Signals](ctsignals)
- [Continuous-time Systems](ctsystems)
- [Discrete-time Signals](dtsignals)
- [Discrete-time Systems](dtsystems)
- [Signal Classifications](sigclass)
- [Domains for Signals](domains)
- [Systems Thinking and Systems Design](systems_thinking)

+++ {"slideshow": {"slide_type": "slide"}}

(ctsignals)=

## Continuous-time signals

Continuous signals are represented mathematically by functions which vary continuously with time.

+++ {"slideshow": {"slide_type": "subslide"}}

Sinusoidal signals (e.g. AC) are pretty fundamental in electrical engineering. The mathematical model of a sinusoidal signal is:

$$x(t) = A \cos (2\pi f_0 t - \phi).$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Exercise

#### First attempt

For this expression, we wish to match each of the symbols to its definition.

Without computing anything, see if you can complete this table.

| Symbol     | Definition         |
| ---------- | ------------------ |
| $A$        | Phase in radians   |
| $f_0$      | Frequency in Hz    |
| $\phi$     | Amplitude          |
| $2\pi f_0$ | Frequency in rad/s |

+++ {"slideshow": {"slide_type": "subslide"}}

### Gaining insight using computers

To help us answer these questions, let's use our Mathematical tools to plot a signal like this and explore it. The example we will use is from _Signals and Systems for Dummies_ (SS4D: page 12):

$$3\cos(2\pi\cdot 2t - 3\pi/4)$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Wolfram Alpha

Here's the link: <https://www.wolframalpha.com>

Paste this into the search box

    plot 3 cos(2 pi 2 t - 3 pi/4)

Try changing the numbers to gain insight.

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB

In MATLAB we would need to tackle this by breaking down the steps.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
%Make sure that we have a clean workspace
clear all
format compact; setappdata(0, "MKernel_plot_format", 'svg')
```

+++ {"slideshow": {"slide_type": "subslide"}}

Define `t`

```{code-cell}
---
slideshow:
  slide_type: fragment
---
t = linspace(0, 1, 100);
```

+++ {"slideshow": {"slide_type": "fragment"}}

Define `x`

```{code-cell}
---
slideshow:
  slide_type: subslide
---
x = 3 * cos(2*pi*2*t - 3*pi/4);
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot result and label plot

```{code-cell}
---
slideshow:
  slide_type: subslide
---
plot(t,x)
title('A Sinusoidal Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
grid
```

+++ {"slideshow": {"slide_type": "notes"}}

If you want to execute this in MATLAB, you can create a file by copying this text into an `m-file`:

```{code-cell}
---
slideshow:
  slide_type: notes
---
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

```{code-cell}
---
slideshow:
  slide_type: notes
---
edit sinewave
```

+++ {"slideshow": {"slide_type": "notes"}}

To run this script, just type the filename without the .m extension.

```{code-cell}
---
slideshow:
  slide_type: notes
---
sinewave
```

+++ {"slideshow": {"slide_type": "notes"}}

(Download [sinewave.m](https://cpjobling.github.io/eg-247-textbook/introduction/sinewave.m))

To run this script, just type the filename without the `.m` extension. Try adjusting the values of the numerical constants and see what insights you gain.

+++ {"slideshow": {"slide_type": "subslide"}}

### Returning to the Question

Sinusoidal signals (e.g. AC) are pretty fundamental in electrical engineering. The mathematical model of a sinusoidal signal is:

$$x(t) = A \cos (2\pi f_0 t - \phi).$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Exercise -- second go after gaining insight from your computer

Using the insight just gained by exploring this function with a computer, match each of the symbols to its definition again.

| Symbol     | Definition         |
| ---------- | ------------------ |
| $A$        | Phase in radians   |
| $f_0$      | Frequency in Hz    |
| $\phi$     | Amplitude          |
| $2\pi f_0$ | Frequency in rad/s |

+++ {"slideshow": {"slide_type": "subslide"}}

Did you get different answers?

+++ {"slideshow": {"slide_type": "subslide"}}

### Supplementary question

What is the period of the waveform in seconds?

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

(ctsystems)=

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

![Simulink model of a Continuous system](./pictures/css.png)

+++ {"slideshow": {"slide_type": "notes"}}

The Similink code can be downloaded from this file [gain_level_shift.slx](https://cpjobling.github.io/eg-247-textbook/introduction/gain_level_shift.slx).

+++ {"slideshow": {"slide_type": "slide"}}

(dtsignals)=

## Discrete-time Signals

Discrete-time signals are a function of a time index $n$. A discrete-time signal $x[n]$, unlike a continuous-time signal $x(t)$, is only defined at integer values of the independent variable $n$. This means that the signal is only active at specific periods of time. Discrete-time signals can be stored in computer memory.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 2

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

We can plot this in MATLAB as a _stem plot_

+++ {"slideshow": {"slide_type": "subslide"}}

#### Procedure

Define function using this text:

```{code-cell}
---
slideshow:
  slide_type: subslide
---
edit y
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
%% Define sample points
n = -15:18;
%% Make space for the signal
xn = zeros(size(n));
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
%% Define sample points
n = -15:18;
%% Make space for the signal
xn = zeros(size(n));

%% Compute the signal x[n]
for i = 1:length(xn)
    xn(i) = y(n(i));
end
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
%% Plot the result
stem(n,xn)
axis([-15, 18, 0, 6])
title('Stem Plot for a Discrete Signal')
xlabel('Sample n')
ylabel('Signal x[n]')
grid
```

+++ {"slideshow": {"slide_type": "slide"}}

(dt_systems)=

## Discrete-time Systems

A discrete-time system, like its continuous-time counterpart, is a function, $H\{\}$, that maps the input $x[n]$￼ ￼to the output $y[n] = H\{x[n]\}$. An example of a discrete-time system is the _two-tap_ filter:

$$y[n] = H\{x[n]\} = \frac{3}{4}x[n] + \frac{1}{4}x[n-1]$$

+++ {"slideshow": {"slide_type": "subslide"}}

The term _tap_ denotes that output at time instant $n$ is formed from two time instants of the input, $n$ and $n – 1$. Check out a block diagram of a two-tap filter system:

![Simulink model of a discrete-time system](pictures/ds.png)

This system is available as a Simulink model [discrete_system.slx](https://cpjobling.github.io/eg-247-textbook/introduction/discrete_system.slx)

+++ {"slideshow": {"slide_type": "notes"}}

In words, this system scales the present input by 3/4 and adds it to the past value of the input scaled by 1/4. The notion of the past input comes about because $x[n - 1]$ is lagging one sample value behind $x[n]$. The term _filter_ describes the output as an _averaging_ of the present input and the previous input. _Averaging_ is a form of filtering.

+++ {"slideshow": {"slide_type": "slide"}}

(sigclass)=

## Signal Classifications

+++ {"slideshow": {"slide_type": "subslide"}}

### Periodic

Signals that repeat over and over are said to be _periodic_. In mathematical terms, a signal is periodic if:

- _Continuous signal_ $x(t + T) = x(t)$
- _Discrete signal_ $x[n + N] = x[n]$

The smallest $T$ or $N$ for which the equality holds is the _signal period_.

+++ {"slideshow": {"slide_type": "notes"}}

The sinusoidal signal we saw earlier is periodic because of the $\mod 2\pi$ property of cosines. The signal of the sinusoid has a period 0.5 seconds (s), which turns out to be the reciprocal of the frequency $1/f_0$ Hz.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Square Wave

This code generates a square wave.

```{code-cell}
---
slideshow:
  slide_type: subslide
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
---
plot(t, x);
ylim([-2, 2]);
grid()
title('A Periodic Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
```

+++ {"slideshow": {"slide_type": "fragment"}}

What is the period $T$ in milliseconds?

+++ {"slideshow": {"slide_type": "subslide"}}

### Aperiodic

Signals that are _deterministic_ (completely determined functions of time) but not periodic are known as _aperiodic_. Point of view matters. If a signal occurs infrequently, you may view it as aperiodic.

This is how we generate an aperiodic rectangular pulse of duration $\tau$ in Matlab:

```{code-cell}
---
slideshow:
  slide_type: subslide
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

(domains)=

## Domains for Signals and Systems

Most of the signals we encounter on a daily basis reside in the time domain. They’re functions of independent variable $t$ or $n$. But sometimes when you’re working with continuous-time signals, you may need to transform away from the time domain ($t$) to another domain.

+++ {"slideshow": {"slide_type": "subslide"}}

### Other Domains you will encounter

The most commonly used domains used when analyzing continuous-time signals are the frequency domain ($f$ or $\omega$) and the Laplace $s$-domain ($s$).

Similarly, for discrete-time signals, you may need to transform from the discrete-time domain ($n$) to the frequency domain ($\hat{\omega}$) or the z-domain ($z$).

This section briefly introduces the world of signals and systems in the frequency, s-, and z-domains. More on these domains will follow.

+++ {"slideshow": {"slide_type": "notes"}}

Systems, continuous and discrete, can also be transformed to the frequency and s- and z-domains, respectively. Signals can, in fact, be passed through systems in these alternative domains. When a signal is passed through a system in the frequency domain, for example, the frequency domain output signal can later be returned to the time domain and appear just as if the time-domain version of the system operated on the signal in the time domain.

+++ {"slideshow": {"slide_type": "subslide"}}

Consider the sum of a two-sinusoids signal

$$x(t) = \underbrace {A_1\cos(2\pi f_1 t)}_{s_1} + \underbrace {A_2\cos(2\pi f_2 t)}_{s_2}$$

+++ {"slideshow": {"slide_type": "notes"}}

This can be coded as

```{code-cell}
---
slideshow:
  slide_type: notes
---
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

```{code-cell}
---
slideshow:
  slide_type: subslide
---
edit two_sines
```

Run

```{code-cell}
two_sines
```

+++ {"slideshow": {"slide_type": "notes"}}

(Download [two_sines.m](https://cpjobling.github.io/eg-247-textbook/introduction/two_sines.m))

+++ {"slideshow": {"slide_type": "notes"}}

### Viewing Signals in the Frequency Domain

The top waveform plot, denoted $s_1$, is a single sinusoid at frequency $f_1$ and peak amplitude $A_1$. The waveform repeats every period $T_1 = 1/f_1$. The second waveform plot, denoted $s_2$, is a single sinusoid at frequency $f_2 > f_1$ and peak amplitude $A_2 < A_1$. The sum signal, $s_1 + s_2$, in the time domain is a squiggly line (third waveform plot), but the amplitudes and frequencies (periods) of the sinusoids aren’t as clear here as they are in the first two plots. The frequency spectrum (bottom plot) reveals that $x(t)$ is composed of just two sinusoids, with both the frequencies and amplitudes discernible.

Think about tuning in a radio station. Stations are located at different center frequencies. The stations don’t interfere with one another because they’re separated from each other in the frequency domain. In the frequency spectrum plot, imagine that $f_1$ and $f_2$ are the signals from two radio stations, viewed in the frequency domain. You can design a receiving system to filter $s_1$ from $s_1 + s_2$. The filter is designed to pass $s_1$ and block $s_2$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Fourier Transform

We use the _Fourier transform_ to move away from the time domain and into the frequency domain. To get back to the time domain, use the _inverse Fourier transform_. We will find out more about these transforms in this module.

+++ {"slideshow": {"slide_type": "subslide"}}

### Laplace and Z-Transform Domains

From the time domain to the frequency domain, only one independent variable, $t \to f$, exists. When a signal is transformed to the s-domain, it becomes a function of a complex variable $s=\sigma + j\omega$. The two variables (real and imaginary parts) describe a location in the s-plane.

In addition to visualization properties, the s-domain reduces differential equation solving to algebraic manipulation. For discrete-time signals, the z-transform accomplishes the same thing, except differential equations are replaced by difference equations.

+++ {"slideshow": {"slide_type": "slide"}}

(systems_thinking)=

## Systems Thinking and Systems Design

See section **Testing Product Concepts with Behavioral Level Modeling** from Chapter 1 of [SS4D](https://www.dummies.com/store/product/Signals-and-Systems-For-Dummies.productCd-111847581X.html) ({cite}`ss4d` pages 18--20) and add some notes to summarize this for yourself.

- We will use _behavioural modelling_
- We will rely on _abstraction_
- We work _top-down_
- We make use of _mathematics_ and _mathematical software_.

+++ {"slideshow": {"slide_type": "slide"}}

## Familiar Signals and Systems

See pages 21-23 of the free sample ([Chapter 1](https://www.dummies.com/store/product/Signals-and-Systems-For-Dummies.productCd-111847581X.html)) of {cite}`ss4d` for notes and details.

+++ {"slideshow": {"slide_type": "notes"}}

## Reference

```{bibliography}
:filter: docname in docnames
```
