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

(unit7.2)=
# Unit 7.2: Designing Digital Filters in MATLAB

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

* The source code for this page is [filters/1/filters.md](https://github.com/cpjobling/eg-247-textbook/blob/master/filter_design/digital_filters.md).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/filter_design/digital_filters.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/filter_design/digital_filters.pdf) file.

+++ {"slideshow": {"slide_type": "notes"}}

## Scope and Background Reading

**[TODO] Write this properly**

We introduced the idea of filters in {ref}`ft4` and examined in some detail the idea of an ideal low-pass filter and an approximation to the ideal filter known and the *Butterworth* filter. We also showed how a high-pass filter, stop-band filter and and pass-band filter could be implemented by simple manipulations of the frequency response (or transfer functions) of a low-pass filter. 

An advantage of the Butterworth filter is that it has a flat response in the pass band, a consistent attenuation of -3 dB at the cut-off frequency, and a steady roll-off in the stop band. A disadvantage is that you need a high-order filter to get a fast transition between the pass-band and the stop-band.

In {ref}`demo`, we showed how an analogue 2nd-order Butterworth filter could be translated into a discrete-time (DT) system using the MATLAB function `c2d`, and we demonstrated the architecture and code that might be used to implement the digital filter.

In this unit we will explore further some of the concepts of what is called *filter design by analogue prototype*. This Unit is based on Chapter 11 of {cite}`karris`. We will illustrate the concepts using MATLAB and Simulink as appropriate on the understanding that you should be able to use the bilinear transform to convert a 2nd-order analogue proptotype into a digital filter.

+++ {"slideshow": {"slide_type": "notes"}}

## Agenda

* {ref}`unit7.2:digital`
* {ref}`unit7.2:bilinear`
* {ref}`u72:matlab_fd_tools`
* {ref}`u72:simulink`
* {ref}`u72:df_design_block`

```{code-cell}
---
slideshow:
  slide_type: slide
---
format compact
cd matlab
```

+++ {"slideshow": {"slide_type": "slide"}}

(unit7.2:digital)=
## Digital filters

A *digital filter* is a computational process (algorithm) that converts one sequence of numbers $x[n]$ representing the input, to another sequence $y[n]$ that represents the output.

+++ {"slideshow": {"slide_type": "fragment"}}

A digital filter can be used to filter out desired bands of frequency.

+++ {"slideshow": {"slide_type": "fragment"}}

Digital filters can also be used to perform other functions, such as integration, differentiation, and estimation.

+++ {"slideshow": {"slide_type": "subslide"}}

The input-output *difference equation* that relates the output and input can be expressed in the discrete-time (DT) domain as a summation of the form

$$y[n] = \sum_{i=0}^{k}b_i y[n - i]-\sum_{i=0}^{k}a_i y[n - i]$$ (eq:7.2:1)

+++ {"slideshow": {"slide_type": "fragment"}}

or, as a Z-transform as

$$G(z) = \frac{N(z)}{D(z)} = \frac{\displaystyle\sum_{i=0}^{k}b_i z^{-i}}{1 + \displaystyle\sum_{i=0}^{k}a_i z^{-i}}$$ (eq:7.2:2)

+++ {"slideshow": {"slide_type": "subslide"}}

Therefore, the design of a digital filter ro perform a desired function, entails the determination of the coefficients $b_i$ and $a_i$.

+++ {"slideshow": {"slide_type": "subslide"}}

(unit7.2:classification)=
### Classification of digital filters

Digital filters are classified in terms of the duration of the impulse response, and in terms of realization.

+++ {"slideshow": {"slide_type": "subslide"}}

#### 1. Impulse response duration

+++ {"slideshow": {"slide_type": "fragment"}}

a). An *infinite impulse response* (IIR) filter as an infinite number of samples in its impulse response $h[n]$.

+++ {"slideshow": {"slide_type": "fragment"}}

b). A *finite impulse response* (FIR) filter as an finite number of samples in its impulse response $h[n]$.

+++ {"slideshow": {"slide_type": "subslide"}}

#### 2. Realization

+++ {"slideshow": {"slide_type": "fragment"}}

a). In a *recursive realization* digital filter, the output depends on the input and the *previous* values of the output. In a recursive digital filter, both the coefficients $b_i$ and $a_i$ are present.

+++ {"slideshow": {"slide_type": "fragment"}}

b). In a *non-recursive realization* digital filter, the output depends on present and past value of the input only. In a non-recursive digital filter, only the coefficients $b_i$ are present, i.e. $a_i=0$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Implementation of digital filters

+++ {"slideshow": {"slide_type": "fragment"}}

{numref}`fig:u72:1` shows a Simulink model of a third-order (3-delay element or 3-tap) recursive realization of a digital filter[^u72:note:1]

