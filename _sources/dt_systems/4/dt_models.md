---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.0
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

# Models of Discrete-Time Systems

+++ {"slideshow": {"slide_type": "skip"}}

## Colophon

An annotatable worksheet for this presentation is available as [**Worksheet 17**](worksheet17).

* The [Jupytext](https://jupytext.readthedocs.io/en/latest/index.html) source code for this page is [dt_systems/4/dt_models.md](https://github.com/cpjobling/eg-247-textbook/blob/master/dt_systems/4/dt_models.ipynb).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/dt_models.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/dt_models.pdf) file.

+++ {"slideshow": {"slide_type": "slide"}}

## Scope and Background Reading

In this section we will explore digital systems and learn more about the z-transfer function model.

The material in this presentation and notes is based on Chapter 9 (Starting at [Section 9.7](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=363)) of {cite}`karris`. I have skipped the section on digital state-space models.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

+++ {"slideshow": {"slide_type": "fragment"}}

* [Discrete Time Systems](dtsystems)

+++ {"slideshow": {"slide_type": "fragment"}}

* [Transfer Functions in the Z-Domain](tf)

+++ {"slideshow": {"slide_type": "fragment"}}

* [Modelling digital systems in Matlab/Simulink](simulink)

+++ {"slideshow": {"slide_type": "fragment"}}

* [Converting Continuous Time Systems to Discrete Time Systems](cse)

+++ {"slideshow": {"slide_type": "fragment"}}

* [Example: Digital Butterworth Filter](demo)

+++ {"slideshow": {"slide_type": "slide"}}

(dtsystems)=
## Discrete Time Systems

In the lecture that introduced the z-transform we talked about the representation of a discrete-time (DT) system by the model shown below:

![DT System](./pictures/ct-to-dt.png)

In this session, we want to explore the contents of the central block.

+++ {"slideshow": {"slide_type": "subslide"}}

### DT System as a Sequence Processor

* As noted in the previous slide, the discrete time system (DTS) `takes as an input the sequence $x_d[n]$<sup>1</sup> which in a physical signal would be obtained by sampling the continuous time signal $x(t)$ using an analogue to digital converter (ADC).

+++ {"slideshow": {"slide_type": "fragment"}}

* It produces another sequence $y_d[n]$ by *processing* the input sequence in some way.

+++ {"slideshow": {"slide_type": "fragment"}}

* The output sequence is converted into an analogue signal $y(t)$ by a digital to analogue converter (DAC).

+++ {"slideshow": {"slide_type": "fragment"}}

![DT System as a Sequence Processor](./pictures/sigs.png)

+++ {"slideshow": {"slide_type": "subslide"}}

### What is the nature of the DTS?

* The discrete time system (DTS) is a block that converts a sequence $x_d[n]$ into another sequence $y_d[n]$

+++ {"slideshow": {"slide_type": "fragment"}}

* The transformation will be a *difference equation* $h[n]$

+++ {"slideshow": {"slide_type": "fragment"}}

* By analogy with CT systems, $h[n]$ is the impulse response of the DTS, and $y[n]$ can be obtained by *convolving* $h[n]$ with $x_d[n]$ so:

$$y_d[n] = h[n] * x_d[n]$$

+++ {"slideshow": {"slide_type": "subslide"}}

* Taking the z-transform of $h[n]$ we get $H(z)$, and from the transform properties, convolution of the signal $x_d[n]$ by system $h[n]$ will be *multiplication* of the z-transforms:

$$Y_d(z) = H(z) X_d(z)$$

+++ {"slideshow": {"slide_type": "fragment"}}

* So, what does $h[n]$ and therefore $H(z)$ look like?

+++ {"slideshow": {"slide_type": "slide"}}

(tf)=
## Transfer Functions in the Z-Domain

Let us assume that the sequence transformation is a *difference equation* of the form<sup>2</sup>:

$$\begin{array}{l}
y[n] + {a_1}y[n - 1] + {a_2}y[n - 2] +  \cdots  + {a_k}y[n - k]\\
\quad  = {b_0}x[n] + {b_1}u[n - 1] + {b_2}u[n - 2] +  \cdots  + {b_k}u[n - k]
\end{array}$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Take Z-Transform of both sides

From the z-transform properties

$$f[n-m] \Leftrightarrow z^{-m}F(z)$$

so....

+++ {"slideshow": {"slide_type": "fragment"}}

$$Y(z) + a_1z^{-1}Y(z) + a_2z^{-2}Y(z) + \cdots + a_kz^{-k}Y(z) = ...$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$b_0 U(z) + b_1z^{-1}U(z) + b_2z^{-2}U(z) + \cdots + b_kz^{-k}U(z)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Gather terms

$$\begin{array}{l}
\left( 1 + {a_1} z^{-1} + {a_2} z^{-2} +  \cdots {a_k} z^{-k} \right)Y(z) = \\
\quad \left( b_0 + b_1 z^{-1} + b_2 z^{- 2} +  \cdots b_k z^{- k} \right)U(z)
\end{array}$$

from which ...

+++ {"slideshow": {"slide_type": "fragment"}}

$$Y(z) = \left(\frac{b_0 + b_{1}z^{-1} + b_{2}z^{-2} + \cdots b_{k}z^{-k}}{1 + a_{1}z^{-1} + a_{2}z^{-2} + \cdots a_{k}z^{-k}
}\right) U(z)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Define the transfer function

We define the *discrete time transfer function* $H(z) := Y(z)/U(z)$ so...

+++ {"slideshow": {"slide_type": "fragment"}}

$$H(z) = \frac{Y(z)}{U(z)} = \frac{b_0 + b_{1}z^{-1} + b_{2}z^{-2} + \cdots b_{k}z^{-k}}{1 + a_{1}z^{-1} + a_{2}z^{-2} + \cdots a_{k}z^{-k}
}$$

+++ {"slideshow": {"slide_type": "fragment"}}

... or more conventionally<sup>3</sup>:

$$H(z) = \frac{b_0z^k + b_{1}z^{k-1} + b_{2}z^{k-2} + \cdots b_{k-1}z + b_{k}}{z^k + a_{1}z^{k-1} + a_{2}z^{k-2} + \cdots a_{k-1} z + a_{k}}$$

+++ {"slideshow": {"slide_type": "subslide"}}

### DT impulse response

The *discrete-time impulse reponse* $h[n]$ is the response of the DT system to the input $x[n] = \delta[n]$

+++ {"slideshow": {"slide_type": "fragment"}}

Last week we showed that 

$$\mathcal{Z}\left\{\delta[n]\right\}$$

was defined by the transform pair 

$$\delta[n] \Leftrightarrow 1$$

+++ {"slideshow": {"slide_type": "subslide"}}

so 

$$h[n] = \mathcal{Z}^{-1}\left\{H(z).1\right\} = \mathcal{Z}^{-1}\left\{H(z)\right\}$$

+++ {"slideshow": {"slide_type": "subslide"}}

We will work through an example in class.

[Skip next slide in Pre-Lecture]

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 5

Karris Example 9.10:

The difference equation describing the input-output relationship of a DT system with zero initial conditions, is:

$$y[n] - 0.5 y[n-1] + 0.125 y[n-2] = x[n] + x[n -1]$$

+++ {"slideshow": {"slide_type": "subslide"}}

Compute:

1. The transfer function $H(z)$
2. The DT impulse response $h[n]$
3. The response $y[n]$ when the input $x[n]$ is the DT unit step $u_0[n]$

+++ {"slideshow": {"slide_type": "subslide"}}

#### 5.1. The transfer function

$$H(z) = \frac{Y(z)}{U(z)} = ...?$$

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">



















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### 5.2. The DT impulse response

Start with:

$$\frac{H(z)}{z} = \frac{z + 1}{z^2 - 0.5 z + 0.125}$$

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">



















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

##### Matlab Solution

```{code-cell}
---
slideshow:
  slide_type: skip
---
clear all
cd matlab
pwd
format compact
```

+++ {"slideshow": {"slide_type": "fragment"}}

See [dtm_ex1_2.mlx](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm_ex1_2.mlx). (Also available as [dtm_ex1_2.m](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm_ex1_2.m).)

+++ {"slideshow": {"slide_type": "subslide"}}

The difference equation describing the input-output relationship of the DT system with zero initial conditions, is:

$$y[n] - 0.5 y[n-1] + 0.125 y[n-2] = x[n] + x[n -1]$$

+++ {"slideshow": {"slide_type": "subslide"}}

###### Transfer function

Numerator $z^2 + z$

```{code-cell}
Nz = [1 1 0];
```

+++ {"slideshow": {"slide_type": "fragment"}}

Denominator $z^2 - 0.5 z + 0.125$

```{code-cell}
Dz = [1 -0.5 0.125];
```

+++ {"slideshow": {"slide_type": "subslide"}}

###### Poles and residues

```{code-cell}
[r,p,k] = residue(Nz,Dz)
```

+++ {"slideshow": {"slide_type": "subslide"}}

###### Impulse Response

```{code-cell}
Hz = tf(Nz,Dz,1)
hn = impulse(Hz, 15);
```

+++ {"slideshow": {"slide_type": "subslide"}}

###### Plot the response

```{code-cell}
---
slideshow:
  slide_type: '-'
---
stem([0:15], hn)
grid
title('Example 5 - Part 2')
xlabel('n')
ylabel('Impulse response h[n]')
```

+++ {"slideshow": {"slide_type": "subslide"}}

###### Response as stepwise continuous y(t)

```{code-cell}
impulse(Hz,15)
grid
title('Example 5 - Part 2 - As Analogue Signal')
xlabel('nTs [s]')
ylabel('Impulse response h(t)')
```

+++ {"slideshow": {"slide_type": "slide"}}

#### 5.3. The DT step response

$$Y(z) = H(z)X(z)$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$u_0[n] \Leftrightarrow \frac{z}{z - 1}$$

+++ {"slideshow": {"slide_type": "subslide"}}

We will work through this example in class.

[Skip next slide in Pre-Lecture]

+++ {"slideshow": {"slide_type": "subslide"}}

$$\begin{eqnarray*}
Y(z) = H(z){U_0}(z) &=& \frac{z^2 + z}{z^2 - 0.5z + 0.125}.\frac{z}{z - 1}\\
 & = & \frac{z(z^2 + z)}{(z^2 - 0.5z + 0.125)(z - 1)}
\end{eqnarray*}$$

+++ {"slideshow": {"slide_type": "subslide"}}

$$\frac{Y(z)}{z} = \frac{z^2 + z}{(z^2 + 0.5 z + 0.125)(z - 1)}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Solved by inverse Z-transform.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">



















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

##### Matlab Solution

See [dtm_ex1_3.mlx](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm_ex1_3.mlx). (Also available as [dtm_ex1_3.m](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm_ex1_3.m).)

```{code-cell}
open dtm_ex1_3
```

+++ {"slideshow": {"slide_type": "notes"}}

###### Results

![Results](./pictures/dtm_ex1_3_1.png)

+++ {"slideshow": {"slide_type": "slide"}}

(simulink)=
## Modelling DT systems in MATLAB and Simulink

+++ {"slideshow": {"slide_type": "fragment"}}

We will consider some examples in class

+++ {"slideshow": {"slide_type": "subslide"}}

### MATLAB

Code extracted from [dtm_ex1_3.m](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm_ex1_3.m):

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Ts = 1;
z = tf('z', Ts);
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Hz = (z^2 + z)/(z^2 - 0.5 * z + 0.125)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
step(Hz)
grid
title('Example 1 - Part 3 - As Analogue Signal')
xlabel('nTs [s]')
ylabel('Step response y(t)')
axis([0,15,0,3.5])
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Simulink Model

See [dtm.slx](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm.slx):

![Simulink model](./pictures/simulink_model.png)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
dtm
```

+++ {"slideshow": {"slide_type": "notes"}}

#### Results

![Simulink results](./pictures/scope.png)

+++ {"slideshow": {"slide_type": "slide"}}

(cse)=
## Converting Continuous Time Systems to Discrete Time Systems

In analogue electronics, to implement a filter we would need to resort to op-amp circuits with resistors, capacitors and inductors acting as energy dissipation, storage and release devices.

+++ {"slideshow": {"slide_type": "subslide"}}

* In modern digital electronics, it is often more convenient to take the original transfer function $H(s)$ and produce an equivalent $H(z)$.

+++ {"slideshow": {"slide_type": "fragment"}}

* We can then determine a *difference equation* that will respresent $h[n]$ and implement this as *computer algorithm*.

+++ {"slideshow": {"slide_type": "fragment"}}

* Simple storage of past values in memory becomes the repository of past state rather than the integrators and derivative circuits that are needed in the analogue world.

+++ {"slideshow": {"slide_type": "subslide"}}

To achieve this, all we need is to be able to do is to *sample* and *process* the signals quickly enough to avoid violating Nyquist-Shannon's sampling theorem.

+++ {"slideshow": {"slide_type": "subslide"}}

### Continuous System Equivalents

* There is no digital system that uniquely represents a continuous system
* This is because as we are sampling, we only have knowledge of signals being processed at the sampling instants, and need to *reconstruct* the inter-sample behaviour.
* In practice, only a small number of transformations are used.
* The derivation of these is beyond the scope of this module, but **in class** we'll demonstrate the ones that MATLAB provides in a function called `c2d`

+++ {"slideshow": {"slide_type": "subslide"}}

### MATLAB c2d function

Let's see what the help function says:

```{code-cell}
---
slideshow:
  slide_type: notes
---
help c2d
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
doc c2d
```

+++ {"slideshow": {"slide_type": "subslide"}}

(demo)=
## Example: Digital Butterworth Filter

* Design a 2nd-order butterworth low-pass anti-aliasing filter with transfer function $H(s)$ for use in sampling music. 
* The cut-off frequency $\omega_c = 20$&nbsp;kHz and the filter should have an attenuation of at least $-80$&nbsp;dB in the stop band. 
* Choose a suitable sampling frequency for the audio signal and give the transfer function $H(z)$ and an algorithm to implement $h[n]$

+++ {"slideshow": {"slide_type": "subslide"}}

### Solution

See [digi_butter.mlx](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/digi_butter.mlx).

+++ {"slideshow": {"slide_type": "subslide"}}

First determine the cut-off frequency $\omega_c$

$$\omega_c = 2\pi f_c = 2\times \pi \times 20\times 10^3\;\mathrm{rad/s}$$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
wc = 2*pi*20e3
```

+++ {"slideshow": {"slide_type": "fragment"}}

$$\omega_c = 125.6637\times 10^3\;\mathrm{rad/s}$$

+++ {"slideshow": {"slide_type": "subslide"}}

From the lecture on filters, we know the 2nd-order butterworth filter has transfer function:

$$H(s) = \frac{Y(s)}{U(s)} = \frac{\omega _c^2}{s^2 + \omega _c\sqrt 2 \,s + \omega _c^2}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Substituting for $\omega_c = 125.6637\times 10^3 $ this is ...?

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Hs = tf(wc^2,[1 wc*sqrt(2), wc^2])
```

+++ {"slideshow": {"slide_type": "subslide"}}

$$H(s) = \frac{15.79 \times 10^9}{s^2 + 177.7 \times 10^3 s + 15.79 \times 10^9}$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Bode plot

MATLAB:

```{code-cell}
---
slideshow:
  slide_type: subslide
---
doc bode
bode(Hs,{10e4,10e8})
grid
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Sampling Frequency

From the bode diagram, the frequency roll-off is -40 dB/decade for frequencies $\omega \gg \omega_c$. So, $|H(j\omega)| = -80$&nbsp;dB  is approximately 2 decades above $\omega_c$.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
w_stop = 100*wc
```

+++ {"slideshow": {"slide_type": "subslide"}}

To avoid aliasing, we should choose a sampling frequency twice this = ?

+++ {"slideshow": {"slide_type": "fragment"}}

$\omega_s = 2\times \omega_\mathrm{stop}$&nbsp;rad/s.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
ws = 2* w_stop
```

+++ {"slideshow": {"slide_type": "subslide"}}

Sampling frequency ($f_s$) in Hz  = ?

+++ {"slideshow": {"slide_type": "fragment"}}

$$f_s = \omega_s/(2\pi)\;\mathrm{Mhz}$$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
fs = ws/(2*pi)
```

+++ {"slideshow": {"slide_type": "subslide"}}

$$f_s = 4\;\mathrm{Mhz}$$

Sampling time $T_s = ?$

+++ {"slideshow": {"slide_type": "fragment"}}

$T_s = 1/fs\;\mathrm{s}$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Ts = 1/fs
```

+++ {"slideshow": {"slide_type": "subslide"}}

$$T_s = 1/f_s = 0.25\;\mu\mathrm{s}$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Digital Butterworth

zero-order-hold equivalent

```{code-cell}
Hz = c2d(Hs, Ts)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Step response

```{code-cell}
---
slideshow:
  slide_type: fragment
---
step(Hz)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Algorithm

From previous result:

$$H(z) = \frac{Y(z)}{U(z)} = \frac{486.2\times 10^{-6}z +  479.1\times 10^{-6}}{z^2 - 1.956z + 0.9665}$$

Dividing top and bottom by $z^2$ ...

+++ {"slideshow": {"slide_type": "fragment"}}

$$H(z) = \frac{Y(z)}{U(z)} = \frac{486.2\times 10^{-6}z^{-1} +  479.1\times 10^{-6}z^{-2}}{1 - 1.956z^{-1} + 0.9665z^{-2}}$$

+++ {"slideshow": {"slide_type": "subslide"}}

expanding out ...

$$\begin{array}{l}
Y(z) - 1.956{z^{ - 1}}Y(z) + 0.9665{z^{ - 2}}Y(z) = \\
\quad 486.2 \times {10^{ - 6}}{z^{ - 1}}U(z) + 479.1 \times {10^{ - 6}}{z^{ - 2}}U(z)
\end{array}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Inverse z-transform gives ...

$$\begin{array}{l}
y[n] - 1.956y[n - 1] + 0.9665y[n - 2] = \\
\quad 486.2 \times {10^{ - 6}}u[n - 1] + 479.1 \times {10^{ - 6}}u[n - 2]
\end{array}$$

+++ {"slideshow": {"slide_type": "fragment"}}

in algorithmic form (compute $y[n]$ from past values of $u$ and $y$) ...

$$\begin{array}{l}
y[n] = 1.956[n - 1] - 0.9665y[n - 2] + 486.2 \times {10^{ - 6}}u[n - 1] + ...\\
\quad 479.1 \times {10^{ - 6}}u[n - 2]
\end{array}$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Block Diagram of the digital BW filter


![digital filter](pictures/digifilter-bd.png)

+++ {"slideshow": {"slide_type": "subslide"}}

#### As Simulink Model

[digifilter.slx](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/digifilter.slx)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
open digifilter
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Convert to code

To implement:


$$y[n] = y[n] = 1.956[n - 1] - 0.9665y[n - 2] + 486.2 \times {10^{ - 6}}u[n - 1] + 479.1 \times {10^{ - 6}}u[n - 2]$$

+++ {"slideshow": {"slide_type": "subslide"}}

    /* Initialize */
    Ts = 0.25e-06; /* more probably some fraction of clock speed */
    ynm1 = 0; ynm2 = 0; unm1 = 0; unm2 = 0;
    while (true) {
        un = read_adc;
        yn = 1.956*ynm1 - 0.9665*ynm2 + 486.2e-6*unm1 + 479.1e-6*unm2;
        write_dac(yn);
        /* store past values */
        ynm2 = ynm1; ynm1 = yn;
        unm2 = unm1; unm1 = un;
        wait(Ts);
    }

+++ {"slideshow": {"slide_type": "notes"}}

#### Comments

PC soundcards can sample audio at 44.1 kHz so this implies that the anti-aliasing filter is much sharper than this one as $f_s/2 = 22.05$ kHz.

You might wish to find out what order butterworth filter would be needed to have $f_c = 20$ kHz and $f_{\mathrm{stop}}$ of 22.05 kHz.

+++ {"slideshow": {"slide_type": "slide"}}

## Summary

* Discrete Time Systems
* Transfer Functions in the Z-Domain
* Modelling digital systems in MATLAB/Simulink
* Continuous System Equivalents
* In-class demonstration: Digital Butterworth Filter

+++

## Reference

```{bibliography}
:filter: docname in docnames
```

+++ {"slideshow": {"slide_type": "notes"}}

## Solutions to Example 5

+++ {"slideshow": {"slide_type": "notes"}}

### Solution to 5.1.

The transfer function is

$$H(z) = \frac{Y(z)}{X(z)} = \frac{z^2 + z}{z^2 - 0.5z + 0.125}$$

+++ {"slideshow": {"slide_type": "notes"}}

### Solution to 5.2.

The DT impulse response:

$$h[n] = \left( \frac{\sqrt 2}{4} \right)^n{\left( \cos \left( \frac{n\pi}{4} \right) + 5\sin \left( \frac{n\pi}{4} \right) \right)}$$

+++ {"slideshow": {"slide_type": "notes"}}

### Solution to 5.3.

Step response:

$$y[n] = \left(3.2 - \left( \frac{\sqrt 2}{4} \right)^n\left( 2.2 \cos \left( \frac{n\pi}{4} \right) + 0.6\sin \left(\frac{n\pi}{4} \right) \right)\right) u_0[n]$$
