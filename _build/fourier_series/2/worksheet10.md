---
redirect_from:
  - "/fourier-series/2/worksheet10"
interact_link: content/fourier_series/2/worksheet10.ipynb
title: 'Worksheet 10 Exponential Fourier Series'
prev_page:
  url: /fourier_series/1/worksheet9
  title: 'Worksheet 9 Trigonometric Fourier Series'
next_page:
  url: /fourier_series/3/worksheet11
  title: 'Worksheet 11 Line Spectra and their Applications'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 10

## To accompany Chapter 4.2 Exponential Fourier Series

We will step through this worksheet in class. 

You are expected to have at least watched the video presentation of [Chapter 4.2](https://cpjobling.github.io/eg-247-textbook/fourier_series/2/exp_fs1) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

## Agenda

* Exponents and Euler's Equation
* The Exponential Fourier series
* Symmetry in Exponential Fourier Series
* Example

## The Exponential Function $e^{at}$

* You should already be familiar with $e^{at}$ because it appears in the solution of differential equations. 
* It is also a function that appears in the definition of the Laplace and Inverse Laplace Transform.
* It pops up again and again in tables and properies of the Laplace Transform. 

### Case when a is real.

When $a$ is real the function $e^{at}$ will take one of the two forms illustrated below:



{:.input_area}
```matlab
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


You can regenerate this image generated with this Matlab script: [expon.m](expon.m).

* When $a < 0$ the response is a decaying exponential (red line in plot)
* When $a = 0$ $e^{at} = 1$ -- essentially a model of DC
* When $a > 0$ the response is an *unbounded* increasing exponential (blue line in plot)

### Case when a is imaginary


<img src="pictures/euler.png" title="exp(j*omega*t) = cos(omega*t) + j*sin(omega*t)">

This is the case that helps us simplify the computation of sinusoidal Fourier series.

It was [Leonhard Euler](http://en.wikipedia.org/wiki/Leonhard_Euler) who discovered the [formula](http://en.wikipedia.org/wiki/Euler%27s_formula) visualized above.


#### Some important values of $\omega t$

These are useful when simplifying expressions that result from integrating functions that involve the imaginary exponential

Give the following:
* $e^{j\omega t}$ when $\omega t = 0$
* $e^{j\omega t}$ when $\omega t = \pi/2$
* $e^{j\omega t}$ when $\omega t = \pi$
* $e^{j\omega t}$ when $\omega t = 3\pi/2$
* $e^{j\omega t}$ when $\omega t = 2\pi$


<pre style="border: 2px solid blue">















</pre>

### Case where $a$ is complex

We shall not say much about this case except to note that the Laplace transform equation includes such a number. The variable $s$ in the Laplace Transform 

$$\int_{0}^{\infty} f(t)e^{-st} dt$$

is a *complex exponential*.

The consequences of a complex $s$ have particular significance in the development of system stability theories and in control systems analysis and design. Look out for them in EG-243.

### Two Other Important Properties

By use of trig. identities, it is relatively straight forward to show that:

$$\cos \omega t = \frac{e^{j\omega t} + e^{-j\omega t}}{2}$$

and 

$$\sin \omega t = \frac{e^{j\omega t} - e^{-j\omega t}}{j2}$$

We can use this result to convert the *Trigonometric Fourier Series* into an *Exponential Fourier Series* which has only one integral term to solve per harmonic.

## The Exponential Fourier Series

$$f(t) = \cdots + C_{-2}e^{-j2\Omega_0 t} + C_{-1}e^{-j\Omega_0 t} + C_0 + C_{1}e^{j\Omega_0 t} + C_{2}e^{j2\Omega_0 t} +\cdots $$

or more compactly

$$f(t) = \sum_{k=-n}^{n}C_{k}e^{-jk \Omega_0  t}$$

**Important**

The $C_k$ coefficents, except for $C_0$ are *complex* and appear in conjugate pairs so

$$C_{-k} = C_k^*$$

### Evaluation of the complex coefficients

The coefficients are obtained from the following expressions<sup>*</sup>:

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi}f(\Omega_0 t)e^{-jk(\Omega_0 t)}\,d(\Omega_0 t)$$

or

$$C_k = \frac{1}{T}\int_{0}^{T}f(t)e^{-jk\Omega_0 t}\,dt$$

## Symmetry in Exponential Fourier Series

Since the coefficients of the Exponential Fourier Series are complex numbers, we can use symmetry to determine the form of the coefficients and thereby simplify the computation of series for wave forms that have symmetry.

### Even Functions

For even functions, all coefficients $C_k$ are real.

### Odd Functions

For odd functions, all coefficients $C_k$ are imaginary.

By a similar argument, all odd functions have no cosine terms so the $a_k$ coefficients are 0. Therefore both $C_{-k}$ and $C_k$ are imaginary.


### Half-wave symmetry

If there is *half-wave symmetry*, $C_k = 0$ for $k$ even.

### No symmetry

If there is no symmetry the Exponential Fourier Series of $f(t)$ is complex.

### Relation of $C_{-k}$ to $C_{k}$

$C_{-k} = C_{k}^*$ **always**

## Example 1

Compute the Exponential Fourier Series for the square wave shown below assuming that $\omega = 1$

<img src="pictures/sqw.png"> 

#### Some questions for you

* Square wave is an [**odd/even/neither**] function?
* DC component is [**zero/non-zero**]?
* Square wave [**has/does not have**] half-wave symmetry?

Hence

* $C_0 = $[**?**]
* Coefficients $C_k$ are [**real/imaginary/complex**]?
* Subscripts $k$ are [**odd only/even only/both odd and even**]?
* What is the integral that needs to be solved for $C_k$?

<pre style="border: 2px solid blue">















</pre>

#### Solution

$$\frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk(\Omega_0 t)}\, d(\Omega_0 t) + \int_{\pi}^{2\pi} (-A)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t)\right] = \frac{1}{2\pi}\left[\left.\frac{A}{-jk}e^{-jk(\Omega_0 t)}\right|_0^\pi+\left.\frac{-A}{-jk}e^{-jk(\Omega_0 t)}\right|_\pi^{2\pi}\right]$$

$$ = \frac{1}{2\pi}\left[\frac{A}{-jk}\left(e^{-jk\pi} - 1\right)+\frac{A}{jk}\left(e^{-j2k \pi}-e^{-jk\pi}\right)\right] =
\frac{A}{2j\pi k}\left(1 - e^{-jk\pi}+ e^{-j2k \pi}-e^{-jk\pi}\right)$$

$$\frac{A}{2j\pi k}\left(e^{-j2k \pi} - 2e^{-jk\pi} -1 \right) = \frac{A}{2j\pi k}\left(e^{-jk\pi}-1\right)^2$$

For $n$ odd*, $e^{-jk\pi} = -1$. Therefore

$${C_n \atop {n=\mathrm{odd}}} = \frac{A}{2j\pi k}\left(e^{-jk\pi}-1\right)^2 = \frac{A}{2j\pi k}\left(-1-1\right)^2 = \frac{A}{2j\pi k}\left(-2\right)^2 = \frac{2A}{j\pi k}$$

<sup>*</sup> You may want to verify that $C_0 = 0$ and 

$${C_n \atop {n=\mathrm{even}}} = 0.$$


## Computing coefficients of Exponential Fourier Series in Matlab

### Example 2

Verify the result of Example 1 using MATLAB.

### Solution

Solution: See [efs_sqw.m](efs_sqw.m). 

### EFS_SQW
Calculates the Exponential Fourier for a Square Wave with Odd Symmetry.



{:.input_area}
```matlab
clear all
format compact
```


Set up parameters



{:.input_area}
```matlab
syms t A;

tau = 1;
T0 = 2*pi; % w = 2*pi*f -> t = 2*pi/omega
k_vec = [-5:5];
```


Define f(t)

**IMPORTANT**: the signal definition must cover [0 to T0]



{:.input_area}
```matlab
xt = A*(heaviside(t)-heaviside(t-T0/2)) - A*(heaviside(t-T0/2)-heaviside(t-T0));
```


Compute EFS



{:.input_area}
```matlab
[X, w] = FourierSeries(xt, T0, k_vec)
```


Plot the numerical results from Matlab calculation.

Convert symbolic to numeric result



{:.input_area}
```matlab
Xw = subs(X,A,1);
```


Plot



{:.input_area}
```matlab
subplot(211)
stem(w,abs(Xw), 'o-');
title('Exponential Fourier Series for Square Waveform with Odd Symmetry')
xlabel('\Omega_0 (rad/sec)');
ylabel('|c_k|');
subplot(212)
stem(w,angle(Xw), 'o-');
xlabel('\Omega_0 (rad/sec)'); 
ylabel('\angle c_k [radians]');
```


## Computing Trig. Fourier Series from Exp. Fourier Series

Refer to the [notes](exp_fs1).

## Summary

* Exponents and Euler's Equation
* The exponential Fourier series
* Symmetry in Exponential Fourier Series
* Example

## Answers to in-class problems

### Some important values of $\omega t$ - Solution

* When $\omega t = 0$: $e^{j\omega t} = e^{j0} = 1$
* When $\omega t = \pi/2$: $e^{j\omega t} = e^{j\pi/2} = j$
* When $\omega t = \pi$: $e^{j\omega t} = e^{j\pi} = -1$
* When $\omega t = 3\pi/2$: $e^{j\omega t} = e^{j3\pi/2} = -j$
* When $\omega t = 2\pi$: $e^{j\omega t} = e^{j2\pi} e^{j0}= 1$

It is also worth being aware that $n\omega t$, when $n$ is an integer, produces rotations that often map back to the simpler cases given above. For example see $e^{j2\pi}$ above.


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