+++ {"slideshow": {"slide_type": "notes"}}

[^u72:note:1]: Note that the block labelled $z^{-1}$ is a one unit delay $y[n] = x[n - 1]$; the triangular blocks are gains $y[n] = k x[n]$; and the circular blocks are summing points. Following the equations we have $w[n] = x[n] - a_1 w[n-1] - a_2 w[n-2] - a_3 w[n-3]$ and $y[n] = b_0 w[n] + b_1 w[n-1] + b_2 w[n-2] + b_3 w[n-3]$. It is left as an exercise for the reader to show that combining these two equations, taking Z-transforms, and eliminating $W(z)$, results in the transfer function $H(z) = Y(z)/X(z)$ given in {eq}`eq:7.2:2` and hence the difference equation of {eq}`eq:7.2:1`.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
recursive
```

+++ {"slideshow": {"slide_type": "notes"}}

:::{figure-md} fig:u72:1
<img src="pictures/recursive.png" alt="Picture of a digital filter realization in Simulink" width="100%" />

Recursive digital filter realization in Simulink
:::

+++ {"slideshow": {"slide_type": "subslide"}}

Download Simulink model [recursive.slx](matlab/nonrecursive.slx)

+++ {"slideshow": {"slide_type": "subslide"}}

{numref}`fig:u72:2` shows a Simulink model of a third-order non-recursive realization of a digital filter[^u72:note:2]

+++ {"slideshow": {"slide_type": "subslide"}}

[^u72:note:2]: It is obvious from this figure that $y[n] = b_0 x[n] + b_1 x[n-1] + b_2 x[n-2] + b_3 x[n-3]$.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
nonrecursive
```

+++ {"slideshow": {"slide_type": "notes"}}

:::{figure-md} fig:u72:2
<img src="pictures/nonrecursive.png" alt="Picture of a digital filter realization in Simulink" width="100%" />

Non-recursive digital filter realization in Simulink
:::

+++ {"slideshow": {"slide_type": "notes"}}

Download Simulink model [nonrecursive.slx](matlab/nonrecursive.slx)

+++ {"slideshow": {"slide_type": "notes"}}

Generally, IIR filters are implemented by a recursive realization, and FIR filters are implemented by a non-recursive implementation.

+++ {"slideshow": {"slide_type": "subslide"}}

### Digital filter design methods

As demonstrated in {ref}`unit7.1`, filter-design methods have been established and analogue prototypes have been published. Thus, we can choose an appropriate analogue prototype to satisfy the requirements.

+++ {"slideshow": {"slide_type": "fragment"}}

Transformation methods are also available to transform analogue prototypes into an equivalent digital filter.

+++ {"slideshow": {"slide_type": "fragment"}}

Three commonly used transformation methods are

+++ {"slideshow": {"slide_type": "subslide"}}

#### 1. The *impulse invariant method*

Produces a digital filter $H(z)$ whose impulse response consists of the sampled values of the impulse response of the equivalent analogue filter $H(s)$.

+++ {"slideshow": {"slide_type": "notes"}}

This is implemented in MATLAB by the system transformation function: `Hz = c2d(Hs,Ts,'impulse')` where `Hs` is the analogue transfer function $H(s)$, `Ts` is the sampling period, and `Hz` is the equivalent $H(z)$.

+++ {"slideshow": {"slide_type": "subslide"}}

#### 2. The *step invariant method*

Produces a digital filter $H(z)$ whose step response consists of the sampled values of the step response of the equivalent analogue filter $H(s)$.

+++ {"slideshow": {"slide_type": "subslide"}}

#### 3. The *bilinear transform method*

This uses the transformation[^u72:note:3]

$$s = \frac{2}{T_s}\cdot\frac{z-1}{z+1}$$ (eq:7.2:3)

to transform the left-half of the $s$-plane into the interior of the unit circle in the $z$-plane.

+++ {"slideshow": {"slide_type": "notes"}}

[^u72:note:3]: $T_s$ is the sampling period, that is the reciprocal of the sampling frequency $f_s$ Hz.

+++ {"slideshow": {"slide_type": "subslide"}}

In this unit, we will discuss, *and assess*, only the use of the blinear transformation.

+++ {"slideshow": {"slide_type": "slide"}}

(unit7.2:bilinear)=
## The Bilinear Transformation

We recall from {ref}`s-to-z` that since $z = e^{sT_s}$, $s = 1/T_s \log_e z$, then a DT transfor function $H(sz)$ can be determined from a CT transfer function $H(s)$ using the mapping:

$$H(z) = \left.H(s)\right|_{s = \frac{1}{T_s} \log_e z}$$ (eq:7.2:4)

+++ {"slideshow": {"slide_type": "fragment"}}

But the relation $s = 1/T_s \log_e z$ is a multi-valued transformation, and as such, cannot be used to derive a rational polynomial in $z$.

