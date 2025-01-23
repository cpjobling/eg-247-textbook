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

(ws4)=

# Worksheet 4

## To accompany Unit 3.3 Computing Line Spectra

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet4.pdf). We will step through this worksheet in class.

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 4** in the **Week 4: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote.

You are expected to have at least watched the video presentation of {ref}`exp_fs2` of the [notes](https://cpjobling.github.io/eg-247-textbook/) before coming to class. If you haven't watch it afterwards!

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

- The pulse duration is $T/w$.
- The recurrence interval $T$ is $w$ times the pulse duration.
- $w$ is the ratio of pulse repetition time to the pulse duration &ndash; normally called the _duty cycle_.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Coefficients of the Exponential Fourier Series?

Given

$$C_k = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(\theta) e^{-jk\theta}\,d\theta$$

- Is the function **even** or **odd**?
- Does the signal have **half-wave symmetry**?
- What are the consequencies of symmetry on the form of the coefficients $C_k$?
- What function do we actually need to integrate to compute $C_k$?

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

- Recall pulse width = $T/w$

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

- As the width of the pulse **reduces** the width of the freqency spectra needed to fully describe the signal **increases**
- more bandwidth is needed to transmit the pulse.

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

- As $T\to \infty$ the fundamental frequency $\Omega_0 \to 0$
- We are then left with just one pulse centred around $t=0$.
- The frequency difference between harmonics also becomes smaller.
- Line spectrum becomes a continous function.

This result is the basis of the _Fourier Transform_ which is coming soon.
