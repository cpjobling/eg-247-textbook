---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.6
kernelspec:
  display_name: MKernel
  language: matlab
  name: mkernel
---

+++ {"slideshow": {"slide_type": "slide"}}

(exp_fs1)=

# Unit 3.2: Exponential Fourier Series

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

An annotatable worksheet for this presentation is available as {ref}`ws3`.

- The source code for this page is [fourier_series/2/exp_fs1.md](https://github.com/cpjobling/eg-247-textbook/blob/master/fourier_series/2/exp_fs1.md).

- You can view the notes for this presentation as a webpage ({ref}`exp_fs1`).

- This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/fourier_series/2/exp_fs1.pdf) file.

+++ {"slideshow": {"slide_type": "notes"}}

This section builds on our study of {ref}`trig_fseries`.

Trigonometric Fourier series uses integration of a periodic signal multiplied by sines and cosines at the fundamental and harmonic frequencies. If performed by hand, this can a painstaking process. Even with the simplifications made possible by exploiting waveform symmetries, there is still a need to integrate cosine and sine terms, be aware of and able to exploit the trigonometrc identities, and the properties of _orthogonal functions_ before we can arrive at the simplified solutions. This is why I concentrated on the properties and left the computation to a computer.

However, by exploiting the exponential function $e^{at}$, we can derive a method for calculating the coefficients of the harmonics that is much easier to calculate by hand and converted into an algorithm that can be executed by computer.

The result is called the _Exponential Fourier Series_.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

- Exponents and Euler's Equation
- The Exponential Fourier series
- Symmetry in Exponential Fourier Series
- Example

+++ {"slideshow": {"slide_type": "slide"}}

## The Exponential Function $e^{at}$

- You should already be familiar with $e^{at}$ because it appears in the solution of differential equations.
- It is also a function that appears in the definition of the Laplace and Inverse Laplace Transform.
- It pops up again and again in tables and properies of the Laplace Transform.

+++ {"slideshow": {"slide_type": "subslide"}}

### Case when a is real.

When $a$ is real the function $e^{at}$ will take one of the two forms illustrated below:

```{code-cell}
---
slideshow:
  slide_type: subslide
---
clear all
setappdata(0, "MKernel_plot_format", 'svg')
```