+++ {"slideshow": {"slide_type": "fragment"}}

It can be approximated as

$$s = \frac{1}{T_s} \log_e z = \frac{2}{T_s} \left[\frac{z-1}{z+1}  + \frac{1}{3} \left(\frac{z-1}{z+1} \right)^3 + \frac{1}{5} \left(\frac{z-1}{z+1} \right)^5 + \frac{1}{7} \left(\frac{z-1}{z+1} \right)^7 + \cdots\right] \approx \frac{2}{T_s} \cdot \frac{z-1}{z+1} $$ (eq:7.2:5)

+++ {"slideshow": {"slide_type": "subslide"}}

Substitution of {eq}`eq:7.2:5` into {eq}`eq:7.2:4` yields

+++ {"slideshow": {"slide_type": "fragment"}}

$$H(z) = \left.G(s)\right|_{s = \frac{2}{T_s} \cdot \frac{z-1}{z+1}} $$ (eq:7.2:6)

+++ {"slideshow": {"slide_type": "subslide"}}

(unit7.2:freqz)=
### Digital frequency response of the bilinear transformation

The digital frequency response (using $\omega_d$ on the unit circle in the $z$-plane) is obtained by the substitution $z = e^{j\omega_d T_s}$, giving

$$H\left(e^{j\omega_d T_s}\right) = G\left(\frac{2}{T_s} \cdot \frac{e^{j\omega_d T_s } - 1}{e^{j\omega_d T_s } + 1} \right) $$ (eq:7.2:7)

+++ {"slideshow": {"slide_type": "subslide"}}

Since the $z\to s$ transformation maps the unit circle on the $z$-plane into the $j\omega$ axis on the $s$-plane, the quantity

$$\frac{2}{T_s} \cdot \frac{e^{j\omega_d T_s } - 1}{e^{j\omega_d T_s} + 1}$$

and $j\omega$ must be equal to some point $\omega = \omega_a$ on the $j\omega$ axis.

+++ {"slideshow": {"slide_type": "fragment"}}

That is,

$$j\omega_a = \frac{2}{T_s} \cdot \frac{e^{j\omega_d T_s } - 1}{e^{j\omega_d T_s } + 1}$$

+++ {"slideshow": {"slide_type": "fragment"}}

or

$$\omega_a = \frac{1}{J} \cdot \frac{2}{T_s} \cdot \frac{e^{j\omega_d T_s } - 1}{e^{j\omega_d T_s } + 1} = \frac{2}{T_s}\cdot \frac{1/(j2)}{1/2} \cdot \frac{e^{j\omega_d T_s/2} - e^{-j\omega_d T_s/2}}{e^{j\omega_d T_s/2} + e^{-j\omega_d T_s/2}} = \frac{2}{T_s} \cdot \frac{\sin\left(\omega_d T_s\right)/2}{\cos\left(\omega_d T_s\right)/2} $$

+++ {"slideshow": {"slide_type": "subslide"}}

or

$$\omega_a = \frac{2}{T_s} \tan\left(\frac{\omega_d T_s}{2} \right)$$ (eq:7.2:8)

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:warping)=
### Frequency warping of the bilinear transformation

We see that the analogue frequency to digital frequency transformation results in a non-linear mapping; this condition is know as *warping*.

+++ {"slideshow": {"slide_type": "fragment"}}

For instance, the frequency range $0 \lt \omega_a \le \infty$ the analogue frequency is warped into the range $0 \le \omega_d \le \pi/T_s$ in digital frequency.

+++ {"slideshow": {"slide_type": "subslide"}}

 To express $\omega_d$ in terms of $\omega_a$, we rewrite {eq}`eq:7.2:8` as
 
 $$\tan\left(\frac{\omega_d T_s}{2} \right) = \frac{\omega_a T_s}{2} $$

+++ {"slideshow": {"slide_type": "fragment"}}

Then,

 $$\omega_d T_s  = 2 \tan^{-1}\left(\frac{\omega_a T_s}{2}\right) $$

+++ {"slideshow": {"slide_type": "fragment"}}

and for small $\omega_a T_s/2$,

$$\tan^{-1}\left(\frac{\omega_a T_s}{2}\right) \approx \frac{\omega_a T_s}{2}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Therefore,

$$\omega_d T_s \approx 2 \left(\frac{\omega_a T_s}{2}\right) \approx \omega_a T_s$$  (eq:7.2:9)

+++ {"slideshow": {"slide_type": "fragment"}}

that is, for small frequencies,

$$\omega_d \approx \omega_a$$ (eq:7.2:10)

+++ {"slideshow": {"slide_type": "subslide"}}

In MATLAB, $z$ is a function of normalized frequency and thus the range of frequencies in $H(z)$ is from $0 \to \pi$. Then {eq}`eq:7.2:9`, when used with MATLAB, becomes

