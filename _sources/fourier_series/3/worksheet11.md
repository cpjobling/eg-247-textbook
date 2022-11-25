---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.1
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

# Worksheet 11

## To accompany Chapter 4.3 Line Spectra and their Applications

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet11.pdf). We will step through this worksheet in class. 

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 9** in the **Week 5: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 

You are expected to have at least watched the video presentation of [Chapter 4.3](https://cpjobling.github.io/eg-247-textbook/fourier_series/3/exp_fs2) of the [notes](https://cpjobling.github.io/eg-247-textbook/) before coming to class. If you haven't watch it afterwards!

After class, the lecture recording and the annotated version of the worksheets will be made available through Canvas.

+++ {"slideshow": {"slide_type": "slide"}}

### Example 3

Compute the exponential Fourier series for the waveform shown below and plot its line spectra.

<img src="pictures/pulse_train.png">

+++ {"slideshow": {"slide_type": "subslide"}}

### Solution to example 3

The recurrent rectangular pulse is used extensively in digital communication systems. To determine how faithfully such pulses will be transmitted, it is necessary to know the frequency components.

+++ {"slideshow": {"slide_type": "subslide"}}

**What do we know?**

* The pulse duration is $T/w$.
* The recurrence interval $T$ is $w$ times the pulse duration.
* $w$ is the ratio of pulse repetition time to the pulse duration &ndash; normally called the *duty cycle*.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Coefficients of the Exponential Fourier Series?

Given

$$C_k = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(\Omega_0 t)e^{-jk(\Omega_0 t)}\,d(\Omega_0 t)$$

* Is the function **even** or **odd**?
* Does the signal have **half-wave symmetry**?
* What are the cosequencies of symmetry on the form of the coefficients $C_k$?
* What function do we actually need to integrate to compute $C_k$?

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### DC Component?

Let $k = 0$ then perform the integral

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### Harmonic coefficients?

Integrate for $k\ne 0$

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### Exponential Fourier Series?

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Effect of pulse width on frequency spectra

* Recall pulse width = $T/w$

We will use the provided MATLAB script [sinc.mlx](https://cpjobling.github.io/eg-247-textbook/fourier_series/matlab/sinc.mlx) to explore these in class. You will also need [pulse_fs.m](https://cpjobling.github.io/eg-247-textbook/fourier_series/matlab/pulse_fs.m). See Canvas/OneNote for copies of these files.

+++ {"slideshow": {"slide_type": "subslide"}}

#### w = 2

$\Omega_0 = 1$ rad/s; $w = 2$; $T = 2\pi$ s; $T/w = \pi$ s.

+++ {"slideshow": {"slide_type": "subslide"}}

#### w = 5


$\Omega_0 = 1$ rad/s; $w = 5$; $T = 2\pi$ s; $T/w = 2\pi/5$ s.

+++ {"slideshow": {"slide_type": "subslide"}}

#### w = 10


$\Omega_0 = 1$ rad/s; $w = 10$; $T = 2\pi$ s; $T/w = \pi/5$ s.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Implications

* As the width of the pulse **reduces** the width of the freqency spectra needed to fully describe the signal **increases** 
* more bandwidth is needed to transmit the pulse.

+++ {"slideshow": {"slide_type": "slide"}}

### Example 4

Use the result of Example 1 to compute the exponential Fourier series of the impulse train $\delta(t\pm 2\pi k)$ shown below 

<img src="pictures/impulse_train.png">

+++ {"slideshow": {"slide_type": "subslide"}}

### Solution to example 4

To solve this we take the previous result and choose amplitude (height) $A$ so that area of pulse is unity. Then we let width go to zero while maintaining the area of unity. This creates a train of impulses $\delta(t\pm 2\pi k)$.

$$C_k  = \frac{1}{2\pi}$$

and, therefore

$$f(t) = \frac{1}{2\pi}\sum_{k=-\infty}^{\infty} e^{jk\Omega_0 t}$$

Try it!

+++ {"slideshow": {"slide_type": "subslide"}}

#### Proof!

From the previous result, 

$$C_k = \frac{A}{w}.\frac{\sin(k\pi/w)}{k\pi/w}$$

and the pulse width was defined as $T/w$, that is

$$\frac{T}{w}=\frac{2\pi}{w}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Let us take the previous impulse train as a recurrent pulse with amplitude

$$A = \frac{1}{T/w} = \frac{1}{2\pi/w} = \frac{w}{2\pi}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Pulse with unit area

The area of each pulse is then 

$$\frac{2\pi}{w}\times\frac{w}{2\pi} = 1$$

+++ {"slideshow": {"slide_type": "subslide"}}

and the pulse train is as shown below:

<img src="pictures/unit_area_pulses.png">

+++ {"slideshow": {"slide_type": "subslide"}}

#### New coefficents

The coefficients of the Exponential Fourier Series are now:
    
$$C_n = \frac{w/2\pi}{w}\frac{\sin(k\pi/w)}{k\pi/w} = \frac{1}{2\pi}\frac{\sin(k\pi/w)}{k\pi/w}$$

and as $\pi/w \to 0$ each recurrent pulse becomes a unit impulse, and the pulse train reduces to a unit impulse train.

+++ {"slideshow": {"slide_type": "subslide"}}

Also, recalling that

$$\lim_{x\to 0} \frac{sin x}{x} = 1$$

the coefficents reduce to

$$C_n = \frac{1}{2\pi}$$

That is all coefficients have the same amplitude and thus

$$f(t) = \frac{1}{2\pi}\sum_{n=-\infty}^{\infty} e^{jk\Omega_0 t}$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Spectrum of Unit Impulse Train

The line spectrum of a sequence of unit impulses $\delta(t \pm kT)$ is shown below:
                                                         
<img src="pictures/impulse_spectrum.png">

+++ {"slideshow": {"slide_type": "subslide"}}

#### Another Interesting Result

Consider the pulse train agin:

<img src="pictures/pulse_train.png">

What happens when the pulses to the left and right of the centre pulse become less and less frequent? That is what happens when $T \to \infty$?

+++ {"slideshow": {"slide_type": "subslide"}}

#### Well?

* As $T\to \infty$ the fundamental frequency $\Omega_0 \to 0$
* We are then left with just one pulse centred around $t=0$.
* The frequency difference between harmonics also becomes smaller.
* Line spectrum becomes a continous function.

This result is the basis of the *Fourier Transform* which is coming next.

+++ {"slideshow": {"slide_type": "slide"}}

## Power in Periodic Signals

+++ {"slideshow": {"slide_type": "subslide"}}

In your previous courses you may have come across the definitions of Signal Energy, Average Signal Power and Root Mean Square Power:

$$E = \int_0^T |f(t)|^2 dt$$

$$P_{\mathrm{av}} = \frac{1}{T}\int_0^T |f(t)|^2 dt$$

$$P_{\mathrm{RMS}} = \sqrt{\frac{1}{T}\int_0^T |f(t)|^2 dt}$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Parseval's Theorem

[Parseval's Theorem](https://en.wikipedia.org/wiki/Parseval's_theorem) states that the total average power of a periodic signal $f(t)$ is equal to the sum of the average powers of all its harmonic components.

The power in the $k$th harmonic $C_ke^{jk\Omega_0 t}$ is given by

$$P_k = \frac{1}{T}\int_0^T\left|C_ke^{jk\Omega_0 t}\right|^2\,dt = \frac{1}{T}\int_0^T\left|C_k\right|^2\,dt=\left|C_k\right|^2$$

Since $P_k = P_{-k}$, the total power of the $k$th harmomic is $2P_k$.

+++ {"slideshow": {"slide_type": "notes"}}

You should note that $|C_k| = \sqrt{C_k C_k^*}$ so $|C_k|^2 = C_k C_k^*$.

+++ {"slideshow": {"slide_type": "subslide"}}

Parseval's theorem states that

$$P = \frac{1}{T}\int_0^T \left|f(t)\right|^2\,dt = \sum_{k=-\infty}^{\infty}\left|C_k\right|^2.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### RMS Power

By a similar argument:

$$P_{\mathrm{RMS}} = \sqrt{\frac{1}{T}\int_0^T \left|f(t)\right|^2\,dt} = \sqrt{\sum_{k=-\infty}^{\infty}\left|C_k\right|^2}.$$

+++ {"slideshow": {"slide_type": "slide"}}

### Example 5

Compute the average power of a pulse train for which the pulse width is $T/2$ (duty cycle 50%). Use the previous result: 

$$C_n = \frac{A}{w}.\frac{\sin(k\pi/w)}{k\pi/w}$$

as your starting point.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "slide"}}

