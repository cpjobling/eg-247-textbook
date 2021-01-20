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

# Worksheet 13

## To accompany Chapter 5.2 Fourier transforms of commonly occurring signals

+++ {"slideshow": {"slide_type": "subslide"}}

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet13.pdf). We will step through this worksheet in class. 

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 13** in the **Week 6: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 

You are expected to have at least watched the video presentation of [Chapter 5.2](https://cpjobling.github.io/eg-247-textbook/fourier_transform/2/ft2) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

After class, the lecture recording and the annotated version of the worksheets will be made available through Canvas.

+++ {"slideshow": {"slide_type": "slide"}}

## Reminder of the Definitions

Last time we derived the Fourier Transform by evaluating what would happen when a periodic signal was made periodic. Let us restate the definitions.

+++ {"slideshow": {"slide_type": "subslide"}}

### The Fourier Transform

Used to convert a function of time $f(t)$ to a function of radian frequency $F(\omega)$:

$$\mathcal{F}\left\{f(t)\right\} = \int_{-\infty}^{\infty} f(t)e^{-j\omega t}\,dt = F(\omega).$$

+++ {"slideshow": {"slide_type": "subslide"}}

### The Inverse Fourier Transform

Used to convert a function of frequency $F(\omega)$ to a function of time $f(t)$:

$$\mathcal{F}^{-1}\left\{F(\omega)\right\} = \frac{1}{2\pi}\int_{-\infty}^{\infty} F(\omega)e^{j\omega t}\,d\omega = f(t) .$$

+++ {"slideshow": {"slide_type": "notes"}}

Note, the factor $2\pi$ is introduced because we are changing units from radians/second to seconds.

+++ {"slideshow": {"slide_type": "subslide"}}

### Duality of the transform

Note the similarity of the Fourier and its Inverse. 

This has important consequences in filter design and later when we consider sampled data systems.

+++ {"slideshow": {"slide_type": "slide"}}

## Table of Common Fourier Transform Pairs

This table is adapted from Table 8.9 of Karris. See also: [Wikibooks: Engineering Tables/Fourier Transform Table](https://en.wikibooks.org/wiki/Engineering_Tables/Fourier_Transform_Table) and [Fourier Transfom&mdash;WolframMathworld](https://mathworld.wolfram.com/FourierTransform.html) for more complete references.

+++ {"slideshow": {"slide_type": "subslide"}}

<table>
<thead>
    <tr><td></td><td><b>Name</b></td><td>$f(t)$</td><td>$F(\omega)$</td><td><b>Remarks</b></td></tr>
</thead>
<tbody>
<tr><td>1</td><td>Dirac delta</td><td>$\delta(t)$</td><td>1</td><td>Constant energy at <i>all</i> frequencies.</td></tr>
<tr><td>2</td><td>Time sample</td><td>$\delta(t-t_0)$</td><td>$e^{-j\omega t_0}$</td><td></td></tr>
<tr><td>3.</td><td>Phase shift</td><td>$e^{j\omega t_0}$</td><td>$2\pi\delta(\omega - \omega_0)$</td><td></td></tr>
    <tr><td>4.</td><td><i>Signum</i> </td><td>$\operatorname{sgn} (x)$</td><td>$$\frac{2}{j\omega}$$</td><td>also known as sign function</td></tr>
<tr><td>5.</td><td>Unit step</td><td>$u_0(t)$</td><td>$$\frac{1}{j\omega}+\pi\delta(\omega)$$</td><td></td></tr>
<tr><td>6.</td><td>Cosine</td><td>$\cos \omega_0 t$</td><td>$\pi\left[\delta(\omega-\omega_0)+\delta(\omega+\omega_0)\right]$</td><td></td></tr>
<tr><td>7.</td><td>Sine</td><td>$\sin \omega_0 t$</td><td>$-j\pi\left[\delta(\omega-\omega_0)-\delta(\omega+\omega_0)\right]$</td><td></td></tr>
<tr><td>8.</td><td>Single pole</td><td>$e^{-at}u_0(t)$</td><td>$$\frac{1}{j\omega + a}$$</td><td>$a \gt 0$</td></tr>
<tr><td>9.</td><td>Double pole</td><td>$te^{-at}u_0(t)$</td><td>$$\frac{1}{(j\omega + a)^2}$$</td><td>$a \gt 0$</td></tr>
<tr><td>10.</td><td>Complex pole (cosine component)</td><td>$e^{-at}\cos \omega_0 t\;u_0(t)$</td><td>$$\frac{j\omega + a}{((j\omega + a)^2+\omega^2}$$</td><td>$a\gt 0$</td></tr>
<tr><td>11.</td><td>Complex pole (sine component)</td><td>$e^{-at}\sin \omega_0 t\;u_0(t)$</td><td>$$\frac{\omega}{((j\omega + a)^2+\omega^2}$$</td><td>$a\gt 0$</td></tr>
    <tr><td>12.</td><td>Gating function (<i>aka</i> $\operatorname{rect} (T)$)</td><td>$A\left[u_0(t + T)-u_0(t - T)\right]$</td><td>$$2AT\frac{\sin\omega T}{\omega T}$$</td><td></td></tr>
</tbody>
</table>

+++ {"slideshow": {"slide_type": "slide"}}

## Some Selected Fourier Transforms

+++ {"slideshow": {"slide_type": "subslide"}}

### The Dirac Delta

$$\delta(t) \Leftrightarrow 1$$

![Fourier transform of the Dirac delta](./pictures/ft_delta.png)



*Proof*: uses sampling and sifting properties of $\delta(t)$.

+++ {"slideshow": {"slide_type": "subslide"}}

*Matlab*: 

```{code-cell} matlab
imatlab_export_fig('print-svg')  % Static svg figures.
```

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
syms t omega omega_0 t0;
fourier(dirac(t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

Related:

$$\delta(t-t_0) \Leftrightarrow e^{-j\omega t_0}$$

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
fourier(dirac(t - t0))
```

+++ {"slideshow": {"slide_type": "subslide"}}

### DC

$$1 \Leftrightarrow 2\pi\delta(\omega)$$

![Fourier transform of a constant (model of DC)](./pictures/ft_dc.png)

+++ {"slideshow": {"slide_type": "subslide"}}

*Matlab*:

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
A = sym(1);
fourier(A,omega)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Related by frequency shifting property:

$$e^{j\omega_0 t} \Leftrightarrow 2\pi\delta(\omega-\omega_0)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Cosine (Sinewave with even symmetry)

$$\cos(t) = \frac{1}{2}\left(e^{j\omega_0 t}+e^{-j\omega_0 t}\right) \Leftrightarrow \pi\delta(\omega - \omega_0) + \pi\delta(\omega + \omega_0)$$

![Fourier transform of a cosine signal](./pictures/ft_cos.png)

Note: $f(t)$ is real and even. $F(\omega)$ is also real and even.

+++ {"slideshow": {"slide_type": "subslide"}}

*Matlab*:

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
fourier(cos(omega_0*t),omega)
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Sinewave

$$\sin(t) = \frac{1}{j2}\left(e^{j\omega_0 t}-e^{-j\omega_0 t}\right) \Leftrightarrow -j\pi\delta(\omega - \omega_0) + j\pi\delta(\omega + \omega_0)$$

![Fourier transform of a sinewave signal](./pictures/ft_sin.png)



Note: $f(t)$ is real and odd. $F(\omega)$ is imaginary and odd.

+++ {"slideshow": {"slide_type": "subslide"}}

*Matlab*:

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
fourier(sin(omega_0*t),omega)
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Signum (Sign)

The signum function is a function whose value is equal to

$$\operatorname{sgn} x = \left\{ {\begin{array}{*{20}{c}}
  { - 1\;x < 1} \\ 
  {0\;x = 0} \\ 
  { + 1\;x > 0} 
\end{array}} \right.$$

+++ {"slideshow": {"slide_type": "subslide"}}

*Matlab*:

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
fourier(sign(t),omega)
```

+++ {"slideshow": {"slide_type": "subslide"}}

The transform is:

$$\operatorname{sgn} x = u_0(t) - u_0(-t) = \frac{2}{j\omega}$$

![Fourier transform of sgn(t)](./pictures/ft_sgn.png)

This function is often used to model a *voltage comparitor* in circuits.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 4: Unit Step

Use the signum function to show that
$$\mathcal{F}\left\{u_0(t))\right\} = \pi\delta(\omega)+\frac{1}{j\omega}$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Clue

Define

$$\operatorname{sgn} t = 2 u_0(t) - 1$$

![sgn(t) = 2 u_0(t) - 1](./pictures/u_as_sign.png)


*Does that help?*

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "notes"}}

#### Proof

$$\operatorname{sgn} x = 2u_0(t) - 1$$

so

$$u_0(t) = \frac{1}{2}\left[1 + \operatorname{sgn} x\right]$$

From previous results $1\Leftrightarrow 2\pi\delta(\omega)$ and $\operatorname{sgn} x = 2/(j\omega)$ so by linearity

$$u_0(t) \Leftrightarrow \pi\delta(\omega)+\frac{1}{j\omega}$$

*QED*

+++ {"slideshow": {"slide_type": "subslide"}}

*Matlab*:

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
---
fourier(heaviside(t),omega)
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 5

Use the results derived so far to show that 

$$e^{j\omega_0 t}u_0(t)\Leftrightarrow \pi\delta(\omega - \omega_0) + \frac{1}{j(\omega-\omega_0)}$$

Hint: linearity plus frequency shift property.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 6

Use the results derived so far to show that 

$$\sin \omega_0 t\; u_0(t)\Leftrightarrow \frac{\pi}{j2}\left[\delta(\omega-\omega_0)-\delta(\omega+\omega_0)\right] + \frac{\omega_0}{\omega_0^2 - \omega^2}$$

Hint: Euler's formula plus solution to example 2.

+++ {"slideshow": {"slide_type": "notes"}}

**Important note**: the equivalent example in Karris (Section 8.4.9 Eq. 8.75 pp 8-23&mdash;8-24) is wrong! 

See worked solution in OneNote for corrected proof.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 7

Use the result of Example 3 to determine the Fourier transform of $\cos\omega_0 t\; u_0(t)$.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### Answer

$$\cos\omega_0 t\; u_0(t)\Leftrightarrow \frac{\pi}{2}\left[\delta(\omega-\omega_0)+\delta(\omega+\omega_0)\right] + \frac{j\omega}{\omega_0^2 - \omega^2}$$

+++ {"slideshow": {"slide_type": "slide"}}

## Derivation of the Fourier Transform from the Laplace Transform

If a signal is a function of time $f(t)$ which is zero for $t\le 0$, we can obtain the Fourier transform from the Lpalace transform by substituting $s$ by $j\omega$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 8: Single Pole Filter

Given that 

$$\mathcal{L}\left\{e^{-at}u_0(t)\right\} = \frac{1}{s + a}$$

Compute 

$$\mathcal{F}\left\{e^{-at}u_0(t)\right\}$$

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 9: Complex Pole Pair  cos term

Given that 

$$\mathcal{L}\left\{e^{-at}\cos\omega_0 t\;u_0(t)\right\} = \frac{s+a}{(s + a)^2+\omega_0^2}$$

Compute 

$$\mathcal{F}\left\{e^{-at}\cos\omega_0 t\;u_0(t)\right\}$$

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

## Fourier Transforms of Common Signals

We shall conclude this session by computing as many of the the Fourier transform of some common signals as we have time for.

* rectangular pulse
* triangular pulse
* periodic time function
* unit impulse train (model of regular sampling)