$$\omega_d \approx \frac{\omega_a T_s}{\pi} $$ (eq:7.2:11)

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:pre-warping)=
### Pre-warping

The effect of warping can be eliminated by *pre-warping* the analogue filter prior to the application of the bilinear transformation. This is acomplished with the use of {eq}`eq:7.2:8`.

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:ex:12)=
#### Example 12

Compute the transfer function $H(z)$ of a low-pass filter with $3$ dB cutoff frequency at $20$ Hz, and attenuation of at least $10$ dB for frequencies greater than $40$ Hz. The sampling frequency $f_s = 200$ Hz. Compare the magnitude plot with that obtained by a low-pass analogue filter with the same specifications.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution

We will apply the bilinear transformation. We arbitrarily choose a second-order Butterworth filter which will meet the stop-band specification.

+++ {"slideshow": {"slide_type": "fragment"}}

The transfer function $H(s)$ of the analogue low-pass filter with normalized frequency at $\omega_c = 1$ rad/s is found with the MATLAB `buttap` function as follows:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
 [z,p,k] = buttap(2); [b,a] = zp2tf(z,p,k)
```

+++ {"slideshow": {"slide_type": "fragment"}}

Thus, the transfer function with noramlized frequency, denoted as $H_n(s)$, is

$$H_n(s) = \frac{1}{s^2 + 1.414 s + 1} $$ (eq:7.2:12)

+++ {"slideshow": {"slide_type": "subslide"}}

Now, we must transform this transfer function to another with actual cuttoff frequency at $20$ Hz. We donote it as $H_a(s)$.

+++ {"slideshow": {"slide_type": "subslide"}}

We will first pre-warp the analogue frequency which by relation {eq}`eq:7.2:8`, us related to the digital frequency as

$$\omega_a = \frac{2}{T_s}\tan\left(\frac{\omega_d T_s}{2} \right)$$

+++ {"slideshow": {"slide_type": "fragment"}}

where

$$T_s = \frac{1}{f_s} = \frac{1}{200}.$$

+++ {"slideshow": {"slide_type": "fragment"}}

Denoting the analogue cuttoff (3 dB) frequency as $\omega_{ac}$, we obtain

$$\omega_{ac} = 400 \tan \left(\frac{2\pi\times 20}{2\times 200} \right) = 400\tan\left(0.1\pi\right) \approx 130\,\mathrm{rad/s}$$

+++ {"slideshow": {"slide_type": "fragment"}}

or

$$f_{ac} = \frac{130}{2\pi} \approx 20.69\,\mathrm{Hz}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

As expected from relation {eq}`eq:7.2:10`, this frequency is very close to the discrete-time frequency $f_{dc} = 20$ Hz, and thus from {eq}`eq:7.2:12`,

$$H_a(s) \approx H_n(s) = \frac{1}{s^2 + 1.414 s + 1} $$ (eq:7.2:12)

+++ {"slideshow": {"slide_type": "subslide"}}

Relation {eq}`eq:7.2:12` applies only when the cutoff frequency is normalized to $\omega_c = 1$ rad/s.

+++ {"slideshow": {"slide_type": "fragment"}}

If $\omega_c \ne 1$, we must scale the transfer function in accordance with relation {eq}`eq:7.1:15`, that is,

$$H(s)_\mathrm{actual} = H\left(\frac{s}{\omega_\mathrm{actual}} \right) $$

+++ {"slideshow": {"slide_type": "fragment"}}

For this example, $\omega_\mathrm{actual} = 130$ rad/s, and thus we replace $s$ with $s/130$ and we obtain

$$H_a(s) = \frac{1}{\left(s/130\right)^2 + 1.414s/130 + 1} $$

+++ {"slideshow": {"slide_type": "subslide"}}

We will use MATLAB to simplify this expression

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms s; simplifyFraction(1/((s/130)^2 + 1.414*s/130 + 1))
845000/50
9191/50
```

+++ {"slideshow": {"slide_type": "fragment"}}

Then,

$$H_a(s) = \frac{845000}{50s^2 + 9191s + 845000} = \frac{16900}{s^2 + 183.82s + 16900} $$ (eq:7.2:13)

+++ {"slideshow": {"slide_type": "fragment"}}

and making the substitution of $s = (2/T_s)(z -1)/(z + 1) = 400(z-1)/(z + 1)$ we obtain

$$H(z) = \frac{16900}{\left(400\cdot \frac{z-1}{z + 1}\right)^2 + \frac{183.82\times 400(z-1)}{(z + 1)} + 16900} $$

+++ {"slideshow": {"slide_type": "subslide"}}