### Power Spectrum

The *power spectrum* of signal is the sequence of average powers in each complex harmonic: 

$$|C_k|^2.$$ 

For real periodic signals the power spectrum is a real even sequence as 

$$|C_{-k}|^2 = |C_k^*|^2 = |C_k|^2.$$

```{code-cell}
clear all
cd ../matlab
format compact
imatlab_export_fig('print-svg')  % Static svg figures.
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
A = 1; w = 8; [f,omega] = pulse_fs(A,w,15);
```

Power spectrum

```{code-cell}
stem(omega,abs(f).^2)
title('Power Spectrum for pulse width T/8')
ylabel('|C_k|^2')
xlabel('\Omega_0 [rad/s]')
```

+++ {"slideshow": {"slide_type": "notes"}}

Note that most of the power is concentrated at DC and in the first seven harmonic components. That is in the frequency range $[-14\pi/T,+14\pi/T]$ rad/s.

+++ {"slideshow": {"slide_type": "slide"}}

### Total Harmonic Distortion

Suppose that a signal that is supposed to be a pure sine wave of amplitude A is distorted as shown below

<img src="pictures/thd.png">

+++ {"slideshow": {"slide_type": "notes"}}

This can occur in the line voltages of an industrial plant that makes heavy use of nonlineear loads such as electric arc furnaces, solid state relays, motor drives, etc (E.g. Tata Steel!)