```{code-cell}
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

- When $a < 0$ the response is a decaying exponential (red line in plot)
- When $a = 0$ $e^{at} = 1$ -- essentially a model of DC
- When $a > 0$ the response is an _unbounded_ increasing exponential (blue line in plot)

+++ {"slideshow": {"slide_type": "subslide"}}

### Case when a is imaginary

<img src="pictures/euler.png" title="exp(j*omega*t) = cos(omega*t) + j*sin(omega*t)">

+++ {"slideshow": {"slide_type": "notes"}}

This is the case that helps us to simplify the computation of sinusoidal Fourier series.

It was [Leonhard Euler](https://en.wikipedia.org/wiki/Leonhard_Euler) who discovered the [formula](https://en.wikipedia.org/wiki/Euler%27s_formula) visualized above.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Some important values of $\omega t$

These are useful when simplifying expressions that result from integrating functions that involve the imaginary exponential

Give the following:

- $e^{j\omega t}$ when $\omega t = 0$
- $e^{j\omega t}$ when $\omega t = \pi/2$
- $e^{j\omega t}$ when $\omega t = \pi$
- $e^{j\omega t}$ when $\omega t = 3\pi/2$
- $e^{j\omega t}$ when $\omega t = 2\pi$

+++ {"slideshow": {"slide_type": "subslide"}}

### Case where $a$ is complex

We shall not say much about this case except to note that the Laplace transform equation includes such a number. The variable $s$ in the Laplace Transform

$$\int_{0}^{\infty} f(t)e^{-st} dt$$

is a _complex exponential_.

+++ {"slideshow": {"slide_type": "notes"}}

The consequences of a complex $s$ have particular significance in the development of system stability theories and in control systems analysis and design. Look out for them in EG-243.

+++ {"slideshow": {"slide_type": "subslide"}}

### Two Other Important Properties

By use of trig. identities, it is relatively straight forward to show that:

+++ {"slideshow": {"slide_type": "fragment"}}

$$\cos \omega t = \frac{e^{j\omega t} + e^{-j\omega t}}{2}$$

+++ {"slideshow": {"slide_type": "fragment"}}

and

$$\sin \omega t = \frac{e^{j\omega t} - e^{-j\omega t}}{j2}$$

+++ {"slideshow": {"slide_type": "notes"}}

We can use this result to convert the _Trigonometric Fourier Series_ into an _Exponential Fourier Series_ which has only one integral term to solve per harmonic.

+++ {"slideshow": {"slide_type": "slide"}}

## The Exponential Fourier Series

As [as stated in the notes on the Trigonometric Fourier Series](../1/trig_fseries) any periodic waveform $f(t)$ can be represented as

$$
\begin{gathered}
  f(t) = \frac{1}{2}{a_0} + {a_1}\cos \Omega_0 t + {a_2}\cos 2\Omega_0 t +  \cdots  \\
   + {b_1}\sin \Omega_0 t + {b_2}\sin 2\Omega_0 t +  \cdots  \\
\end{gathered}
$$

+++ {"slideshow": {"slide_type": "subslide"}}

Let us replace the $\cos$ and $\sin$ terms with their imaginary exponential equivalents:

$$
\begin{gathered}
  f(t) = \frac{1}{2}{a_0} + {a_1}\left(\frac{e^{j\Omega_0 t} + e^{-j\Omega_0 t}}{2}\right) + {a_2}\left(\frac{e^{j2\Omega_0 t} + e^{-j2\Omega_0 t}}{2}\right) +  \cdots  \\
   + {b_1}\left(\frac{e^{j\Omega_0 t} - e^{-j\Omega_0 t}}{j2}\right) + {b_2}\left(\frac{e^{j2\Omega_0 t} - e^{-j2\Omega_0 t}}{j2}\right) +  \cdots  \\
\end{gathered}
$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Grouping terms with same exponents

$$f(t) = \cdots + \left(\frac{a_2}{2}-\frac{b_2}{j2}\right)e^{-j2\Omega_0 t} + \left(\frac{a_1}{2}-\frac{b_1}{j2}\right)e^{-j\Omega_0 t} + \frac{1}{2}{a_0} + \left(\frac{a_1}{2}+\frac{b_1}{j2}\right)e^{j\Omega_0 t} + \left(\frac{a_2}{2}+\frac{b_2}{j2}\right)e^{j2\Omega_0 t} +\cdots $$

+++ {"slideshow": {"slide_type": "subslide"}}

### New coefficients

The terms in parentheses are usually denoted as

$$C_{-k} = \frac{1}{2}\left(a_k-\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k+j b_k\right)$$

$$C_{k} = \frac{1}{2}\left(a_k+\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k-j b_k\right)$$

$$C_0 = \frac{1}{2}a_0$$

+++ {"slideshow": {"slide_type": "subslide"}}

The Exponential Fourier Series is

$$f(t) = \cdots + C_{-2}e^{-j2\Omega_0 t} + C_{-1}e^{-j\Omega_0 t} + C_0 + C_{1}e^{j\Omega_0 t} + C_{2}e^{j2\Omega_0 t} +\cdots $$

or more compactly

$$f(t) = \sum_{k=-n}^{n}C_{k}e^{jk \Omega_0  t}$$

+++ {"slideshow": {"slide_type": "notes"}}

**Important**

The $C_k$ coefficents, except for $C_0$ are _complex_ and appear in conjugate pairs so

$$C_{-k} = C_k^*$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Evaluation of the complex coefficients

The coefficients are obtained from the following expressions:

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi}f(\Omega_0 t)e^{-jk(\Omega_0 t)}\,d(\Omega_0 t) = \frac{1}{2\pi}\int_{0}^{2\pi}f(\theta)e^{-jk\theta}\,d\theta$$

or

$$C_k = \frac{1}{T}\int_{0}^{T}f(t)e^{-jk\Omega_0 t}\,dt$$

+++ {"slideshow": {"slide_type": "notes"}}

These are much easier to derive and compute than the equivalent Trigonemetric Fourier Series coefficients[^footnt].

[^footnt]: The analysis that leads to this result is provided between pages [7-31 and 7-32](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?ppg=243&docID=44853&tm=1518704101461) of the text book {cite}`karris`. It is not a difficult proof, but we are more interested in the result.

+++ {"slideshow": {"slide_type": "subslide"}}

### Trigonometric Fourier Series from Exponential Fourier Series

By substituting $C_{-k}$ and $C_{k}$ back into the original expansion

$$C_k+C_{-k} = \frac{1}{2}\left(a_k-jb_k + a_k+jb_k\right)$$

so

$$a_k = C_k + C_{-k}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Similarly

$$C_k-C_{-k} = \frac{1}{2}\left(a_k-jb_k - a_k-jb_k\right)$$

so

$$b_k = j\left(C_k - C_{-k}\right)$$

Thus, we can easily go back to the trigonometric Fourier series if we need to.

+++ {"slideshow": {"slide_type": "slide"}}

## Symmetry in exponential Fourier series

Since the coefficients of the exponential Fourier series are complex numbers, we can use symmetry to determine the form of the coefficients and thereby simplify the computation of series for wave forms that have symmetry.

+++ {"slideshow": {"slide_type": "subslide"}}

### Even Functions

For even functions, all the coefficients $C_k$ are real.

+++ {"slideshow": {"slide_type": "notes"}}

**Proof**

Recall

$$C_{-k} = \frac{1}{2}\left(a_k-\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k+jb_k\right)$$

and

$$C_k = \frac{1}{2}\left(a_k+\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k-jb_k\right)$$

From knowledge of the trig. fourier series, even functions have no sine terms so the $b_k$ coefficients are 0. Therefore both $C_{-k}$ and $C_k$ are real.

+++ {"slideshow": {"slide_type": "subslide"}}

### Odd Functions

For odd functions, all coefficients $C_k$ are imaginary.

+++ {"slideshow": {"slide_type": "subslide"}}

By a similar argument, all odd functions have no cosine terms so the $a_k$ coefficients are 0. Therefore both $C_{-k}$ and $C_k$ are imaginary.

+++ {"slideshow": {"slide_type": "subslide"}}

### Half-wave symmetry

If there is _half-wave symmetry_, $C_k = 0$ for $k$ even.

+++ {"slideshow": {"slide_type": "notes"}}

**Proof**

From trigonometric Fourier series, if there is half-wave symmetry, all even harnonics are zero, thus both $a_k$ and $b_k$ are zero for $k$ even. Hence $C_{-k}$ and $C_k$ are also zero when $k$ is even.

+++ {"slideshow": {"slide_type": "subslide"}}

### No symmetry

If there is no symmetry the exponential Fourier series of $f(t)$ is complex.

+++ {"slideshow": {"slide_type": "subslide"}}

### Relation of $C_{-k}$ to $C_{k}$

$C_{-k} = C_{k}^*$ **always**

+++ {"slideshow": {"slide_type": "subslide"}}

## Example 1

Compute the Exponential Fourier Series for the square wave shown below assuming that $\omega = 1$

<img src="pictures/sqw.png">

+++ {"slideshow": {"slide_type": "subslide"}}

### Will be solved by hand in Class

+++ {"slideshow": {"slide_type": "notes"}}

#### Some questions for you

- Square wave is an [**odd/even/neither**] function?
- DC component is [**zero/non-zero**]?
- Square wave [**has/does not have**] half-wave symmetry?

+++ {"slideshow": {"slide_type": "notes"}}

Hence

- $C_0 = $[**?**]
- Coefficients $C_k$ are [**real/imaginary/complex**]?
- Subscripts $k$ are [**odd only/even only/both odd and even**]?
- What is the integral that needs to be solved for $C_k$?

+++ {"slideshow": {"slide_type": "notes"}}

#### Solution to example 1

The integral is

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi} f(\Omega_0 t)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t) = \frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk(\Omega_0 t)}\, d(\Omega_0 t) + \int_{\pi}^{2\pi} (-A)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t)\right]$$

For simplicity let $\theta = \Omega_0t$.

$$\frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk\theta}\, d\theta + \int_{\pi}^{2\pi} (-A)e^{-jk\theta}\, d\theta\right] = \frac{1}{2\pi}\left[\left.\frac{A}{-jk}e^{-jk\theta}\right|_0^\pi+\left.\frac{-A}{-jk}e^{-jk\theta}\right|_\pi^{2\pi}\right]$$

$$
= \frac{1}{2\pi}\left[\frac{A}{-jk}\left(e^{-jk\pi} - 1\right)+\frac{A}{jk}\left(e^{-j2k \pi}-e^{-jk\pi}\right)\right] =
\frac{A}{2j\pi k}\left(1 - e^{-jk\pi}+ e^{-j2k \pi}-e^{-jk\pi}\right)
$$

$$\frac{A}{2j\pi k}\left(e^{-j2k \pi} - 2e^{-jk\pi} -1 \right) = \frac{A}{2j\pi k}\left(e^{-jk\pi}-1\right)^2$$

For $n$ odd[^fn2], $e^{-jk\pi} = -1$. Therefore

$${C_k \atop {k=\mathrm{odd}}} = \frac{A}{2j\pi k}\left(e^{-jk\pi}-1\right)^2 = \frac{A}{2j\pi k}\left(-1-1\right)^2 = \frac{A}{2j\pi k}\left(-2\right)^2 = \frac{2A}{j\pi k}$$

+++ {"slideshow": {"slide_type": "notes"}}

[^fn2]: You may wish to verify that $C_0 = 0$ and

$${C_k \atop {k=\mathrm{even}}} = 0.$$

+++ {"slideshow": {"slide_type": "notes"}}

## Exponential Fourier series for the square wave with odd symmetry

From the definition of the exponential Fourier series

$$f(t) = \cdots + C_{-2}e^{-j2\Omega_0 t} + C_{-1}e^{-j\Omega_0 t} + C_{0} + C_{1}e^{j\Omega_0 t} + C_{2}e^{j2\Omega_0 t} + \cdots$$

the _exponential Fourier series for the square wave with odd symmetry_ is

$$f(t) = \frac{2A}{j\pi}\left(\cdots - \frac{1}{3}e^{-j3\Omega_0 t} - e^{-j\Omega_0 t} + e^{j\Omega_0 t} + \frac{1}{3}e^{j3\Omega_0 t} + \cdots\right) = \frac{2A}{j\pi}\sum_{k = \mathrm{odd}} \frac{1}{k}e^{jk\Omega_0 t}$$

+++ {"slideshow": {"slide_type": "notes"}}

Note the sign change in first two terms. This is due to the fact that $C_{-k} = C_k^*$.

E.g. since $C_3 = 2A/j3\pi$, $C_{-3} = C_3^* = -2A/j3\pi$

+++ {"slideshow": {"slide_type": "notes"}}

## Trig. Fourier series from exponential Fourier series

Since

$$f(t) = \frac{2A}{j\pi}\left(\cdots - \frac{1}{3}e^{-j3\Omega_0 t} - e^{-j\Omega_0 t} + e^{j\Omega_0 t} + \frac{1}{3}e^{j3\Omega_0 t} + \cdots\right) $$

gathering terms at each harmonic frequency gives

$$
\begin{eqnarray*}
f(t) &=& \frac{4A}{\pi}\left(\cdots + \left(\frac{e^{j\Omega_0 t} - e^{-j\Omega_0 t}}{2j}\right)  + \frac{1}{3}\left(\frac{e^{j3\Omega_0 t} - e^{-j3\Omega_0 t}}{2j}\right)  +  \cdots\right) \\
&=& \frac{4A}{\pi}\left(\sin \Omega_0 t + \frac{1}{3}\sin 3\Omega_0 t + \cdots\right)\\
&=& \frac{4A}{\pi} \sum_{k=\mathrm{odd}} \frac{1}{k}\sin k\Omega_0 t.\end{eqnarray*}
$$

+++ {"slideshow": {"slide_type": "subslide"}}

(fs2:matlab)=

## Computing coefficients of Exponential Fourier Series in MATLAB

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 2

Verify the result of Example 1 using MATLAB.

+++ {"slideshow": {"slide_type": "notes"}}

### Solution to example 2

Solution: See [efs_sqw.m](https://cpjobling.github.io/eg-247-textbook/fourier_series/matlab/efs_sqw.m).

+++ {"slideshow": {"slide_type": "subslide"}}

### EFS_SQW

Calculates the Exponential Fourier for a Square Wave with Odd Symmetry.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
cd ../matlab
format compact; 
setappdata(0, "MKernel_plot_format", 'svg')
```

