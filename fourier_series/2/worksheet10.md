---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.12
    jupytext_version: 1.9.1
kernelspec:
  display_name: MATLAB
  language: matlab
  name: imatlab
---

+++ {"slideshow": {"slide_type": "slide"}}

# Worksheet 10

## To accompany Chapter 4.2 Exponential Fourier Series

+++ {"slideshow": {"slide_type": "subslide"}}

## Colophon

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet10.pdf). We will step through this worksheet in class. 

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 10** in the **Week 5: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 


You are expected to have at least watched the video presentation of [Chapter 4.2](https://cpjobling.github.io/eg-247-textbook/fourier_series/2/exp_fs1) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!


After class, the lecture recording and the annotated version of the worksheets will be made available through Canvas.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

* Exponents and Euler's Equation
* The Exponential Fourier series
* Symmetry in Exponential Fourier Series
* Example

+++ {"slideshow": {"slide_type": "slide"}}

## The Exponential Function $e^{at}$

* You should already be familiar with $e^{at}$ because it appears in the solution of differential equations. 
* It is also a function that appears in the definition of the Laplace and Inverse Laplace Transform.
* It pops up again and again in tables and properies of the Laplace Transform. 

+++ {"slideshow": {"slide_type": "subslide"}}

### Case when a is real.

When $a$ is real the function $e^{at}$ will take one of the two forms illustrated below:

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
clear all
cd ../matlab
imatlab_export_fig('print-svg')  % Static svg figures.
format compact
```

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
%% The decaying exponential
t=linspace(-1,2,1000);
figure
plot(t,exp(t),t,exp(0.*t),t,exp(-t))
axis([-1,2,-1,8])
title('exp(at) -- a real')
xlabel('t (s)')
ylabel('exp(t) and exp(-t)')
legend('exp(t)','exp(0)','exp(-t)')
grid
hold off
```

+++ {"slideshow": {"slide_type": "notes"}}

You can regenerate this image generated with this Matlab script: [expon.m](https://cpjobling.github.io/eg-247-textbook/fourier_series/matlab/expon.m).

+++ {"slideshow": {"slide_type": "subslide"}}

* When $a < 0$ the response is a decaying exponential (red line in plot)
* When $a = 0$ $e^{at} = 1$ -- essentially a model of DC
* When $a > 0$ the response is an *unbounded* increasing exponential (blue line in plot)

+++ {"slideshow": {"slide_type": "subslide"}}

### Case when a is imaginary


<img src="pictures/euler.png" title="exp(j*omega*t) = cos(omega*t) + j*sin(omega*t)">

+++ {"slideshow": {"slide_type": "notes"}}

This is the case that helps us simplify the computation of sinusoidal Fourier series.

It was [Leonhard Euler](https://en.wikipedia.org/wiki/Leonhard_Euler) who discovered the [formula](https://en.wikipedia.org/wiki/Euler%27s_formula) visualized above.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Some important values of $\omega t$

These are useful when simplifying expressions that result from integrating functions that involve the imaginary exponential

Give the following:
* $e^{j\omega t}$ when $\omega t = 0$
* $e^{j\omega t}$ when $\omega t = \pi/2$
* $e^{j\omega t}$ when $\omega t = \pi$
* $e^{j\omega t}$ when $\omega t = 3\pi/2$
* $e^{j\omega t}$ when $\omega t = 2\pi$

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Case where $a$ is complex

We shall not say much about this case except to note that the Laplace transform equation includes such a number. The variable $s$ in the Laplace Transform 

$$\int_{0}^{\infty} f(t)e^{-st} dt$$

is a *complex exponential*.

The consequences of a complex $s$ have particular significance in the development of system stability theories and in control systems analysis and design. Look out for them in EG-243.

+++ {"slideshow": {"slide_type": "subslide"}}

### Two Other Important Properties

By use of trig. identities, it is relatively straight forward to show that:

$$\cos \omega t = \frac{e^{j\omega t} + e^{-j\omega t}}{2}$$

and 

$$\sin \omega t = \frac{e^{j\omega t} - e^{-j\omega t}}{j2}$$

+++ {"slideshow": {"slide_type": "notes"}}

We can use this result to convert the *Trigonometric Fourier Series* into an *Exponential Fourier Series* which has only one integral term to solve per harmonic.

+++ {"slideshow": {"slide_type": "subslide"}}

## The Exponential Fourier Series

$$f(t) = \cdots + C_{-2}e^{-j2\Omega_0 t} + C_{-1}e^{-j\Omega_0 t} + C_0 + C_{1}e^{j\Omega_0 t} + C_{2}e^{j2\Omega_0 t} +\cdots $$

or more compactly

$$f(t) = \sum_{k=-n}^{n}C_{k}e^{jk \Omega_0  t}$$

+++ {"slideshow": {"slide_type": "notes"}}

**Important**

The $C_k$ coefficents, except for $C_0$ are *complex* and appear in conjugate pairs so

$$C_{-k} = C_k^*$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Evaluation of the complex coefficients

The coefficients are obtained from the following expressions<sup>*</sup>:

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi}f(\Omega_0 t)e^{-jk(\Omega_0 t)}\,d(\Omega_0 t)$$

or

$$C_k = \frac{1}{T}\int_{0}^{T}f(t)e^{-jk\Omega_0 t}\,dt$$

+++ {"slideshow": {"slide_type": "slide"}}

## Symmetry in Exponential Fourier Series

Since the coefficients of the Exponential Fourier Series are complex numbers, we can use symmetry to determine the form of the coefficients and thereby simplify the computation of series for wave forms that have symmetry.

+++ {"slideshow": {"slide_type": "subslide"}}

### Even Functions

For even functions, all coefficients $C_k$ are real.

+++ {"slideshow": {"slide_type": "subslide"}}

### Odd Functions

For odd functions, all coefficients $C_k$ are imaginary.

By a similar argument, all odd functions have no cosine terms so the $a_k$ coefficients are 0. Therefore both $C_{-k}$ and $C_k$ are imaginary.

+++ {"slideshow": {"slide_type": "subslide"}}

### Half-wave symmetry

If there is *half-wave symmetry*, $C_k = 0$ for $k$ even.

+++ {"slideshow": {"slide_type": "subslide"}}

### No symmetry

If there is no symmetry the Exponential Fourier Series of $f(t)$ is complex.

+++ {"slideshow": {"slide_type": "subslide"}}

### Relation of $C_{-k}$ to $C_{k}$

$C_{-k} = C_{k}^*$ **always**

+++ {"slideshow": {"slide_type": "slide"}}

## Example 1

Compute the Exponential Fourier Series for the square wave shown below assuming that $\omega = 1$

<img src="pictures/sqw.png"> 

+++ {"slideshow": {"slide_type": "subslide"}}

### Some questions for you

* Square wave is an [**odd/even/neither**] function?
* DC component is [**zero/non-zero**]?
* Square wave [**has/does not have**] half-wave symmetry?

+++ {"slideshow": {"slide_type": "subslide"}}

Hence

* $C_0 = $[**?**]
* Coefficients $C_k$ are [**real/imaginary/complex**]?
* Subscripts $k$ are [**odd only/even only/both odd and even**]?
* What is the integral that needs to be solved for $C_k$?

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "notes"}}