We use the MATLAB code below to simplify this expression

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms z; simplify(16900/((400*(z-1)/(z+1))^2 + 183.82*400*(z - 1)/(z + 1) + 16900))
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
expand(4225*(z + 1)^2)
```

+++ {"slideshow": {"slide_type": "fragment"}}

and thus

$$H(z) = \frac{4225z^2 + 8450z + 4225}{62607z^2 - 71550z + 25843} $$ (eq:7.2:14)

+++ {"slideshow": {"slide_type": "subslide"}}

We will used the MATLAB [`freqz`](https://uk.mathworks.com/help/signal/ref/freqz.html) function to plot the magnitude of $H(z)$, but we must first express it in negative powers of $z$.

+++ {"slideshow": {"slide_type": "fragment"}}

 Dividing each term of {eq}`eq:7.2:14` by $62607z^2$, we obtain
 
 $$\frac{0.0675 + 0.1350z^{-1} + 0.0675z^{-2}}{1 - 1.1428z^{-1} + 0.4128 z^{-2}}$$ (eq:7.2:15)

+++ {"slideshow": {"slide_type": "subslide"}}

The MATLAB script below will generate $H(z)$ and will plot the magnitude of this transfer function.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
az = [1,  -1.1428, 0.4128]; bz = [0.0675, 0.1350, 0.0675]; fs = 200; fc = 20;
[Hz, wT] = freqz(bz,az,fc,fs);
semilogx(wT,20*log10(abs(Hz))); xlabel('Frequency in Hz - log scale')
ylabel('Magnitude (dB)'), title('Digital Low-Pass Filter. Example 12'),grid
```

+++ {"slideshow": {"slide_type": "subslide"}}

We now plot the analogue equivalent to compare the digital to the analogue frequency response.

+++ {"slideshow": {"slide_type": "fragment"}}

The MATLAB script below produces the desired plot.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
[z,p,k] = buttap(2); [b, a] = zp2tf(z,p,k); f = 1:1:100; fc = 20; [bn,an] = lp2lp(b,a,fc);
Hs = freqs(bn,an,f);
semilogx(f, 20*log10(abs(Hs))), xlabel('Frequency in Hz - log scale')
ylabel('Magnitude (dB)'), title('Analogue Low-Pass Filter. Example 12'),grid
```

+++ {"slideshow": {"slide_type": "notes"}}

Comparing the digital filter plot with the equivalent analogue filter plot, we observe that the magnitude is greater than $-3$ dB for frequencies less than $20$ rad/s, and is smaller than $-10$ dB for frequencies greater than $40$ Hz. Therefore, both the digital and analogue low-pass filters meet the specified requirements.[^u72:note:4]

+++ {"slideshow": {"slide_type": "notes"}}

[^u72:note:4]: Note the significant distortion of the digital filter response at high frequencies.

+++ {"slideshow": {"slide_type": "notes"}}

(u72:matlab_bilinear)=
### MATLAB bilinear function

An analogue filter transfer function can be mapped to a digital transfer function directly with the MATLAB [`bilinear`](https://uk.mathworks.com/help/signal/ref/bilinear.html) function. The procedure is illustrated with the following example.

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:ex:13)=
#### Example 13

Use the MATLAB `bilinear` function to derive the low-pass digital transfer function $H(z)$ from a second-order Butterworth analogue filter with a $3$ dB cutoff frequency at $50$ Hz, ans sample rate $f_s = 500$ Hz.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution

We will use the following MATLAB script to produce the desired digital filter function:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
[z,p,k] = buttap(2); [num,den] = zp2tf(z,p,k); fc = 50; wc = 2*pi*fc;
[num1,den1] = lp2lp(num,den,wc);
fs = 500; [numd,dend] = bilinear(num1, den1, fs)
```

+++ {"slideshow": {"slide_type": "fragment"}}

Therefore, the transfer function $H(z)$ for this filter is

$$H(z) = \frac{0.0640 z^2  +  0.1279 z +   0.0640}{z^2   -1.1683 z +    0.4241} = \frac{0.0640  +  0.1279 z^{-1} +   0.0640 z^{-2}}{1   -1.1683 z^{-1} +    0.4241 z^{-2}}$$ (eq:7.2:16)

+++ {"slideshow": {"slide_type": "slide"}}

(u72:matlab_fd_tools)=
## MATLAB Functions for direct digital filter design

MATLAB provides us with a suite of functions that we need to design gigital filters using analogue prototypes. These are listed below.

- `N` = order of the filter

- `Wn` = normalized cutoff frequency

- `Rp` = pass band ripple

- `Rs` = stop band ripple

- `B` = $B(z)$, i.e. the numerator of the discrete transfer function $H(z) = B(z)/A(z)$

- `A` = $A(z)$, i.e. the denominator of the discrete transfer function $H(z)$

