---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: MATLAB
  language: matlab
  name: imatlab
---

+++ {"slideshow": {"slide_type": "slide"}}

# Worksheet 17 

## To accompany [Models of Discrete-Time Systems](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/dt_models.html)

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet17.pdf). We will step through this worksheet in class. 

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 17** in the **Week 9: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 

You are expected to have at least watched the video presentation of [Models of Discrete-Time Systems](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/dt_models) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

After class, the lecture recording and the annotated version of the worksheets will be made available through Canvas.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

+++ {"slideshow": {"slide_type": "fragment"}}

* Discrete Time Systems ([Notes](dt_models.html#dts))

+++ {"slideshow": {"slide_type": "fragment"}}

* Transfer Functions in the Z-Domain ([Notes](dt_models.html#tf))

+++ {"slideshow": {"slide_type": "fragment"}}

* [Modelling digital systems in MATLAB/Simulink](simulink)

+++ {"slideshow": {"slide_type": "fragment"}}

* [Converting Continuous Time Systems to Discrete Time Systems](cse)

+++ {"slideshow": {"slide_type": "fragment"}}

* [Example: Digital Butterworth Filter](demo)

+++ {"slideshow": {"slide_type": "slide"}}

## Discrete Time Systems

In the lecture that introduced the z-transform we talked about the representation of a discrete-time (DT) system by the model shown below:

![Model of a DT system](./pictures/ct-to-dt.png)

In this session, we want to explore the contents of the central block.

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

$$\frac{H(z)}{z} = \frac{z + 1}{z^2 + 0.5 z + 0.125}$$

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">



















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

##### MATLAB Solution

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
clear all
imatlab_export_fig('print-svg')  % Static svg figures.
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

```{code-cell} matlab
Nz = [1 1 0];
```

+++ {"slideshow": {"slide_type": "fragment"}}

Denominator $z^2 - 0.5 z + 0.125$

```{code-cell} matlab
Dz = [1 -0.5 0.125];
```

+++ {"slideshow": {"slide_type": "subslide"}}

###### Poles and residues

```{code-cell} matlab
[r,p,k] = residue(Nz,Dz)
```

+++ {"slideshow": {"slide_type": "subslide"}}

###### Impulse Response

```{code-cell} matlab
Hz = tf(Nz,Dz,-1)
hn = impulse(Hz, 15);
```

+++ {"slideshow": {"slide_type": "subslide"}}

###### Plot the response

```{code-cell} matlab
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

```{code-cell} matlab
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

$$\begin{array}{lcl}
Y(z) = H(z){U_0}(z) &=& \frac{z^2 + z}{z^2 + 0.5z + 0.125}.\frac{z}{z - 1}\\
 & = & \frac{z(z^2 + z)}{(z^2 + 0.5z + 0.125)(z - 1)}
\end{array}$$

+++ {"slideshow": {"slide_type": "subslide"}}

$$\frac{Y(z)}{z} = \frac{z^2 + z}{(z^2 + 0.5 z + 0.125)(z - 1)}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Solved by inverse Z-transform.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">



















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB Solution

See [dtm_ex1_3.mlx](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm_ex1_3.mlx). (Also available as [dtm_ex1_3.m](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm_ex1_3.m).)

```{code-cell} matlab
open dtm_ex1_3
```

+++ {"slideshow": {"slide_type": "notes"}}

##### Results

![Results](./pictures/dtm_ex1_3_1.png)

+++ {"slideshow": {"slide_type": "slide"}}

(simulink)=
## Modelling DT systems in MATLAB and Simulink

+++ {"slideshow": {"slide_type": "fragment"}}

We will consider some examples in class

+++ {"slideshow": {"slide_type": "subslide"}}

### MATLAB

Code extracted from [dtm_ex1_3.m](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/dtm_ex1_3.m):

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
Ts = 1;
z = tf('z', Ts);
```

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
Hz = (z^2 + z)/(z^2 - 0.5 * z + 0.125)
```

```{code-cell} matlab
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

```{code-cell} matlab
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

+++ {"slideshow": {"slide_type": "subslide"}}

### Continuous System Equivalents

* There is no digital system that uniquely represents a continuous system
* This is because as we are sampling, we only have knowledge of signals being processed at the sampling instants, and need to *reconstruct* the inter-sample behaviour.
* In practice, only a small number of transformations are used.
* The derivation of these is beyond the scope of this module, but here we'll demonstrate the ones that MATLAB provides in a function called `c2d`

+++ {"slideshow": {"slide_type": "subslide"}}

### MATLAB c2d function

Let's see what the help function says:

```{code-cell} matlab
---
slideshow:
  slide_type: notes
---
help c2d
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

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
wc = 2*pi*20e3
```

+++ {"slideshow": {"slide_type": "fragment"}}

$$\omega_c = 125.66\times 10^3\;\mathrm{rad/s}$$

+++ {"slideshow": {"slide_type": "subslide"}}

From the lecture on filters, we know the 2nd-order butterworth filter has transfer function:

$$H(s) = \frac{Y(s)}{U(s)} = \frac{\omega _c^2}{s^2 + \omega _c\sqrt 2 \,s + \omega _c^2}$$

+++ {"slideshow": {"slide_type": "fragment"}}

Substituting for $\omega_c = 125.6637\times 10^3 $ this is ...?

```{code-cell} matlab
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

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
bode(Hs,{1e4,1e8})
grid
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Sampling Frequency

From the bode diagram, the frequency roll-off is -40 dB/decade for frequencies $\omega \gg \omega_c$. So, $|H(j\omega)| = -80$&nbsp;dB  is approximately 2 decades above $\omega_c$. 

```{code-cell} matlab
w_stop = 100*wc
```

+++ {"slideshow": {"slide_type": "subslide"}}

To avoid aliasing, we should choose a sampling frequency twice this = ?

+++ {"slideshow": {"slide_type": "fragment"}}

$\omega_s = 2\times 12.6\times 10^6$&nbsp;rad/s.

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
ws = 2 * w_stop
```

+++ {"slideshow": {"slide_type": "subslide"}}

So

$\omega_s = 25.133\times 10^6$&nbsp;rad/s.

+++ {"slideshow": {"slide_type": "fragment"}}

Sampling frequency ($f_s$) in Hz  = ?

+++ {"slideshow": {"slide_type": "fragment"}}

$$f_s = \omega_s/(2\pi)\;\mathrm{Mhz}$$

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
fs = ws/(2*pi)
```

+++ {"slideshow": {"slide_type": "subslide"}}

$$f_s = 40.11\;\mathrm{Mhz}$$

Sampling time $T_s = ?$

+++ {"slideshow": {"slide_type": "fragment"}}

$T_s = 1/fs\;\mathrm{s}$

```{code-cell} matlab
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

```{code-cell} matlab
Hz = c2d(Hs, Ts)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Step response

```{code-cell} matlab
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
y[n] = 1.956y[n - 1] - 0.9665y[n - 2] + 486.2 \times {10^{ - 6}}u[n - 1] + ...\\
\quad 479.1 \times {10^{ - 6}}u[n - 2]
\end{array}$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Block Diagram of the digital BW filter

![digital filter](pictures/digifilter-bd.png)

+++ {"slideshow": {"slide_type": "subslide"}}

#### As Simulink Model

[digifilter.slx](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/matlab/digifilter.slx)

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
open digifilter
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Convert to code

To implement:

$$y[n] = 1.956 y[n-1] - 0.9665 y[n - 2] + 486.2\times 10^{-6} u[n-1] + 479.1\times 10^{-6} u[n-2]$$

+++ {"slideshow": {"slide_type": "subslide"}}

    /* Initialize */
    Ts = 0.25e-06; /* more probably some fraction of clock speed */
    ynm1 = 0; ynm2 = 0; unm1 = 0; unm2 = 0;
    while (true) {
        un = read_adc;
        yn = 1.956*ynm1 - 0.9665*ynm2 + 479.1e-6*unm1 + 476.5e-6*unm2;
        write_dac(yn);
        /* store past values */
        ynm2 = ynm1; ynm1 = yn;
        unm2 = unm1; unm1 = un;
        wait(Ts);
    }
