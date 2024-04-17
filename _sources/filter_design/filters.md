(unit7.1)=
# Unit 7.1: Designing Digital Filters


## Colophon

An annotatable worksheet for this presentation is available as [**Worksheet 14**](worksheet14).

* The source code for this page is [digital_filters/1/filters.md](https://github.com/cpjobling/eg-247-textbook/blob/master/digital_filters/1/filters.md).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/digital_filters/filters.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/digital_filters/filters.pdf) file.


## Scope and Background Reading

We introduced the idea of filters in {ref}`ft4` and examined in some detail the idea of an ideal low-pass filter and an approximation to the ideal filter known and the *Butterworth* filter. We also showed how a high-pass filter, stop-band filter and and pass-band filter could be implemented by simple manipulations of the frequency response (or transfer functions) of a low-pass filter. 

An advantage of the Butterworth filter is that it has a flat response in the pass band, a consistent attenuation of -3 dB at the cut-off frequency, and a steady roll-off in the stop band. A disadvantage is that you need a high-order filter to get a fast transition between the pass-band and the stop-band.

In {ref}`demo`, we showed how an analogue 2nd-order Butterworth filter could be translated into a discrete-time (DT) system using the MATLAB function `c2d`, and we demonstrated the architecture and code that might be used to implement the digital filter.

In this unit we will explore further some of the concepts of what is called *filter design by analogue prototype*. This Unit is based on Chapter 11 of {cite}`karris`. We will illustrate the concepts using MATLAB and Simulink as appropriate on the understanding that you should be able to manually design a digital filter from a 2nd-order analogue proptotype.


## Agenda

* {ref}`unit7.1:introduction`
* {ref}`unit7.1:afp`


(unit7.1:introduction)=
## Introduction

**Analogue filters** are defined in continuous range of frequencies. They are classified as *low-pass*, *high-pass*, *band-pass* and *band-elimination* (*stop-band*) filters.


The ideal mangnitude characteristics of each are illustrated in {numref}`fig:7.1:mag_chars`


:::{figure-md} fig:7.1:mag_chars
<img src="pictures/mag_chars.png" alt="illustration of the magnitude characteristics of ideal filters" width="100%" />

Magnitude characteristics of ideal filters (reproduced from Figure 11.1 {cite}`karris`).
:::


As we saw in {ref}`ft4:ideal_lp_filter`, filters with ideal characteristics are not physicaly realizable (they are not *causal* systems). Instead we design practical filters that approximate these characteristics.


A **digital filter**, in general, is a computational process, or algorithm, that converts one sequence of numbers representing the input signal into another sequence of numbers representing the output signal.

Analogue filter functions have been used extensively as prototype models for designing digital filters, and that is the approach we will present here.


```{note}
In Section 11.2 of {cite:t}`karris` examples of analogue low-pass and high-pass filters made from RC circuits and band-pass and stop band filters made from RLC circuits are given. We will pass over these as our interest is in digital filters, and in any case, filters made from passive components are only practical in a limited range of applications. Instead, we will look at the idea of analogue filter porotypes.
```


(unit7.1:afp)=
## Low-pass analogue filter prototypes

In this section, we will use the analogue low-pass filter as a basis. Using transformations, we can derive high-pass and other types of filter from the low-pass filter.

We will discuss the *Butterworth*, *Chebyshev Type 1*, *Chebyshev Type II* and *Elliptic* filters.

As through MATLAB and the Signal Processing Toolbox, we have access to sophisticated design tools, we will gloss over some of the mathematical details. If you are interested in such detail, please refer to Section 11.3 and following sections of {cite}`karris`.


```{note}
From the point of view of assessment, you are only required to be able to recognise the filter types presented here and their key properties. Although you can design a filter of virtually any order, we will limit ourselves to second-order filters and provide the actual transfer function coefficients that you need to be able to convert the analogue filter into a digital filter using the *bilinear transform*. If you need access to the filter formulae, you will be given them in the question.
```


(unit7.1:msf)=
### Magnitude-square function

To facilitate the design of filters we use a so-called *magnitude-squared function*[^u71:note1] $A^2(\omega)$, and from it derive a $G(s)$ function such that

$$A^2(\omega) = \left.G(s).G(-s)\right|_{s = j\omega}$$ (eq:7.1:1)


[^u71:note1]: This avoids having to deal with complex magnitudes which use the square-root operator.


Since $(j\omega)^* = (-j\omega)$, the square of a complex number can be expressed as that complex number and its complex conjugate. Thus, if the magnitude is $A$, then

$$A^2(\omega) = \left|G(j\omega)\right| = G(j\omega)G^*(j\omega) = G(j\omega).G(-j\omega)$$ (eq:7.1:2)


Now, $G(j\omega)$ can be considered as $G(s)$ evaluated at $s = j\omega$, and this {eq}`eq:7.1:1` is justified.

Also, since $A$ is understood to represent the magnitude, it needs not to be enclosed in vertical lines.


Not all magnitude-square functions can be decomposed to $G(s)$ and $G(-s)$ rational functions; only even functions of $\omega$, positive for all $\omega$, and *proper-rational functions*[^u71:note2] can satisfy {eq}`eq:7.1:1`.


[^u71:note2]: A rational function is said to be *proper* if the largest power in the denominator is equal to or larger than that of the numerator.


#### Example 1

It is known that

$$G(s) = \frac{3s^2 + 5s + 7}{s^2 + 4s + 6} $$

Compute $A^2(\omega)$.


##### Solution

Since 

$$G(s) = \frac{3s^2 + 5s + 7}{s^2 + 4s + 6} $$


it follows that

$$G(-s) = \frac{3s^2 - 5s + 7}{s^2 - 4s + 6} $$


and

$$G(s).G(-s) = \frac{3s^2 + 5s + 7}{s^2 + 4s + 6}.\frac{3s^2 - 5s + 7}{s^2 - 4s + 6} = \frac{9s^4 + 17s^2 + 49}{s^4 - 4s^2 + 36}  $$


Therefore

$$A^2(\omega) = \left.\frac{9s^4 + 17s^2 + 49}{s^4 - 4s^s + 36}\right|_{s = j\omega} = \frac{9\omega^4 - 17\omega^2 + 49}{\omega^4 + 4\omega^2 + 36}$$


#### General form of magnitude-square function

The general form of magnitude-square function $A^2(\omega)$ is

$$A^2(\omega) = \frac{C\left(b_k\omega^{2k}+b_{k-1}\omega^{2k-2}+\cdots+ b_0\right)}{a_k\omega^{2k}+a_{k-1}\omega^{2k-2}+\cdots+ a_0} $$ (eq:7.1:3)


where $C$ is the DC gain, $a$ and $b$ are constant coefficients, and $k$ is a psotive integer denoting the order of the filter.


Once the magnitude-square function $A^2(\omega)$ is known, we can derive $G(s)$ from {eq}`eq:7.1:1` with the substitution $\left(j\omega\right)^2 = -\omega^2 = - s^2$, 


that is

$$G(s).G(-s) = \left. A^2(\omega)\right|_{\omega^2 = -s^2}$$ (eq:7.1:4)


#### Analysis of magnitude-square filter

In the simplest low-pass filter, the DC gain of the magnitude-square function is unity. In this case {eq}`eq:7.1:3` reduces to

$$A^2(\omega) = \frac{b_0}{a_k\omega^{2k}+a_{k-1}\omega^{2k-2}+\cdots+ a_0} $$ (eq:7.1:5)


and at high frequencies (i.e. in the stop-band) can be approximated as

$$A^2(\omega) = \frac{b_0/a_k}{\omega^{2k}} $$ (eq:7.1:6)


The *attenuation rate* of this approximation is $20k$ dB/decade.


#### Example 2

Given the magnitude-square function

$$A^2(\omega) = \frac{16\left(-\omega^2 + 1\right)}{\left(\omega^2+4\right)\left(\omega^2+ 9\right)}$$ (eq:7.1:7)

derive a suitable transfer function $G(s)$.


##### Solution

From relation {eq}`eq:7.1:4`

$$G(s).G(-s) = \left. A^2(\omega)\right|_{\omega^2 = -s^2} = \frac{16\left(s^2 + 1\right)}{\left(-s^2 + 4\right)\left(-s^2 + 9\right)} $$ (eq:7.1:8)


This function has zeros at $s = \pm j$, and poles at $s = \pm 2$ and $s = \pm 3$.


There is no restriction on the zeros, but for stability[^u71:note3], we select the left-half $s$-plane poles.


[^u71:note3]: A system is said to be stable if a finite input produces a finite output. Alternatively, a system is stable if its impulse response $h(t)$ vanishes after a sufficiently long time. For linear time-invariant systems, a system will be stable *only if* all the real-parts of the poles have negative sign. That is, they lie in the left-half of the $s$-plane.


Let 

$$G(s) = \frac{K\left(s^2 + 1\right)}{\left(s + 2\right)\left(s+3\right)} $$ (eq:7.1:9)


We must find $K$ such that $G(0) = A(0)$. From {eq}`eq:7.1:7`

$$A^2(0) = 16/36 = 4/9$$

or 

$$A(0) = 2/3$$


From {eq}`eq:7.1:9`,

$$G(0) = K/6$$

and for $G(0) = A(0)$ we must have,

$$K/6 = 2/3$$

or

$$K = 12/3 = 4$$


By subsitution into {eq}`eq:7.1:9`, we obtain

$$G(s) = \frac{4\left(s^2 + 1\right)}{\left(s + 2\right)\left(s+3\right)} $$


(unit7.1:butter)=
### Butterworth Analogue Low-Pass Filter Design

Consider the *Butterworth low-pass filter*[^u71:note5] whose magnitude-squared function is

$$A^2(\omega) = \frac{1}{\left(\omega/\omega_c\right)^{2k}+1} $$ (eq:7.1:10)

where $k$ is a positive integer, and $\omega_c$ is the cutoff (-3 dB) frequency.


[^u71:note5]: The frequency response of the Butterworth filter is *maximally flat* (has no ripples) in the passband, and rolls off towards zero in the stopband. When viewed on a logarithmic Bode plot, the response slopes off linearly at a rate of $-20k$ dB/decade towards negative infinity.


We can use MATLAB to plot the frequency response of this relation for $k = 1,2,4,8$

```matlab
w_w0 = 0:0.02:3; 
Aw2k1 = sqrt(1./(w_w0.^2 + 1)); Aw2k2 = sqrt(1./(w_w0.^4 + 1));
Aw2k4 = sqrt(1./(w_w0.^8 + 1)); Aw2k8 = sqrt(1./(w_w0.^16 + 1));
plot(w_w0,Aw2k1,w_w0,Aw2k2,w_w0,Aw2k4,w_w0,Aw2k8),grid on
xlabel('Normalized Frequency Ratio (ratio of actual to cut-off)')
ylabel('Magnitude A (square root of A^2(omega))')
title('Butterworh Analogue Low-Pass Filter characteritics for k = 1, 2, 4 and 8')
legend('k=1','k=2','k=4','k=8')
```

## References

See [Bibliography](/zbib).


## Footnotes

```matlab

```