+++ {"slideshow": {"slide_type": "subslide"}}

Set up parameters

```{code-cell}
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

```{code-cell}
---
slideshow:
  slide_type: subslide
---
xt = A*(heaviside(t)-heaviside(t-T0/2)) - A*(heaviside(t-T0/2)-heaviside(t-T0));
```

+++ {"slideshow": {"slide_type": "subslide"}}

Compute EFS

```{code-cell}
---
slideshow:
  slide_type: subslide
---
[X, w] = FourierSeries(xt, T0, k_vec)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot the numerical results from MATLAB calculation.

Convert symbolic to numeric result

```{code-cell}
---
slideshow:
  slide_type: subslide
---
Xw = subs(X,A,1);
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot

```{code-cell}
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

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

- Exponents and Euler's Equation
- The exponential Fourier series
- Symmetry in Exponential Fourier Series
- Example

+++ {"slideshow": {"slide_type": "notes"}}

## Answers to in-class problems

+++ {"slideshow": {"slide_type": "notes"}}

### Some important values of $\omega t$ - Solution

- When $\omega t = 0$: $e^{j\omega t} = e^{j0} = 1$
- When $\omega t = \pi/2$: $e^{j\omega t} = e^{j\pi/2} = j$
- When $\omega t = \pi$: $e^{j\omega t} = e^{j\pi} = -1$
- When $\omega t = 3\pi/2$: $e^{j\omega t} = e^{j3\pi/2} = -j$
- When $\omega t = 2\pi$: $e^{j\omega t} = e^{j2\pi} = e^{j0}= 1$

It is also worth being aware that $n\omega t$, when $n$ is an integer, produces rotations that map back to the simpler cases given above. For example see $e^{j2\pi}$ above.

+++ {"slideshow": {"slide_type": "notes"}}

### Some answers for you

- Square wave is an **odd** function!
- DC component is **zero**!
- Square wave **has** half-wave symmetry!

Hence

- $C_0 = 0$
- Coefficients $C_k$ are **imaginary**!
- Subscripts $k$ are **odd only**!
- What is the integral that needs to be solved for $C_k$?

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi} f(\Omega_0 t)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t) = \frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk(\Omega_0 t)}\, d(\Omega_0 t) + \int_{\pi}^{2\pi} (-A)e^{-jk(\Omega_0 t)}\, d(\Omega_0 t)\right]$$