The MathWorks also provides a catalogue of filter design tools with examples in the [Filter Design Gallery](https://uk.mathworks.com/help/signal/ug/filter-design-gallery.html).

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:fd_lp)=
### For Low-Pass Filters

```matlab
[B,A] = butter(N,Wn)
[B,A] = cheb1(N,Wn)
[B,A] = cheb2(N,Wn)
[B,A] = ellip(N,Wn)
```

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:fd_hp)=
### For High-Pass Filters

```matlab
[B,A] = butter(N,Wn,'high')
[B,A] = cheb1(N,Wn,'high')
[B,A] = cheb2(N,Wn,'high')
[B,A] = ellip(N,Wn,'high')
```

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:fd_bp)=
### For Band-Pass Filters

```matlab
[B,A] = butter(N,[Wn1,Wn2])
[B,A] = cheb1(N,[Wn1,Wn2])
[B,A] = cheb2(N,[Wn1,Wn2])
[B,A] = ellip(N,[Wn1,Wn2])
```

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:fd_sb)=
### For Band-Elimination Filters

```matlab
[B,A] = butter(N,[Wn1,Wn2],'stop')
[B,A] = cheb1(N,[Wn1,Wn2],'stop')
[B,A] = cheb2(N,[Wn1,Wn2],'stop')
[B,A] = ellip(N,[Wn1,Wn2],'stop')
```

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:ex:13)=
#### Example 13

The transfer functions {eq}`eq:7.2:16` through {eq}`eq:7.2:19`, describe differet types of digital filters. Use the MATLAB `freqz` commmand to plot the magnitude versus radian frequency. What types of filter does each transfer function represent? What classes of filter are they?

+++ {"slideshow": {"slide_type": "fragment"}}

$$H_1(z) = \frac{\left(2.8982 + 8.6946z^{-1} + 8.6946z^{-2} + 2.8982z^{-3}\right)\cdot 10^{-3}}{1 - 2.3741z^{-1} + 1.9294z^{-2} - 0.5321z^{-3}} $$ (eq:7.2:16)

+++ {"slideshow": {"slide_type": "fragment"}}

$$H_2(z) = \frac{0.5276 - 1.5828z^{-1} + 1.5828z^{-2} - 0.5276z^{-3}}{1 - 1.7600z^{-1} + 1.1829z^{-2} - 0.2781z^{-3}} $$ (eq:7.2:17)

+++ {"slideshow": {"slide_type": "fragment"}}

$$H_3(z) = \frac{\left(6.8482 - 13.6964z^{-2} + 6.8482z^{-4}\right)\cdot 10^{-4}}{1 + 3.3033z^{-1} + 4.5244z^{-2} + 3.1390z^{-3} + 0.9603z^{-4}}$$ (eq:7.2:18)

+++ {"slideshow": {"slide_type": "fragment"}}

$$H_4(z) = \frac{0.9270-1.2079z^{-1}+0.9270z^{-2}}{1-1.2079z^{-1}+0.8541z^{-2}} $$ (eq:7.2:19)

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution

The MATLAB script to plot each of the transfer functions of {eq}`eq:7.2:16` through {eq}`eq:7.2:19`, is given below where N = 512, i.e. the default value.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
b1 = [2.8982, 8.6946, 8.6946, 2.8982]*10^(-3); a1 = [1, -2.3741, 1.9294, -0.5321];
[H1z,w1T] = freqz(b1, a1);
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
b2 = [0.5276, -1.5828, 1.5828, -0.5276]; a2 = [1, -1.7600, 1.1829, -0.2781];
[H2z,w2T] = freqz(b2, a2);
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
b3 = [6.8482, 0, -13.6964, 0, 6.8482]*10^(-4); a3 = [1, 3.2033, 4.5244, 3.1390, 0.9603];
[H3z,w3T] = freqz(b3, a3);
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
b4 = [0.9270, -1.2079, 0.9270]; a4 = [1, -1.2079, 0.8541];
[H4z,w4T] = freqz(b4, a4);
```

+++ {"slideshow": {"slide_type": "subslide"}}

Now do the plots

```{code-cell}
---
slideshow:
  slide_type: fragment
