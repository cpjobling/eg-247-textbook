---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.15.2
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

(unit7.1)=
# Unit 7.1: Designing Digital Filters

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

An annotatable worksheet for this presentation is available as [**Worksheet 14**](worksheet14).

* The source code for this page is [digital_filters/1/filters.md](https://github.com/cpjobling/eg-247-textbook/blob/master/digital_filters/1/filters.md).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/digital_filters/filters.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/digital_filters/filters.pdf) file.

+++ {"slideshow": {"slide_type": "notes"}}

## Scope and Background Reading

We introduced the idea of filters in {ref}`ft4` and examined in some detail the idea of an ideal low-pass filter and an approximation to the ideal filter known and the *Butterworth* filter. We also showed how a high-pass filter, stop-band filter and and pass-band filter could be implemented by simple manipulations of the frequency response (or transfer functions) of a low-pass filter. 

An advantage of the Butterworth filter is that it has a flat response in the pass band, a consistent attenuation of -3 dB at the cut-off frequency, and a steady roll-off in the stop band. A disadvantage is that you need a high-order filter to get a fast transition between the pass-band and the stop-band.

In {ref}`demo`, we showed how an analogue 2nd-order Butterworth filter could be translated into a discrete-time (DT) system using the MATLAB function `c2d`, and we demonstrated the architecture and code that might be used to implement the digital filter.

In this unit we will explore further some of the concepts of what is called *filter design by analogue prototype*. This Unit is based on Chapter 11 of {cite}`karris`. We will illustrate the concepts using MATLAB and Simulink as appropriate on the understanding that you should be able to manually design a digital filter from a 2nd-order analogue proptotype.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

* {ref}`unit7.1:introduction`
* {ref}`unit7.1:afp`

+++ {"slideshow": {"slide_type": "slide"}}

(unit7.1:introduction)=
## Introduction

**Analogue filters** are defined in continuous range of frequencies. They are classified as *low-pass*, *high-pass*, *band-pass* and *band-elimination* (*stop-band*) filters.

+++ {"slideshow": {"slide_type": "fragment"}}

The ideal mangnitude characteristics of each are illustrated in {numref}`fig:7.1:mag_chars`

+++ {"slideshow": {"slide_type": "subslide"}}

:::{figure-md} fig:7.1:mag_chars
<img src="pictures/mag_chars.png" alt="illustration of the magnitude characteristics of ideal filters" width="100%" />

Magnitude characteristics of ideal filters (reproduced from Figure 11.1 {cite}`karris`).
:::

+++ {"slideshow": {"slide_type": "notes"}}

As we saw in {ref}`ft4:ideal_lp_filter`, filters with ideal characteristics are not physically realizable (they are not *causal* systems). Instead we design practical filters that approximate these characteristics.

+++ {"slideshow": {"slide_type": "subslide"}}

A **digital filter**, in general, is a computational process, or algorithm, that converts one sequence of numbers representing the input signal into another sequence of numbers representing the output signal.

Analogue filter functions have been used extensively as prototype models for designing digital filters, and that is the approach we will present here.

+++ {"slideshow": {"slide_type": "notes"}}

```{note}
In Section 11.2 of {cite:t}`karris` examples of analogue low-pass and high-pass filters made from RC circuits and band-pass and stop band filters made from RLC circuits are given. We will pass over these as our interest is in digital filters, and in any case, filters made from passive components are only practical in a limited range of applications. Instead, we will look at the idea of analogue filter porotypes.
```

+++ {"slideshow": {"slide_type": "subslide"}}

(unit7.1:afp)=
## Low-pass analogue filter prototypes

In this section, we will use the analogue low-pass filter as a basis. Using transformations, we can derive high-pass and other types of filter from the low-pass filter.

We will discuss the *Butterworth*, *Chebyshev Type I*, *Chebyshev Type II* and *Elliptic* filters.

As through MATLAB and the Signal Processing Toolbox, we have access to sophisticated design tools, we will gloss over some of the mathematical details. If you are interested in such detail, please refer to Section 11.3 and following sections of {cite}`karris`.

+++ {"slideshow": {"slide_type": "notes"}}

```{note}
From the point of view of assessment, you are only required to be able to recognise the filter types presented here and their key properties. Although you can design a filter of virtually any order, we will limit ourselves to second-order filters and provide the actual transfer function coefficients that you need to be able to convert the analogue filter into a digital filter using the *bilinear transform*. If you need access to the filter formulae, you will be given them in the question.
```

+++ {"slideshow": {"slide_type": "subslide"}}

(unit7.1:msf)=
### Magnitude-square function

To facilitate the design of filters we use a so-called *magnitude-squared function*[^u71:note1] $A^2(\omega)$, and from it derive a $G(s)$ function such that

$$A^2(\omega) = \left.G(s).G(-s)\right|_{s = j\omega}$$ (eq:7.1:1)

+++ {"slideshow": {"slide_type": "notes"}}

[^u71:note1]: This avoids having to deal with complex magnitudes which use the square-root operator.

+++ {"slideshow": {"slide_type": "subslide"}}

Since $(j\omega)^* = (-j\omega)$, the square of a complex number can be expressed as that complex number and its complex conjugate. Thus, if the magnitude is $A$, then

$$A^2(\omega) = \left|G(j\omega)\right| = G(j\omega)G^*(j\omega) = G(j\omega).G(-j\omega)$$ (eq:7.1:2)

+++ {"slideshow": {"slide_type": "subslide"}}

Now, $G(j\omega)$ can be considered as $G(s)$ evaluated at $s = j\omega$, and this {eq}`eq:7.1:1` is justified.

Also, since $A$ is understood to represent the magnitude, it does not need to be enclosed in vertical lines.

+++ {"slideshow": {"slide_type": "notes"}}

Not all magnitude-square functions can be decomposed to $G(s)$ and $G(-s)$ rational functions; only even functions of $\omega$, positive for all $\omega$, and *proper-rational functions*[^u71:note2] can satisfy {eq}`eq:7.1:1`.

+++ {"slideshow": {"slide_type": "notes"}}

[^u71:note2]: A rational function is said to be *proper* if the largest power in the denominator is equal to or larger than that of the numerator.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Example 1

It is known that

$$G(s) = \frac{3s^2 + 5s + 7}{s^2 + 4s + 6} $$

Compute $A^2(\omega)$.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution

Since 

$$G(s) = \frac{3s^2 + 5s + 7}{s^2 + 4s + 6} $$

+++ {"slideshow": {"slide_type": "fragment"}}

it follows that

$$G(-s) = \frac{3s^2 - 5s + 7}{s^2 - 4s + 6} $$

+++ {"slideshow": {"slide_type": "subslide"}}

and

$$G(s).G(-s) = \frac{3s^2 + 5s + 7}{s^2 + 4s + 6}.\frac{3s^2 - 5s + 7}{s^2 - 4s + 6} = \frac{9s^4 + 17s^2 + 49}{s^4 - 4s^2 + 36}  $$

+++ {"slideshow": {"slide_type": "fragment"}}

Therefore

$$A^2(\omega) = \left.\frac{9s^4 + 17s^2 + 49}{s^4 - 4s^s + 36}\right|_{s = j\omega} = \frac{9\omega^4 - 17\omega^2 + 49}{\omega^4 + 4\omega^2 + 36}$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### General form of magnitude-square function

The general form of magnitude-square function $A^2(\omega)$ is

$$A^2(\omega) = \frac{C\left(b_k\omega^{2k}+b_{k-1}\omega^{2k-2}+\cdots+ b_0\right)}{a_k\omega^{2k}+a_{k-1}\omega^{2k-2}+\cdots+ a_0} $$ (eq:7.1:3)

+++ {"slideshow": {"slide_type": "notes"}}

where $C$ is the DC gain, $a$ and $b$ are constant coefficients, and $k$ is a positive integer denoting the order of the filter.

+++ {"slideshow": {"slide_type": "subslide"}}

Once the magnitude-square function $A^2(\omega)$ is known, we can derive $G(s)$ from {eq}`eq:7.1:1` with the substitution $\left(j\omega\right)^2 = -\omega^2 = - s^2$, 

+++ {"slideshow": {"slide_type": "fragment"}}

that is

$$G(s).G(-s) = \left. A^2(\omega)\right|_{\omega^2 = -s^2}$$ (eq:7.1:4)

+++ {"slideshow": {"slide_type": "subslide"}}

#### Analysis of magnitude-square filter

In the simplest low-pass filter, the DC gain of the magnitude-square function is unity. In this case {eq}`eq:7.1:3` reduces to

$$A^2(\omega) = \frac{b_0}{a_k\omega^{2k}+a_{k-1}\omega^{2k-2}+\cdots+ a_0} $$ (eq:7.1:5)

+++ {"slideshow": {"slide_type": "fragment"}}

and at high frequencies (i.e. in the stop-band) can be approximated as

$$A^2(\omega) = \frac{b_0/a_k}{\omega^{2k}} $$ (eq:7.1:6)

+++ {"slideshow": {"slide_type": "fragment"}}

The *attenuation rate* of this approximation is $20k$ dB/decade.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Example 2

Given the magnitude-square function

$$A^2(\omega) = \frac{16\left(-\omega^2 + 1\right)}{\left(\omega^2+4\right)\left(\omega^2+ 9\right)}$$ (eq:7.1:7)

derive a suitable transfer function $G(s)$.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution

From relation {eq}`eq:7.1:4`

$$G(s).G(-s) = \left. A^2(\omega)\right|_{\omega^2 = -s^2} = \frac{16\left(s^2 + 1\right)}{\left(-s^2 + 4\right)\left(-s^2 + 9\right)} $$ (eq:7.1:8)

+++ {"slideshow": {"slide_type": "fragment"}}

This function has zeros at $s = \pm j$, and poles at $s = \pm 2$ and $s = \pm 3$.

+++ {"slideshow": {"slide_type": "subslide"}}

There is no restriction on the zeros, but for stability[^u71:note3], we select the left-half $s$-plane poles.

+++ {"slideshow": {"slide_type": "notes"}}

[^u71:note3]: A system is said to be stable if a finite input produces a finite output. Alternatively, a system is stable if its impulse response $h(t)$ vanishes after a sufficiently long time. For linear time-invariant systems, a system will be stable *only if* all the real-parts of the poles have negative sign. That is, they lie in the left-half of the $s$-plane.

+++ {"slideshow": {"slide_type": "fragment"}}

Let 

$$G(s) = \frac{K\left(s^2 + 1\right)}{\left(s + 2\right)\left(s+3\right)} $$ (eq:7.1:9)

+++ {"slideshow": {"slide_type": "subslide"}}

We must find $K$ such that $G(0) = A(0)$. From {eq}`eq:7.1:7`

$$A^2(0) = 16/36 = 4/9$$

or 

$$A(0) = 2/3$$

+++ {"slideshow": {"slide_type": "subslide"}}

From {eq}`eq:7.1:9`,

$$G(0) = K/6$$

and for $G(0) = A(0)$ we must have,

$$K/6 = 2/3$$

or

$$K = 12/3 = 4$$

+++ {"slideshow": {"slide_type": "subslide"}}

By subsitution into {eq}`eq:7.1:9`, we obtain

$$G(s) = \frac{4\left(s^2 + 1\right)}{\left(s + 2\right)\left(s+3\right)} $$

+++ {"slideshow": {"slide_type": "subslide"}}

(unit7.1:butter)=
### Butterworth Analogue Low-Pass Filter Design

Consider the *Butterworth low-pass filter*[^u71:note5] whose magnitude-squared function is

$$A^2(\omega) = \frac{1}{\left(\omega/\omega_c\right)^{2k}+1} $$ (eq:7.1:10)

where $k$ is a positive integer, and $\omega_c$ is the cutoff (-3 dB) frequency.

+++ {"slideshow": {"slide_type": "notes"}}

[^u71:note5]: The frequency response of the Butterworth filter is *maximally flat* (has no ripples) in the passband, and rolls off towards zero in the stopband. When viewed on a logarithmic Bode plot, the response slopes off linearly at a rate of $-20k$ dB/decade towards negative infinity.

+++ {"slideshow": {"slide_type": "subslide"}}

We can use MATLAB to plot the frequency response of this relation for $k = 1,2,4,8$

```{code-cell}
---
slideshow:
  slide_type: notes
---
w_w0 = 0:0.02:3; 
Aw2k1 = sqrt(1./(w_w0.^2 + 1)); Aw2k2 = sqrt(1./(w_w0.^4 + 1));
Aw2k4 = sqrt(1./(w_w0.^8 + 1)); Aw2k8 = sqrt(1./(w_w0.^16 + 1));
plot(w_w0,Aw2k1,w_w0,Aw2k2,w_w0,Aw2k4,w_w0,Aw2k8),grid on
xlabel('Normalized Frequency Ratio (ratio of actual to cut-off)')
ylabel('Magnitude A (square root of A^2(omega))')
title('Butterworh Analogue Low-Pass Filter characteritics for k = 1, 2, 4 and 8')
legend('k=1','k=2','k=4','k=8')
```

+++ {"slideshow": {"slide_type": "notes"}}

All Butterworth filters have the property that all poles of the transfer function that describes them lie on the circumference of a circle with radius $\omega_c$, and they are $2\pi/2k$ radians apart. Thus, if $k$ is odd, the poles start at zero radians, and if $k$ is even, they start at $2\pi/2k$ radians. But regardless wether $k$ is odd or even, the poles are distributed with symmetry with respect to the $j\omega$ axis. For stability, we chose the left half-plave poles to form $G(s)$.

We can find the nth roots of the complex number $s$ by *De Moirvre's theorem*. This states that

$$\sqrt[n]{r e^{j\theta}} = \sqrt[n]{r} {e}^{j\left(\frac{\theta + 2k\pi}{N} \right)}\,k=1,\pm 1,\pm 2,\ldots$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Example 3

Derive the transfer function $G(s)$ for the third-order ($k=3$) Butterworth low-pass filter with *normalized cut-off frequency* $\omega_c = 1$ rad/s.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution

With $k = 3$ and $\omega_c = 1$ rad/s, {eq}`eq:7.1:10` simplifies to 

$$A^2(\omega) = \frac{1}{\omega^6 + 1} $$ (eq:7.1:10)

+++ {"slideshow": {"slide_type": "subslide"}}

With the substitution $\omega^2 = -s^2$, {eq}`eq:7.1:10` becomes

$$G(s).G(-s) = \frac{1}{-s^6 + 1} $$ (eq:7.1:11)

+++ {"slideshow": {"slide_type": "subslide"}}

The $s = \sqrt[6]{1}\angle 0 ^\circ$ and by De Moivre's theorem, with $n = 6$,

$$\sqrt[6]{1e^{j0}} = \sqrt[6]{1}e^{j\left(\frac{0 + 2k\pi}{6} \right)},\,k=0,1,2,3,4,5$$

+++ {"slideshow": {"slide_type": "subslide"}}

Thus

$$
\begin{array}{lll}
s_1 = 1\angle 0^\circ & s_2 = 1\angle 60^\circ = \frac{1}{2} + j\frac{\sqrt{3}}{2} & s_3 = 1\angle 120^\circ = -\frac{1}{2} + j\frac{\sqrt{3}}{2} \\
s_4 = 1\angle 180^\circ = -1 &  s_5 = 1\angle 240^\circ = -\frac{1}{2} - j\frac{\sqrt{3}}{2} & s_6 = 1\angle 300^\circ = \frac{1}{2} - j\frac{\sqrt{3}}{2}
\end{array}
$$

+++ {"slideshow": {"slide_type": "subslide"}}

As expected, these six poles lie on the circumference of the circle with radius $\omega_c = 1$ as shown in {numref}`fig:7.1:2`.

:::{figure-md} fig:7.1:2
<img src="pictures/butter6.png" alt = "Location of the poles for the transfer function for the transfer function of Example 3" width="50%" />

Location of the poles for the transfer function for the transfer function of Example 3
:::

+++ {"slideshow": {"slide_type": "subslide"}}

The transfer function $G(s)$ is formed with the left half-plane poles $s_3$, $s_4$ and $s_5$. Then

$$G(s) = \frac{K}{\left(s + 1\right)\left(s + \frac{1}{2} -j\frac{\sqrt{3}}{2}\right)\left(s + \frac{1}{2} +j\frac{\sqrt{3}}{2}\right)} $$ (eq:7.1:12)

+++ {"slideshow": {"slide_type": "subslide"}}

We use MATLAB to express the denominator as a polynomial

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms s; den = (s + 1)*(s + 1/2 - j*sqrt(3)/2)*(s + 1/2 + j*sqrt(3)/2)
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
expand(den)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Thereform {eq}`eq:7.1:12` simplifies to

$$G(s) = \frac{K}{s^3 + 2s^2 + 2s + 1} $$ (eq:7.1:13)

+++ {"slideshow": {"slide_type": "subslide"}}

The gain $K$ is fornd from $A^2(0) = 1$ and $G(0) = K$. Thus, K = 1 and

$$G(s) = \frac{1}{s^3 + 2s^2 + 2s + 1} $$ (eq:7.1:14)

+++ {"slideshow": {"slide_type": "subslide"}}

The generalized form of any analogue low-pass filter (Butterworth, Chebyshev, Elliptic, etc) is

$$\left.G(s)\right|_{\mathrm{lp}} = \frac{b_0}{a_ks^k + \cdots a_2 s^2 + a_1 s + a_0} $$ (eq:7.1:15)

The pole locations and coefficients of the corresponding denominator polynomials have been derived and tabulated and easily found on the internet: for example [Normalized Butterworth polynomials](https://en.wikipedia.org/wiki/Butterworth_filter#Normalized_Butterworth_polynomials) in Wikipedia.

For brevity, we will not reproduce these tables here.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Designing Butterworth filters in MATLAB

The MATLAB functions [`buttap`](https://uk.mathworks.com/help/signal/ref/buttap.html) and [`zp2tf`](https://uk.mathworks.com/help/signal/ref/zp2tf.html) can also be used to derive the coefficients. 

+++ {"slideshow": {"slide_type": "notes"}}

The `buttap` function returns the zeros, poles and gain for an Nth order normalized prototyoe Butterworth low-pass filter. The resulting filter has $N$ poles around the unit circle in the left half plane, and no zeros. The `zp2tf` function performs the zero-pole-gain to transfer function conversion.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Example 4

Use MATLAB to derive the numerator `b` and denominator `a` coefficients for the third-order Butterworth low-pass filter prototype with normalized cutoff frequency. Plot the Bode plot of the filter.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution

```{code-cell}
---
slideshow:
  slide_type: fragment
---
[z,p,k] = buttap(3); 
[b,a] = zp2tf(z,p,k)
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G = tf(b,a)
bode(G), grid on
title('Bode diagram for a 3rd order Butterworth filter with wc = 1 rad/s')
```

+++ {"slideshow": {"slide_type": "notes"}}

Note that the roll-off is -60 dB/decade above the normalized cut-off $\omega_c = 1$ rad/s. Also note that the phase changes fron $0^\circ$ to $-270^\circ$ from low to high frequency.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Denormalizing a prototype filter

The examples given so far, and the MATLAB function `buttap` (and the others we will meet later) give the coefficents assuming that the cut-off frequency $\omega_c$ is 1 rad/s. To *denormalize* the filter coefficients, we need to change the radius of the circle shown e.g in {numref}`fig:7.1:2` from $\omega_c = 1$ to $\omega_c = \omega_\mathrm{actual}$ .

To do this we make the subsitution

$$G(s)_\mathrm{actual} = G\left(\frac{s}{\omega_\mathrm{actual}} \right) $$ (eq:7.1:15)

As you might expect, MATLAB provides a function for that: [`lp2lp`](https://uk.mathworks.com/help/signal/ref/lp2lp.html).

+++ {"slideshow": {"slide_type": "subslide"}}

#### Example 5

Redesign the filter designed in Example 4 so that it has a a cut-off frequency of $1$ kHz.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution

```{code-cell}
---
slideshow:
  slide_type: subslide
---
[z,p,k] = buttap(3); 
[b,a] = zp2tf(z,p,k);
fc = 1e3; % 1 kHz
wc = 2*pi*fc; % rad/s
format long
[b, a] = lp2lp(b, a, wc)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
h = bodeplot(tf(b, a)); setoptions(h,'FreqUnits','kHz'),grid on
title('Butterworth 3rd Order Low-Pass Filter: fc = 1 kHz')
```

+++ {"slideshow": {"slide_type": "notes"}}

```{note}
We have used several new MATLAB commands in {ref}`unit7.1:ex5`. These are summarized below.

* [`lp2lp`](https://uk.mathworks.com/help/signal/ref/lp2lp.html) - change cutoff frequency for lowpass analogue filter.
* [`bodeplot`]() - plot Bode frequency response with additional plot customization options.
* option [`FreqUnits`](https://uk.mathworks.com/help/ident/ref/frdmodel.chgfrequnit.html) - changes the units for frequency response data.
```

+++ {"slideshow": {"slide_type": "notes"}}

Karris ({cite}`karris`) goes on to give more details of the Butterworth filter, including how to chose the filter order $N$ to match a specific requirement on the stop-band attenuation, and how such a filter might be implemented with Op-Amp circuits. We leave you to explore these topics on your own.

+++ {"slideshow": {"slide_type": "subslide"}}

### Chebyshev Analogue Low-Pass Filter Design

An issue with the Butterworth filter is that the stop-band attenuation rate may not be high enough for some applications unless a very large value of $N$ is used.

If we allow some ripple in the pass-band we can obtain a sharper cut-off for smaller values of $N$.

The Chebyshev analogue low-pass filter is such a design. 

+++ {"slideshow": {"slide_type": "subslide"}}

A Chebyshev filter has the same transfer function structure as {eq}`eq:7.1:15`, but the poles are located differently.

We will not present the formulae used to define the poles of this filter type, as MATLAB provides the design tool [`cheb1ap`](https://uk.mathworks.com/help/signal/ref/cheb1ap.html) that will do this for us.

+++ {"slideshow": {"slide_type": "notes"}}

If you want the details, please consult Section 11.2.2 of {cite}`karris`.

+++ {"slideshow": {"slide_type": "subslide"}}

Example 11.9 from Karris

+++ {"slideshow": {"slide_type": "subslide"}}

### Chebyshev Type II Analogue Low-Pass Filter Design

+++ {"slideshow": {"slide_type": "subslide"}}

### Elliptic Analogue Low-Pass Filter Design

+++ {"slideshow": {"slide_type": "subslide"}}

(unit7.1:other)=
### High-Pass, Band-Pass and Band-Elimination Filter Design

+++ {"slideshow": {"slide_type": "slide"}}

(unit7.1:digital)=
## Digital filter design

+++ {"slideshow": {"slide_type": "notes"}}

## References

See [Bibliography](/zbib).

+++ {"slideshow": {"slide_type": "notes"}}

## Footnotes

```{code-cell}

```