+++ {"slideshow": {"slide_type": "subslide"}}

#### THD Defined

Clearly, some of the harmonics for $k\ne \pm 1$ are nonzero. One way to characterize the distortion is to compute the ratio of average power in all the harmonics that "should not be present", that is for $k > 1$, to the total average power of the distorted sine wave. The square-root of this ratio is called the *total harmonic distortion* (THD) of the signal.

+++ {"slideshow": {"slide_type": "subslide"}}

If the signal is real and based on a sine wave (that is *odd*), then $C_k=0$ and

$$f_{\mathrm{RMS}}=\sqrt{\sum_{k=1}^{\infty}2|C_k|^2}$$

and we can define the THD as the ratio of the RMS value for all the harmonics for $K>1$ (the distortion) to the RMS of the fundamental which is $$\sqrt{2\left|C_1\right|^2}:$$

$${\rm{THD}} = 100\sqrt {\frac{\sum\limits_{k = 2}^\infty  {\left| C_k \right|^2}} {\left| C_1 \right|^2}} \% $$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Computation of THD

<img src="pictures/thd_ps.png">

+++ {"slideshow": {"slide_type": "slide"}}

## Steady-State Response of an LTI System to a Periodic Signal

The response of an LTI system with impulse response $h(t)$ to a complex exponential signal $e^{st}$ is the same complex exponential multiplied by a complex gain: $y(t) = H(s)e^{st}$, where:

$$H(s)=\int_{-\infty}^{\infty}h(\tau)e^{-s\tau}\,d\tau.$$

+++ {"slideshow": {"slide_type": "subslide"}}

In particular, for $s = j\omega$, the output is simply $y(t)=H(j\omega)e^{j\omega t}$.

The complex functions $H(s)$ and $H(j\omega)$ are called the system's *transfer function* and *frequency response*, respectively.

+++ {"slideshow": {"slide_type": "subslide"}}

### By superposition

The output of an LTI system to a periodic function with period $T$ represented by a Fourier series is given by:

$$y(t)=\sum_{k=-\infty}^{\infty} C_kH(jk\Omega_0)e^{jk\Omega_0 t}$$

where $\Omega_0 = T/2\pi$ is the fundamental frequency.

+++ {"slideshow": {"slide_type": "subslide"}}

Thus $y(t)$ is a Fourier series itself with coefficients $D_k$:

$$D_k = C_kH(jk\Omega_0)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Implications of this important result

The effect of an LTI system on a periodic input signal is to modify its Fourier series through a multiplication by its frequency response evaluated at the harmonic frequencies.

+++ {"slideshow": {"slide_type": "subslide"}}

### Illustration

This picture below shows the effect of an LTI system on a periodic input in the frequency domain.

<img src="pictures/filter.png">

+++ {"slideshow": {"slide_type": "subslide"}}

### Filtering

A consequence of the previous result is that we can design a system that has a desirable frequency spectrum $H(jk\Omega_0)$ that retains certain frequencies and cuts off others.

We will return to this idea later.

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

* Line spectra
* Power in periodic signals
* Steady-state response of an LTI system to a periodic signal