---
clf; % clear the current figure
subplot(221), semilogx(w1T,abs(H1z)),axis([0.1 1 0 1]),title('Filter for H1(z)')
xlabel(''),ylabel('Magnitude'),grid
%
subplot(222), semilogx(w2T,abs(H2z)),axis([0.1 10 0 1]),title('Filter for H2(z)')
xlabel(''),ylabel('Magnitude'),grid
%
subplot(223), semilogx(w3T,abs(H3z)),axis([1 10 0 1]),title('Filter for H3(z)')
xlabel(''),ylabel('Magnitude'),grid
%
subplot(224), semilogx(w4T,abs(H4z)),axis([0.1 10 0 1]),title('Filter for H4(z)')
xlabel(''),ylabel('Magnitude'),grid
```

+++ {"slideshow": {"slide_type": "notes"}}

It is clear that the filters are low-pass, high-pass, band-pass and band-stop. There is now ripple in the pass-band or stop band so they are all Butterworth filters.

+++ {"slideshow": {"slide_type": "slide"}}

(u72:simulink)=
## Digital Filter Design with Simulink

As stated earlier in this unit, a digital filter is a computational process, or algorithm, that converts one sequence of numbers representing the input signal into another sequence of numbers representing the outpit signal.

To close out this unit and the module, we will explore Simulink models that can be used to implement digital filters, and present the *Digital Filter Design* block included in the [Simulink DSP System Toolbox](https://uk.mathworks.com/help/dsp/index.html), which can generate these models automatically.

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:fd:direct_i)=
### The Direct Form I Realization of a Digital Filter

The **Direct Form I Realization** of a second-order digital filter is shown in {numref}`fig:u72:3`.

```{code-cell}
---
slideshow:
  slide_type: slide
---
dfir_df
```

+++ {"slideshow": {"slide_type": "subslide"}}

::: {figure-md} fig:u72:3
<img src="pictures/dfir_df.png" alt="Direct Form I Realization of a second-order digital filter" width="100%" />

Direct Form I Realization of a second-order digital filter
:::

Download this model as [dfir_df](matlab/dfir_df.slx).

+++ {"slideshow": {"slide_type": "subslide"}}

At the summing junction of {numref}`fig:u72:3` we obtain

$$b_0X(z)+b_1z^{-1}X(z)+b_2z^{-2}X(z) + \left(-a_1\right)z^{-1}Y(z) + \left(-a_1\right)z^{-2}Y(z) = Y(z)$$

$$X(z)\left(b_0 + b_1z^{-1} + b_2z^{-2}\right) = Y(s)\left(1 + a_1z^{-1} + a_2z^{-2}\right)$$

And thus, the transfer function of the Direct Form I Realization of the second-order digital filter of {numref}`fig:u72:3` is

$$H(z) = \frac{Y(z)}{X(z)} = \frac{b_0 + b_1z^{-1} + b_2z^{-2}}{1 + a_1z^{-1} + a_2z^{-2}} $$ (eq:7.2:17)

+++ {"slideshow": {"slide_type": "notes"}}

A disadvantage of the Direct Form I Realization digital filter is that it requires $2k$ registers where $k$ represents the order of the filter. We observe that the second-order ($k=2$) digital filter of {numref}`fig:u72:3` requires 4 delay (register) elements denoted as $z^{-1}$. However, this form of realization has the advantage that there is no possibility of internal filter overflow[^u72:notes:5].

+++ {"slideshow": {"slide_type": "notes"}}

[^u72:notes:5]: For a detailed discussion on overflow cinditions please refer to Section 10.5, Chapter 10, Page 10-6 of {cite}`karris_2005`.

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:fd:direct_ii)=
### The Direct Form II Realization of a Digital Filter

The **Direct Form II Realization**[^u72:notes:6] of a second-order digital filter is shown in {numref}`fig:u72:4`. The Simulink [**Transfer Fcn Direct Form II**](https://uk.mathworks.com/help/simulink/slref/transferfcndirectformii.html) block implements the transfer function of this filter.

+++ {"slideshow": {"slide_type": "notes"}}

[^u72:notes:6]: The Direct Form-II is also known as the **Canonical** Form.

```{code-cell}
---
slideshow:
  slide_type: slide
---
dfiir_df
```

+++ {"slideshow": {"slide_type": "subslide"}}

::: {figure-md} fig:u72:4
<img src="pictures/dfiir_df.png" alt="Direct Form II Realization of a second-order digital filter" width="100%" />

Direct Form II Realization of a second-order digital filter
:::

Download this model as [dfiir_df.slx](matlab/dfiir_df.slx).

+++ {"slideshow": {"slide_type": "subslide"}}

The transfer function for the Direct Form-II second-order digital filter of {numref}`fig:u72:4` is the same as for a Direct Form-I second-order filter of {numref}`fig:u72:4`, that is,

$$H(z) = \frac{b_0 + b_1z^{-1} + b_2z^{-2}}{1 + a_1z^{-1} + a_2z^{-2}} $$ (eq:7.2:18)

+++ {"slideshow": {"slide_type": "notes"}}

A camparison of {numref}`eq:7.2:17` and {numref}`eq:7.2:18` shows that whereas a Direct Form-I second-order digital filter requires $2k$ registers, where $k$ represents the order of the filter, a Direct Type-II second-order digital filter requires only $k$ register elements denoted as $z^{-1}$. This is because the register ($z^{-1}$) elements of the Direct Form-II realization are shared between the zeros section and the poles section.

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:ex:14)=
#### Example 14

{numref}`u72:fig:5` shows a Direct Form-II second-order digital filter whose transfer function is

$$H(z) = \frac{1+1.5z^{-1}+1.02z^{-2}}{1 - 0.25 z^{-1} -0.75 z^{-2}} $$ (eq:u72:19)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
ex14
```

