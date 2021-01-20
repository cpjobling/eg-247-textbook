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

# Worksheet 12

## To accompany Chapter 5.1 Defining the Fourier Transform

+++ {"slideshow": {"slide_type": "slide"}}

## Colophon

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet12.pdf). We will step through this worksheet in class. 

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 12** in the **Week 6: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 

You are expected to have at least watched the video presentation of [Chapter 5.1](https://cpjobling.github.io/eg-247-textbook/fourier_transform/1/ft1) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

After class, the lecture recording and the annotated version of the worksheets will be made available through Canvas.

+++ {"slideshow": {"slide_type": "slide"}}

##  Fourier Transform as the Limit of a Fourier Series

We start by considering the pulse train that we used in the last lecture and demonstrate that the discrete line spectra for the Fourier Series becomes a continuous spectrum as the signal becomes aperiodic.

+++ {"slideshow": {"slide_type": "notes"}}

This analysis is from Boulet pp 142&mdash;144 and 176&mdash;180.

+++ {"slideshow": {"slide_type": "subslide"}}

Let $\tilde x(t)$ be the Fourier series of the rectangular pulse train shown below:

![A rectangular pulse train](./pictures/pulse_train.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### Fourier Series

In the [previous section](../../fourier_series/3/exp_fs2) we used

$$C_k = \frac{1}{2\pi}\int_{-\pi/w}^{\pi/w} Ae^{-jk(\Omega_0 t)}\,d(\Omega_0 t) = \frac{A}{2\pi}\int_{-\pi/w}^{\pi/w} e^{-jk(\Omega_0 t)}\,d(\Omega_0 t) $$

to compute the line spectra.

+++ {"slideshow": {"slide_type": "subslide"}}

#### From the Time Point of View

If we instead take a time point-of-view and let $A = 1$

$$C_k = \frac{1}{T}\int_{-t_0}^{t_0} e^{-jk\Omega_0 t}\,dt.$$

Let's complete the analysis in the whiteboard.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">






























</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### The Sinc Function

The function, $\sin(\pi x)/\pi x$ crops up again and again in Fourier analysis. The Fourier coefficients $C_k$ are scaled *samples* of the real continuous *normalized sinc* function defined as follows:

$$\operatorname{sinc} u: = \frac{\sin \pi u}{\pi u},\;u \in \mathbb{R}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

The function is equal to 1 at $u=0$<sup>1</sup> and has zero crossings at $u=\pm n,\; n=1,2,3,\ldots$ as shown below.

#### Plot the sinc function
 
Plots: 
 
$$sinc(u) = \frac{\sin \pi u}{\pi u},\; u \in \mathbb{R}$$

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
clear all
imatlab_export_fig('print-svg')  % Static svg figures.
cd ../matlab
format compact
```

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
x = linspace(-5,5,1000);
plot(x,sin(pi.*x)./(pi.*x))
grid
title('Graph of sinc function')
ylabel('sinc(u)')
xlabel('u')
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Duty cycle

* We define the duty cycle $\eta = 2t_0/T$ of the rectangular pulse train as the fraction of the time the signal is "on" (equal to 1) over one period.
* The duty cycle is often given as a percentage.

+++ {"slideshow": {"slide_type": "subslide"}}

The spectral coefficients expressed using the normalized sinc function and the duty cycle can be written as

$$C_k = \frac{2t_0}{T}\frac{\sin\left(\frac{\pi k2t_0}{T}\right)}{\frac{\pi k2t_0}{T}}=\frac{2t_0}{T}\operatorname{sinc}\left(\frac{k2t_0}{T}\right)$$

$$C_k = \eta \operatorname{sinc}\left(k\eta\right)$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Normalize the spectral coefficients

Let us normalize the spectral coefficients of $\tilde x(t)$ by mutiplying them by $T$, and assume $t_0$ is fixed so that the duty cycle $\eta = 2t_0/T$ will decrease as we increase $T$:

$$T C_k = T\eta \operatorname{sinc}\left(k\eta\right)=2t_0\operatorname{sinc}\left(k\frac{2t_0}{T}\right)$$

+++ {"slideshow": {"slide_type": "subslide"}}

Then the normalized coefficents $T C_k$ of the rectangular wave is a sinc envelope with constant amplitude at the origin equal to $2t_0$, and a zero crossing at fixed frequency $\pi/t_0$ rad/s, both independent of $T$.

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
open duty_cycle
```

+++ {"slideshow": {"slide_type": "fragment"}}

**Demo**

Run duty_cycle with values of:

* 50% ($\eta = 1/2$)

+++ {"slideshow": {"slide_type": "fragment"}}

* 25% ($\eta = ?$)

+++ {"slideshow": {"slide_type": "fragment"}}

* 12.5% ($\eta = ?$)

+++ {"slideshow": {"slide_type": "fragment"}}

* 5% ($\eta = ?$)

+++ {"slideshow": {"slide_type": "notes"}}

#### Comments

* As the fundamental period increases, we get more spectral lines packed into the lobes of the sinc envelope.
* These normalized spectral coefficients turn out to be samples of the continuous sinc function on the spectrum of $\tilde{x}(t)$

* The two spectra are plotted against the frequency variable $k\omega_0$ with units of rad/s rather than index of harmonic component
* The first zeros of each side of the main lobe are at frequencies $\omega = \pm \pi/t_0$ rad/s
* The zero-crossing points of sinc envelope are independent of the period T. They only depend on $t_0$.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Intuition leading to the Fourier Transform

* An aperiodic signal that has been made periodic by "repeating" its graph every $T$ seconds will have a line spectrum that becomes more and more dense as the fundamental period is made longer and longer.
* The line spectrum has the same continuous envelope.
* As $T$ goes to infinity, the line spectrum will become a continuous function of $\omega$.
* The *envelope* is this function.

+++ {"slideshow": {"slide_type": "slide"}}

### Doing the Maths

See the [notes](ft1).

+++ {"slideshow": {"slide_type": "subslide"}}

**Inverse Fourier Transform**:

$$x(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} X(j\omega)e^{j\omega t}\,d\omega := \mathcal{F}^{-1} \left\{X(j\omega)\right\}$$

Similarly, given the expression we have already seen for an arbitrary $x(t)$:

+++ {"slideshow": {"slide_type": "subslide"}}

**Fourier Transform**:

$$X(j\omega) = \int_{-\infty}^{\infty}x(t)e^{-j\omega t}\,dt := \mathcal{F}\left\{x(t)\right\}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Fourier Transform Pair

* The two equations on the previous slide are called the *Fourier transform pair*.

+++ {"slideshow": {"slide_type": "slide"}}

## Properties of the Fourier Transform

Again, we will provide any properties that you might need in the examination.
    
You will find a number of these in the accompanying notes.

+++ {"slideshow": {"slide_type": "notes"}}

## Table of Properites of the Fourier Transform

As was the case of the Laplace Transform, properties of Fourier transforms are usually summarized in Tables of Fourier Transform properties. For example this one: [Properties of the Fourier Transform (Wikpedia)](https://en.wikipedia.org/wiki/Fourier_transform#Properties_of_the_Fourier_transform) and Table 8.8 in Karris (page 8-17).

More detail and some commentry is given in the printable version of these notes.

<table>
<thead> 
    <tr><td></td><td><b>Name</b></td><td>$f(t)$</td><td>$F(j\omega)$</td><td><b>Remarks</b></td></tr>
</thead>
<tbody>
<tr><td>1</td><td>Linearity</td><td>$a_1f_1(t)+a_2f_2(t)+\cdots+a_nf_n(t)$</td><td>$a_1F_1(j\omega)+a_2F_2(j\omega)+\cdots+a_nF_n(j\omega)$</td><td>Fourier transform is a linear operator.</td></tr>
<tr><td>2</td><td>Symmetry</td><td>$2\pi f(-j\omega)$</td><td>$F(t)$</td><td></td></tr>
<tr><td>3.</td><td>Time and frequency scaling</td><td>$f(\alpha t)$</td><td>$$\frac{1}{|\alpha|}F\left(j\frac{\omega}{\alpha}\right)$$</td><td>time compression is frequency expansion and *vice versa*</td></tr>
<tr><td>4.</td><td>Time shifting</td><td>$$f(t-t_0)$$</td><td>$$e^{-j\omega t_0}F(j\omega)$$</td><td>A time shift corresponds to a phase shift in frequency domain</td></tr>
<tr><td>5.</td><td>Frequency shifting</td><td>$$e^{j\omega_0 t}f(t)$$</td><td>$$F(j\omega-j\omega_0)$$</td><td>Multiplying a signal by a complex exponential results in a frequency shift.</td></tr>
<tr><td>6.</td><td>Time differentiation</td><td>$$\frac{d^n}{dt^n}\,f(t)$$</td><td>$$(j\omega)^nF(j\omega)$$</td><td></td></tr>
<tr><td>7.</td><td>Frequency differentiation</td><td>$$(-jt)^n f(t)$$</td><td>$$\frac{d^n}{d\omega^n}F(j\omega)$$</td><td></td></tr>
<tr><td>8.</td><td>Time integration</td><td>$$\int_{-\infty}^{t}f(\tau)d\tau$$</td><td>$$\frac{F(j\omega)}{j\omega}+\pi F(0)\delta(\omega)$$</td><td></td></tr>
<tr><td>9.</td><td>Conjugation</td><td>$$f^*(t)$$</td><td>$$F^*(-j\omega)$$</td><td></td></tr>
<tr><td>10.</td><td>Time convolution</td><td>$$f_1(t)*f_2(t)$$</td><td>$$F_1(j\omega) F_2(j\omega)$$</td><td>Compare with Laplace Transform</td></tr>
<tr><td>11.</td><td>Frequency convolution</td><td>$$f_1(t)f_2(t)$$</td><td>$$\frac{1}{2\pi} F_1(j\omega)*F_2(j\omega)$$</td><td>This has application to amplitude modulation as shown in Boulet pp 182&mdash;183.</td></tr>
<tr><td>12.</td><td>Area under $f(t)$</td><td>$$\int_{-\infty}^{\infty} f(t)\,dt = F(0)$$</td><td></td><td>Way to calculate DC (or average) value of a signal</td></tr>
<tr><td>13.</td><td>Area under $F(j\omega)$</td><td>$$f(0) = \frac{1}{2\pi}\int_{-\infty}^{\infty} F(j\omega)\,d\omega$$</td><td></td><td></td></tr>
<tr><td>14.</td><td>Energy-Density Spectrum</td><td>$$E_{[\omega_1,\omega_2]}:=\frac{1}{2\pi}\int_{\omega_1}^{\omega_2}|F(j\omega)|^2\,d\omega.$$</td><td></td><td></td></tr>
<tr><td>15.</td><td>Parseval's theorem</td><td>$$\int_{-\infty}^{\infty}|f(t)|^2\,dt=\frac{1}{2\pi}\int_{-\infty}^{\infty}|F(j\omega)|^2\,d\omega.$$</td><td></td><td>Definition RMS follows from this</td></tr>
</tbody>
</table>

See also: [Wikibooks: Engineering Tables/Fourier Transform Properties](https://en.wikibooks.org/wiki/Engineering_Tables/Fourier_Transform_Properties) and [Fourier Transfom&mdash;WolframMathworld](https://mathworld.wolfram.com/FourierTransform.html) for more complete references.

+++ {"slideshow": {"slide_type": "slide"}}

## Examples

1. Amplitude Modulation
2. Impulse response
3. Energy computation

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 1: Amplitude Modulation

Compute the result of multiplying a signal $f(t)$ by a carrier waveform $\cos \omega_c t$.

*Hint* use Euler's identity and the frequency shift property

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 2: Impulse response

A system has impulse response $f(t) = e^{-t}u_0(t)$. Compute the frequency sprectrum of this system.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 3: Energy computation

An aperiodic real signal $f(t)$ has Fourier transform $F(j\omega)$. Compute the energy contained the signal between 5kHz and 10kHz.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## Computing Fourier Transforms in Matlab

MATLAB has the built-in **fourier** and **ifourier** functions that can be used to compute the Fourier transform and its inverse. We will explore some of thes in the next lab.

For now, here's an example:

+++ {"slideshow": {"slide_type": "subslide"}}

### Example

Use Matlab to confirm the Fourier transform pair:
    
$$e^{-\frac{1}{2}t^2}\Leftrightarrow \sqrt{2\pi}e^{-\frac{1}{2}\omega^2}$$

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
syms t v omega x;
ft = exp(-t^2/2);
Fw = fourier(ft,omega)
```

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
pretty(Fw)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Check by computing the inverse using ifourier

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
ft = ifourier(Fw)
```
