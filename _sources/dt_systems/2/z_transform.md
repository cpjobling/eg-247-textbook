---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.4
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

+++ {"slideshow": {"slide_type": "slide"}}

# Discrete-Time Systems and the Z-Transform

+++

## Colophon

* The source code for this page is [dt_systems/2/z_transform.ipynb](https://github.com/cpjobling/eg-247-textbook/blob/master/dt_systems/2/z_transform.ipynb).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/dt_systems/2/z_transform.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/dt_systems/2/z_transform.pdf) file.

+++ {"slideshow": {"slide_type": "slide"}}

## Scope and Background Reading

This session introduces the z-transform which is used in the analysis of discrete time systems. As for the Fourier and Laplace transforms, we present the definition, define the properties and give some applications of the use of the z-transform in the analysis of signals that are represented as sequences and systems represented by difference equations.

The material in this presentation and notes is based on [Chapter 9](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=329) of {cite}`karris` from the **Required Reading List**. Additional coverage is to be found in Chapter 13 of {cite}`boulet` from the **Recommended Reading List**.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

+++ {"slideshow": {"slide_type": "fragment"}}

* Introduction

+++ {"slideshow": {"slide_type": "fragment"}}

* The Z-Transform

+++ {"slideshow": {"slide_type": "fragment"}}

* Properties of the Z-Transform

+++ {"slideshow": {"slide_type": "fragment"}}

* Some Selected Z-Transforms

+++ {"slideshow": {"slide_type": "fragment"}}

* Relationship between Laplace and Z-Transform

+++ {"slideshow": {"slide_type": "fragment"}}

* Stability Regions

+++ {"slideshow": {"slide_type": "slide"}}

## Introduction

![CT to DT System](./pictures/ct-to-dt.png)

+++ {"slideshow": {"slide_type": "fragment"}}

In the remainder of this course we turn our attention to how we model and analyse the behaviour of the central block in this picture.

+++ {"slideshow": {"slide_type": "subslide"}}

### Nature of the signals

![Nature of the signals](./pictures/ct-to-dt-to-sequence.png)

+++ {"slideshow": {"slide_type": "notes"}}

The signals we process in discrete time systems are *sequences* of values $x[n]$ where $n$ is an index.

A sequence can be obtained in real-time, e.g. as the output of a ADC, or can be stored in digital memory; processed and re-stored; or processed and output in real-time, for example in digital music.

+++ {"slideshow": {"slide_type": "subslide"}}

### Nature of the systems

* The input to a discrete time system is a squence of values $x[n]$
* The output is also a sequence $y[n]$
* The block represents the operations that convert $x[n]$ into $y[n]$. 
* This processing takes the form of a *difference equation* 
* This is analogous to the representation of continuous-time operations by differential equations.

+++ {"slideshow": {"slide_type": "subslide"}}

### Transfer function model of a DT system

* In CT systems we use the Laplace transform to simplify the analysis of the *differential equations*
* In DT systems the z-Transform allows us to simplify the analysis of the *difference equations*
* In CT systems application of the Laplace transform allows us to represent systems as transfer functions and solve convolution problems by multiplication
* The z-transform provides [analogous](https://www.google.co.uk/search?q=define:analogous) tools for the analysis of DT systems.

+++ {"slideshow": {"slide_type": "slide"}}

## The Z-Transform

$$\mathcal{Z}\left\{f[n]\right\} = F(z) = \sum_{n=0}^{\infty} f[n]z^{-n}$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{Z}^{ - 1}\left\{ {F(z)} \right\} = f[n] = \frac{1}{2\pi j}\oint\limits_{} {F(z){z^{k - 1}}\,dz}$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Sampling and the Z-Transform

In the last lecture we showed that sampling could be represented as the multiplication of a CT signal by a periodic train of impulses:

$$x_s(t) = x(t)\sum_{n=0}^{\infty}\delta(t-nT_s)$$

+++ {"slideshow": {"slide_type": "subslide"}}

By the sampling property of $\delta(t)$

$$x_s(t) = \sum_{n=0}^{\infty}x(nT_s)\delta(t-nT_s)$$

+++ {"slideshow": {"slide_type": "subslide"}}

Using the Laplace transform pairs $\delta(t) \Leftrightarrow 1$ and $\delta(t-T) \Leftrightarrow e^{-sT}$ we obtain:

+++ {"slideshow": {"slide_type": "subslide"}}

$$X_s(s) = \mathcal{L}\left\{\sum_{n=0}^{\infty}x(nT_s)\delta(t-nT_s)\right\} = \sum_{n=0}^{\infty}x(nT_s)e^{-nsT_s}$$

+++ {"slideshow": {"slide_type": "fragment"}}

By substitution of $z = e^{sT_s}$ and representing samples $x(nT_s)$ as sequence $x[n]$:

$$X(z) = \sum_{n=0}^{\infty}x[n]z^{-n}$$

+++ {"slideshow": {"slide_type": "subslide"}}

## Properties of the z-Transform


| &nbsp; | Property | Discrete Time Domain | $\displaystyle{\mathcal{Z}}$ Transform |
|---|---------------|----------------------|----------------------------------------|
| 1 | Linearity | $\displaystyle{af_1[n]+bf_2[n]+\cdots}$ | $\displaystyle{aF_1(z)+bF_2(z)+\cdots}$ |
| 2 | Shift of $\displaystyle{x[n]u_0[n]}$ | $\displaystyle{f[n-m]u_0[n-m]}$ | $\displaystyle{z^{-m}F(z)}$ |
| 3 | Left shift | $\displaystyle{f[n-m]}$ | $\displaystyle{z^{-m}F(z)+\sum_{n=0}^{m-1}f[n-m]z^{-n}}$ |
| 4 | Right shift | $\displaystyle{f[n+m]}$ | $\displaystyle{z^{m}F(z)+\sum_{n=-m}^{-1}f[n+m]z^{-n}}$ |
| 5 | Multiplication by $\displaystyle{a^n}$ | $\displaystyle{a^nf[n]}$ | $\displaystyle{F\left(\frac{z}{a}\right)}$ |
| 6 | Multiplication by $\displaystyle{e^{-nsT_s}}$ | $\displaystyle{e^{-nsT_s}f[n]}$ | $\displaystyle{F\left(e^{sT_s}z\right)}$ |
| 7 | Multiplication by $\displaystyle{n}$ | $\displaystyle{nf[n]}$ | $\displaystyle{-z\frac{d}{dz}F(z)}$ |
| 8 | Multiplication by $\displaystyle{n^2}$ | $\displaystyle{n^2f[n]}$ | $\displaystyle{-z\frac{d}{dz}F(z)+z^2\frac{d^2}{dz^2}F(z)}$ |
| 9 | Summation in time | $\displaystyle{\sum_{m=0}^{n}f[m]}$ | $\displaystyle{\frac{z}{z-1}F(z)}$ |
| 10 | Time convolution | $\displaystyle{f_1[n]*f_2[n]}$ | $\displaystyle{F_1(z)F_2(z)}$ |
| 11 | Frequency convolution | $\displaystyle{f_1[n]f_2[n]}$ | $\displaystyle{\frac{1}{j2\pi }\oint {x{F_1}(v){F_2}\left( {\frac{z}{v}} \right)} {v^{ - 1}}dv}$ |
| 12 | Initial value theorem | $\displaystyle{f[0]=\lim_{z\to\infty}F(z)}$ | |
| 13 | Final value theorem| $\displaystyle{\lim_{n\to\infty}f[n]=\lim_{z\to 1}(z-1)F(z)}$ | |





For proofs refer to Section 9.2 of {cite}`karris`.

+++ {"slideshow": {"slide_type": "slide"}}

## Some Selected Common z-Transforms

### The Geometric Sequence

+++ {"slideshow": {"slide_type": "fragment"}}

$$f[n] = \left\{ {\begin{array}{*{20}{c}}
0&{n =  - 1, - 2, - 3, \ldots }\\
a^n&{n = 0,1,2,3, \ldots }
\end{array}} \right.$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$F(z) = \sum_{n=0}^{\infty}f[n]z^{-n} = \sum_{n=0}^{\infty}a^n z^{-n} = \sum_{n=0}^{\infty}\left(az^{-1}\right)^n$$

+++ {"slideshow": {"slide_type": "fragment"}}

After some analysis<sup>1</sup>, this can be shown to have a *closed-form* expression<sup>2</sup>

$$F(z) = \frac{1}{1-az^{-1}}=\frac{z}{z -a}$$

+++ {"slideshow": {"slide_type": "notes"}}

**Notes**

1. See Karris pp 9-12&mdash;9-13{cite}`karris` for the details.

2. This function converges only if 

   $\displaystyle{|z| < |a|}$ 
   
   and the region of convergence is outside the circle centred at $z=0$ with radius 
   
   $\displaystyle{r=|a|}$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Region of convergence

![Region of convergence](./pictures/roc.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### The Delta Sequence

+++ {"slideshow": {"slide_type": "fragment"}}

$$\delta [n] = \left\{ {\begin{array}{*{20}{c}}
1&{n = 0}\\
0&\mathrm{otherwise}
\end{array}} \right.$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{Z}\left\{\delta [n]\right\} = \Delta(z) = \sum_{n=0}^{\infty}\delta[n]z^{-n} = 1 + \sum_{n=1}^{\infty}0z^{-n} =1$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\delta [n] \Leftrightarrow 1$$

+++ {"slideshow": {"slide_type": "subslide"}}

### The Unit Step

$${u_0}[n] = {\rm{ }}\left\{ {\begin{array}{*{20}{c}}
0&{n < 0}\\
1&{n \ge 0}
\end{array}} \right.$$

![Unit step sequence](./pictures/unitstep.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### Z-Transform of Unit Step

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{Z}\left\{u_0 [n]\right\} U_0(z) = \sum_{n=0}^{\infty}u_0[n]z^{-n} =\sum_{n=0}^{\infty}z^{-n}$$

+++ {"slideshow": {"slide_type": "fragment"}}

This is a special case of the geometric sequence with $a = 1$ so

$$U_0(z) = \frac{1}{1-z^{-1}} = \frac{z}{z - 1}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Region of convergence is 

$$|z| > 1$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Exponential Decay Sequence

$$f[n] = e^{-naT_s}{u_0}[n]$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$F(z) = \sum_{n=0}^{\infty}e^{-nasT_s}z^{-n} =1+e^{-aT_s}z^{-1}+e^{-2aT_s}z^{-2}+e^{-a3T_s}z^{-3}+\cdots$$

+++ {"slideshow": {"slide_type": "fragment"}}

This is a geometric sequence with $a = e^{-aT_s}$, so

$$\mathcal{Z}\left\{e^{-naT_s}{u_0}[n]\right\} = \frac{1}{1-e^{-aT_s}z^{-1}} = \frac{z}{z-e^{-aT_s}}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Region of convergence is $$|e^{-aT_s}z^{-1}| < 1$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Ramp Function

$$f[n] = nu_0[n]$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{Z}\left\{nu_0[n]\right\}=\sum_{n=0}^{\infty} nz^{-n} = 0 + z^{-1}+2z^{-2}+3z^{-3}+\cdots$$

+++ {"slideshow": {"slide_type": "fragment"}}

We recognize this as a signal $u_0[n]$ multiplied by $n$ for which we have the property 
$$nf[n] \Leftrightarrow -z\frac{d}{dz}F(z)$$

+++ {"slideshow": {"slide_type": "fragment"}}

After applying the property and some manipulation, we arrive at:

$$nu_0[n] \Leftrightarrow \frac{z}{(z-1)^2}$$

+++ {"slideshow": {"slide_type": "subslide"}}

### z-Transform Tables

As usual, we can rely on this and similar analysis to have been tabulated for us and in practice we can rely on tables of transform pairs, such as this one.

| &nbsp; | f[n]                    | F(z).              | Region of Convergence |
|--------|----------------------------|--------------------|-------------------|
| 1.     |    $\displaystyle{\delta[n]}$ | $\displaystyle{1}$ |
| 2 | $\displaystyle{\delta[n-m]}$ | $\displaystyle{z^{-m}}$ |
| 3 | $\displaystyle{a^nu_0[n]}$ | $\displaystyle{\frac{z}{z-a}}$ | $\mid z \mid > a$ |
| 4 | $\displaystyle{u_0[n]}$ | $\displaystyle{\frac{z}{z-1}}$ | $\mid z \mid > 1$ |
| 5 | $\displaystyle{(e^{-anT_s})u_0[n]}$ | $\displaystyle{\frac{z}{z-e^{-aT_s}}}$ | $\displaystyle{\mid e^{-aT_s}z^{-1} \mid < 1}$ |
| 6 | $\displaystyle{(\cos naT_s)u_0[n]}$ | $\displaystyle{\frac{z^2 - z\cos aT_s}{z^2 -2z\cos aT_s + 1}}$ | ${ \mid z \mid> 1}$ |
| 7 | $\displaystyle{(\sin naT_s)u_0[n]}$ | $\displaystyle{\frac{z\sin aT_s}{z^2 -2z\cos aT_s + 1}}$ | ${\mid z \mid > 1}$ |
| 8 | $\displaystyle{(a^n\cos naT_s)u_0[n]}$ | $\displaystyle{\frac{z^2 - az\cos aT_s}{z^2 -2az\cos aT_s + a^2}}$ | ${\mid z \mid > 1}$ |
| 9 | $\displaystyle{(a^n\sin naT_s)u_0[n]}$ | $\displaystyle{\frac{az\sin aT_s}{z^2 -2az\cos aT_s + a^2}}$ | ${\mid z \mid > 1}$ |
| 10 | $\displaystyle{u_0[n]-u_0[n-m]}$ | $\displaystyle{\frac{z^m-1}{z^{m-1}(z-1)}}$ | |
| 11 | $\displaystyle{nu_0[n]}$ | $\displaystyle{\frac{z}{(z-1)^2}}$ | |
| 12 | $\displaystyle{n^2u_0[n]}$ | $\displaystyle{\frac{z(z+1)}{(z-1)^3}}$ | |
| 13 | $\displaystyle{[n+1]u_0[n]}$ | $\displaystyle{\frac{z^2}{(z-1)^2}}$ | |
| 14 | $\displaystyle{a^n n u_0[n]}$ | $\displaystyle{\frac{az}{(z-a)^2}}$ | |
| 15 | $\displaystyle{a^n n^2 u_0[n]}$ | $\displaystyle{\frac{az(z+a)}{(z-a)^3}}$ | |
| 16 | $\displaystyle{a^n n[n+1] u_0[n]}$ | $\displaystyle{\frac{2az^2}{(z-a)^3}}$ | |

+++ {"slideshow": {"slide_type": "slide"}}

## Relationship Between the Laplace and Z-Transform

+++ {"slideshow": {"slide_type": "fragment"}}

Given that we can represent a sampled signal in the complex frequency domain as the infinite sum of each sequence value delayed by an integer multiple of the sampling time:

$$F(s) = \sum_{n=0}^{\infty}f[n]e^{-nsT_s}$$

+++ {"slideshow": {"slide_type": "fragment"}}

And by definition, the z-transform of such a sequence is:

$$F(z) = \sum_{n=0}^{\infty}f[n]z^{-n}$$

+++ {"slideshow": {"slide_type": "subslide"}}

It follows that

$$z = e^{sT_s}$$

+++ {"slideshow": {"slide_type": "fragment"}}

And

$$s = \frac{1}{T_s}\ln z$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Mapping of s to z

Since $s$ and $z$ are both complex variables, $z=e^{sT_s}$ is a mapping from the $s$-domain to the $z$-domain and $z = \ln z/T_s$ is a mapping from the $z$ to $s$-domain.

+++ {"slideshow": {"slide_type": "fragment"}}

![Mapping of s to z](./pictures/mapping-s-to-z.png)

+++ {"slideshow": {"slide_type": "subslide"}}

Now, since

$$s = \sigma + j\omega$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$z = e^{\sigma T_s + j\omega T_s} = e^{\sigma T_s}e^{j\omega T_s} = |z|e^{j\theta}$$

+++ {"slideshow": {"slide_type": "fragment"}}

where 

$$|z| = e^{\sigma Ts}$$

and 

$$\theta = \omega T_s.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Introduction of sampling frequency

Now, since $T_s = 1/f_s$ then $\omega_s = 2\pi/f_s$ or $f_s = \omega_s/(2\pi)$ and $T_s = 2\pi/\omega_s$

+++ {"slideshow": {"slide_type": "fragment"}}

We let

$$\theta = \omega T_s = \omega\frac{2\pi}{\omega_s} = 2\pi\frac{\omega}{\omega_s}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Hence by substitution:

$$z = e^{\sigma t}e^{j2\pi\omega/\omega_s}$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Interpretation of the mapping s to z

* The quantity $e^{j2\pi\omega/\omega_s}$ defines a unit-circle in the $z$-plane centred at the origin. 

* And of course the term $\sigma$ represents the (stability) boundary between the left- and right-half planes of the $s$-plane.

* What are the consequences of this?

+++ {"slideshow": {"slide_type": "subslide"}}

#### Case I: $\sigma < 0$

* When $\sigma < 0$ we see that from 

  $$|z| = e^{\sigma T_s}$$ 
  
  that 
  
  $$|z| < 1$$

* The left-half plane of the $s$-domain maps into the unit circle in the $z$-plane.

* Different negative values of $\sigma$ map onto concentric circles with radius less than unity.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Case II: $\sigma > 0$

+++ {"slideshow": {"slide_type": "fragment"}}

* When $\sigma > 0$ we see that from 

  $$|z| = e^{\sigma T_s}$$
  
  that 
  
  $$|z| > 1$$


* The right-half plane of the $s$-domain maps outside the unit circle in the $z$-plane.

* Different positive values of $\sigma$ map onto concentric circles with radius greater than unity.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Case III: $\sigma = 0$

+++ {"slideshow": {"slide_type": "fragment"}}

* When $\sigma = 0$, 
 
   $$|z| = 1$$
  
  and 
  
  $$\theta = \frac{2\pi\omega}{\omega_s}$$
  
* All values of $\omega$ lie on the circumference of the unit circle.

+++ {"slideshow": {"slide_type": "subslide"}}

### Stability Region - s-Plane

![Stability Region - s-Plane](./pictures/s-plane.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### Stability Region - z-Plane

![Stability Region - z-Plane](./pictures/z-plane.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### Frequencies in the z-Domain

* As a consequence of the result for **Case III** above, we can explore how frequencies (that is is values of $s=\pm j\omega$) map onto the $z$-plane.

* We already know that these frequencies will map onto the unit circle and by $\theta = 2\pi\omega/\omega_s$ the angles are related to the sampling frequency.

* Let's see how

+++ {"slideshow": {"slide_type": "subslide"}}

### Mapping of multiples of sampling frequency

+++ {"slideshow": {"slide_type": "fragment"}}

| $\omega$ [radians/sec] | $\mid z\mid $ | $\theta$ [radians] |
|------------------------|-------|--------------------|
| 0 | 1 | 0 |
| $\omega_s/8$ | 1 | $\pi/4$ |
| $\omega_s/4$ | 1 | $\pi/2$ |
| $3\omega_s/8$ | 1 | $3\pi/4$ |
| $\omega_s/2$ | 1 | $\pi$ |
| $5\omega_s/8$ | 1 | $5\pi/4$ |
| $3\omega_s/4$ | 1 | $3\pi/2$ |
| $7\omega_s/8$ | 1 | $7\pi/4$ |
| $\omega_s$ | 1 | $2\pi$ |

+++ {"slideshow": {"slide_type": "subslide"}}

### Mapping of s-plane to z-plane

![Mapping of s-plane to z-plane](./pictures/s-to-z-mapping.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### Mapping z-plane to s-plane

There is no unique mapping of $z$ to $s$ since

$$s = \frac{1}{T_s} \ln z$$

but for a complex variable

$$\ln z = \ln z \pm j2n\pi$$

This is in agreement with the theoretical idea that in the frequency domain, sampling creates an infinite number of spectra, each of which is centred around $\pm n\omega_s$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Frequency aliasing

* It's worth observing that any stable complex pole in the $s$-plane $s=-\sigma + j\omega$ will have complex conjugate pair $s = -\sigma - j\omega$.
* Providing $\omega < \omega_s/2$ these poles will be mapped to the upper and lower half-plane of the $z$-plane respectively.
* If $\omega > \omega_s/2$, an upper-half plane pole will be mapped to the lower-half plane and will have an effective frequency of $\omega_s/2 - \omega$.
* Similarly, its conjugate pair will move into the upper-half plane. 

This is another way of looking at *aliasing*.

+++ {"slideshow": {"slide_type": "notes"}}

* Also, any poles with frequency $\omega > \omega_s$ will also be aliased back into into the unit circle.

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

* Introduction
* The Z-Transform
* Properties of the Z-Transform
* Some Selected Z-Transforms
* Relationship Between Laplace and Z-Transform
* Stability Regions

*Next session*

* The Inverse Z-Transform &ndash; an examples class

+++ {"slideshow": {"slide_type": "slide"}}

## Homework

+++ {"slideshow": {"slide_type": "fragment"}}

Problems 1 to 3 in **Section 9.10 Exercises** of {cite}`karris` explore the z-Transform

+++

## References

See [Bibliography](/zbib).