### Solution

$$\frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk(\Omega_0 t)}\, d(\Omega_0 t) + \int_{\pi}^{2\pi} (-A)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t)\right] = \frac{1}{2\pi}\left[\left.\frac{A}{-jk}e^{-jk(\Omega_0 t)}\right|_0^\pi+\left.\frac{-A}{-jk}e^{-jk(\Omega_0 t)}\right|_\pi^{2\pi}\right]$$

$$ = \frac{1}{2\pi}\left[\frac{A}{-jk}\left(e^{-jk\pi} - 1\right)+\frac{A}{jk}\left(e^{-j2k \pi}-e^{-jk\pi}\right)\right] =
\frac{A}{2j\pi k}\left(1 - e^{-jk\pi}+ e^{-j2k \pi}-e^{-jk\pi}\right)$$

$$\frac{A}{2j\pi k}\left(e^{-j2k \pi} - 2e^{-jk\pi} -1 \right) = \frac{A}{2j\pi k}\left(e^{-jk\pi}-1\right)^2$$

For $n$ odd*, $e^{-jk\pi} = -1$. Therefore

$${C_n \atop {k=\mathrm{odd}}} = \frac{A}{2j\pi k}\left(e^{-jk\pi}-1\right)^2 = \frac{A}{2j\pi k}\left(-1-1\right)^2 = \frac{A}{2j\pi k}\left(-2\right)^2 = \frac{2A}{j\pi k}$$