+++ {"slideshow": {"slide_type": "notes"}}

::: {figure-md} fig:u72:4
<img src="pictures/ex14.png" alt="Direct Form II Realization of the Simulink implementation of Example 14" width="100%" />

Model for Example 14
:::

Download this model as [ex14.slx](matlab/ex14.slx).

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:fd:series)=

### The Series Form Realization of a Digital Filter

For the Series Form Realization, the transfer function is expressed as a product of first-order and second-orer transefer functions as shown in {eq}`eq:u72:20` below. 

$$H(z) = H_1(z)\cdot H_2(z)\cdots H_R(z)$$ (eq:u72:20)

+++ {"slideshow": {"slide_type": "fragment"}}

Relation {eq}`eq:u72:20` is implemented as the cascaded blocks shown in {numref}`fig:u72:5`

:::{figure-md} fig:u72:5
<img src="pictures/series.png" alth="Series Form Realization as cascaded blocks" width="100%" />

Series Form Realization
:::

+++ {"slideshow": {"slide_type": "subslide"}}

{numref}`fig:u72:6` shows the Series Form Realization of a second-order digital filter.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
series_form_2nd
```

+++ {"slideshow": {"slide_type": "notes"}}

:::{figure-md} fig:u72:5
<img src="pictures/series_2nd.png" alth="Series Form Realization of a second-order digital filter" width="100%" />

Series Form Realization of a second-order digital filter
:::

Download this model as [series_form_2nd.slx](matlab/series_form_2nd.slx).

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:ex:15)=
#### Example 15

The transfer function of the series form Realization of a certian second-order digital filter is

$$H(z) = \frac{0.5\left(1-0.36z^{-2}\right)}{1 + 0.1 z^{-1} - 0.72 z^{-2}} $$

+++ {"slideshow": {"slide_type": "fragment"}}

To implement this filter, we factor the numerator and denominator polynomials as[^u72:note:7]

$$H(z) = \frac{0.5\left(1+0.6z^{-1}\right)\left(1-0.6z^{-1}\right)}{\left(1+0.9z^{-1}\right)\left(1-0.8z^{-1}\right)} $$ (eq:u72:21)

+++ {"slideshow": {"slide_type": "notes"}}

[^u72:note:7]: The way we combine the numerator and denominator factors is immaterial. For example we could group the factors as $\left(1 + 0.6z^{-1}\right)/\left(1+0.9z^{-1}\right)$ and $\left(1 - 0.6z^{-1}\right)/\left(1-0.8z^{-1}\right)$, or as $\left(1 + 0.6z^{-1}\right)/\left(1-0.8z^{-1}\right)$ and $\left(1 - 0.6z^{-1}\right)/\left(1+0.9z^{-1}\right)$.

+++ {"slideshow": {"slide_type": "subslide"}}

The Simulink model and the input and output waveforms are shown in {numref}`fig:u72:6`.

+++ {"slideshow": {"slide_type": "subslide"}}

fig15

+++ {"slideshow": {"slide_type": "notes"}}

:::{figure-md} fig:u72:5
<img src="pictures/ex15.png" alt="Series Form Realization of the digital filter of Example 14" width="100%" />

Model for Example 15
:::

Download this model as [ex15.slx](matlab/ex15.slx).

+++ {"slideshow": {"slide_type": "subslide"}}

(u72:fd:parallel)=

### The Parallel Form Realization of a Digital Filter

The general form of the transfer function of a Parallel Form Realization is 

$$H(z) = K + H_1(z) + H_2(z) + \cdots + H_R(z)$$ (eq:u72:22)

+++

(u72:df_design_block)=
## The Digital Filter Design Block

+++ {"slideshow": {"slide_type": "notes"}}

(u72:exercises)=
## Exercises

+++ {"slideshow": {"slide_type": "notes"}}

(u72:ex:1)=
### Exercise 7.2.1

Use the block diagram shown in {numref}`fig:u72:1` to validate {eq}`eq:u72:2` and eq}`eq:u72:1`.

+++ {"slideshow": {"slide_type": "notes"}}

(u72:ex:2)=
### Exercise 7.2.2

Use the block diagram shown in {numref}`fig:u72:4` to validate {eq}`eq:u72:18`. Write down the equivalent difference equation.

+++ {"slideshow": {"slide_type": "notes"}}

## References

See [Bibliography](/zbib).

```{code-cell}
---
slideshow:
  slide_type: notes
---

```