+++ {"slideshow": {"slide_type": "notes"}}

<sup>*</sup> You may want to verify that $C_0 = 0$ and 

$${C_k \atop {k=\mathrm{even}}} = 0.$$

+++ {"slideshow": {"slide_type": "subslide"}}

## Computing coefficients of Exponential Fourier Series in Matlab 

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 2

Verify the result of Example 1 using MATLAB.

+++ {"slideshow": {"slide_type": "fragment"}}

### Solution

Solution: See [efs_sqw.m](https://cpjobling.github.io/eg-247-textbook/fourier_series/matlab/efs_sqw.m). 

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
open efs_sqw
```

+++ {"slideshow": {"slide_type": "subslide"}}

### EFS_SQW
Calculates the Exponential Fourier for a Square Wave with Odd Symmetry.

+++ {"slideshow": {"slide_type": "subslide"}}

Set up parameters

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
syms t A;

tau = 1;
T0 = 2*pi; % w = 2*pi*f -> t = 2*pi/omega
k_vec = [-5:5];
```

+++ {"slideshow": {"slide_type": "subslide"}}

Define f(t)

**IMPORTANT**: the signal definition must cover [0 to T0]

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
xt = A*(heaviside(t)-heaviside(t-T0/2)) - A*(heaviside(t-T0/2)-heaviside(t-T0));
```

+++ {"slideshow": {"slide_type": "subslide"}}

Compute EFS

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
[X, w] = FourierSeries(xt, T0, k_vec)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot the numerical results from Matlab calculation.

Convert symbolic to numeric result

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
Xw = subs(X,A,1);
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
subplot(211)
stem(w,abs(Xw), 'o-');
title('Exponential Fourier Series for Square Waveform with Odd Symmetry')
xlabel('Hamonic frequencies: k\Omega_0 (rad/sec)');
ylabel('|c_k|');
subplot(212)
stem(w,angle(Xw), 'o-');
xlabel('Hamonic frequencies: k\Omega_0 (rad/sec)'); 
ylabel('\angle c_k [radians]');
```

## Computing Trig. Fourier Series from Exp. Fourier Series

Refer to the [notes](exp_fs1).

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

* Exponents and Euler's Equation
* The exponential Fourier series
* Symmetry in Exponential Fourier Series
* Example

+++ {"slideshow": {"slide_type": "notes"}}

## Answers to in-class problems

+++ {"slideshow": {"slide_type": "notes"}}

### Some important values of $\omega t$ - Solution

* When $\omega t = 0$: $e^{j\omega t} = e^{j0} = 1$
* When $\omega t = \pi/2$: $e^{j\omega t} = e^{j\pi/2} = j$
* When $\omega t = \pi$: $e^{j\omega t} = e^{j\pi} = -1$
* When $\omega t = 3\pi/2$: $e^{j\omega t} = e^{j3\pi/2} = -j$
* When $\omega t = 2\pi$: $e^{j\omega t} = e^{j2\pi} e^{j0}= 1$

It is also worth being aware that $n\omega t$, when $n$ is an integer, produces rotations that often map back to the simpler cases given above. For example see $e^{j2\pi}$ above.

+++ {"slideshow": {"slide_type": "notes"}}

### Some answers for you

* Square wave is an **odd** function!
* DC component is **zero**!
* Square wave **has** half-wave symmetry!

Hence

* $C_0 = 0$
* Coefficients $C_k$ are **imaginary**!
* Subscripts $k$ are **odd only**!
* What is the integral that needs to be solved for $C_k$?

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi} f(\Omega_0 t)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t) = \frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk(\Omega_0 t)}\, d(\Omega_0 t) + \int_{\pi}^{2\pi} (-A)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t)\right]$$
