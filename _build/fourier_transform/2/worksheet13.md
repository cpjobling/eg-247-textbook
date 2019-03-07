---
redirect_from:
  - "/fourier-transform/2/worksheet13"
interact_link: content/fourier_transform/2/worksheet13.ipynb
title: 'Worksheet 13 Fourier transforms of commonly occuring signals'
prev_page:
  url: /fourier_transform/1/worksheet12
  title: 'Worksheet 12 Defining the Fourier Transform'
next_page:
  url: /fourier_transform/3/worksheet14
  title: 'Worksheet 14 Fourier Transforms for Circuit and LTI Systems Analysis'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 13

## To accompany Chapter 5.2 Fourier transforms of commonly occurring signals

We will step through this worksheet in class. 

You are expected to have at least watched the video presentation of [Chapter 5.2](https://cpjobling.github.io/eg-247-textbook/fourier_transform/2/ft2) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

## Reminder of the Definitions

Last time we derived the Fourier Transform by evaluating what would happen when a periodic signal was made periodic. Let us restate the definitions.

### The Fourier Transform

Used to convert a function of time $f(t)$ to a function of radian frequency $F(\omega)$:

$$\mathcal{F}\left\{f(t)\right\} = \int_{-\infty}^{\infty} f(t)e^{-j\omega t}\,dt = F(\omega).$$

### The Inverse Fourier Transform

Used to convert a function of frequency $F(\omega)$ to a function of time $f(t)$:

$$\mathcal{F}^{-1}\left\{F(\omega)\right\} = \frac{1}{2\pi}\int_{-\infty}^{\infty} F(\omega)e^{j\omega t}\,d\omega = f(t) .$$

Note, the factor $2\pi$ is introduced because we are changing units from radians/second to seconds.

### Duality of the transform

Note the similarity of the Fourier and its Inverse. 

This has important consequences in filter design and later when we consider sampled data systems.

## Table of Common Fourier Transform Pairs

This table is adapted from Table 8.9 of Karris. See also: [Wikibooks: Engineering Tables/Fourier Transform Table](http://en.wikibooks.org/wiki/Engineering_Tables/Fourier_Transform_Table) and [Fourier Transfom&mdash;WolframMathworld](http://mathworld.wolfram.com/FourierTransform.html) for more complete references.

<table>
<thead>
    <tr><td></td><td><b>Name</b></td><td>$f(t)$</td><td>$F(\omega)$</td><td><b>Remarks</b></td></tr>
</thead>
<tbody>
<tr><td>1</td><td>Dirac delta</td><td>$\delta(t)$</td><td>1</td><td>Constant energy at <i>all</i> frequencies.</td></tr>
<tr><td>2</td><td>Time sample</td><td>$\delta(t-t_0)$</td><td>$e^{j\omega t_0}$</td><td></td></tr>
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

## Some Selected Fourier Transforms

### The Dirac Delta

$$\delta(t) \Leftrightarrow 1$$

<img src="pictures/ft_delta.png">

*Proof*: uses sampling and sifting properties of $\delta(t)$.

*Matlab*: 



{:.input_area}
```matlab
syms t omega omega_0 t0;
fourier(dirac(t))
```


Related:

$$\delta(t-t_0) \Leftrightarrow e^{-j\omega t_0}$$



{:.input_area}
```matlab
fourier(dirac(t - t0))
```


### DC

$$1 \Leftrightarrow 2\pi\delta(\omega)$$

<img src="pictures/ft_dc.png">

*Matlab*:



{:.input_area}
```matlab
A = sym(1);
fourier(A,omega)
```


Related by frequency shifting property:

$$e^{j\omega_0 t} \Leftrightarrow 2\pi\delta(\omega-\omega_0)$$

### Cosine (Sinewave with even symmetry)

$$\cos(t) = \frac{1}{2}\left(e^{j\omega_0 t}+e^{-j\omega_0 t}\right) \Leftrightarrow \pi\delta(\omega - \omega_0) + \pi\delta(\omega + \omega_0)$$

<img src="pictures/ft_cos.png">

Note: $f(t)$ is real and even. $F(\omega)$ is also real and even.

*Matlab*:



{:.input_area}
```matlab
fourier(cos(omega_0*t),omega)
```


### Sinewave

$$\sin(t) = \frac{1}{j2}\left(e^{j\omega_0 t}-e^{-j\omega_0 t}\right) \Leftrightarrow -j\pi\delta(\omega - \omega_0) + j\pi\delta(\omega + \omega_0)$$

<img src="pictures/ft_sin.png">

Note: $f(t)$ is real and odd. $F(\omega)$ is imaginary and odd.

*Matlab*:



{:.input_area}
```matlab
fourier(sin(omega_0*t),omega)
```


### Signum (Sign)

The signum function is a function whose value is equal to

$$\operatorname{sgn} x = \left\{ {\begin{array}{*{20}{c}}
  { - 1\;x < 1} \\ 
  {0\;x = 0} \\ 
  { + 1\;x > 0} 
\end{array}} \right.$$

*Matlab*:



{:.input_area}
```matlab
fourier(sign(t),omega)
```


The transform is:

$$\operatorname{sgn} x = u_0(t) - u_0(-t) = \frac{2}{j\omega}$$

<img src="pictures/ft_sgn.png">

This function is often used to model a *voltage comparitor* in circuits.

### Example 4: Unit Step

Use the signum function to show that
$$\mathcal{F}\left\{u_0(t))\right\} = \pi\delta(\omega)+\frac{1}{j\omega}$$

#### Clue

Define

$$\operatorname{sgn} t = 2 u_0(t) - 1$$

<img src="pictures/u_as_sign.png">

*Does that help?*

<pre style="border: 2px solid blue">















</pre>

#### Proof

$$\operatorname{sgn} x = 2u_0(t) - 1$$

so

$$u_0(t) = \frac{1}{2}\left[1 + \operatorname{sgn} x\right]$$

From previous results $1\Leftrightarrow 2\pi\delta(\omega)$ and $\operatorname{sgn} x = 2/(j\omega)$ so by linearity

$$u_0(t) \Leftrightarrow \pi\delta(\omega)+\frac{1}{j\omega}$$

*QED*

*Matlab*:



{:.input_area}
```matlab
fourier(heaviside(t),omega)
```


### Example 5

Use the results derived so far to show that 

$$e^{j\omega_0 t}u_0(t)\Leftrightarrow \pi\delta(\omega - \omega_0) + \frac{1}{j(\omega-\omega_0)}$$

Hint: linearity plus frequency shift property.

<pre style="border: 2px solid blue">















</pre>

### Example 6

Use the results derived so far to show that 

$$\sin \omega_0 t\; u_0(t)\Leftrightarrow \frac{\pi}{j2}\left[\delta(\omega-\omega_0)-\delta(\omega+\omega_0)\right] + \frac{\omega_0}{\omega_0^2 - \omega^2}$$

Hint: Euler's formula plus solution to example 2.

**Important note**: the equivalent example in Karris (Section 8.4.9 Eq. 8.75 pp 8-23&mdash;8-24) is wrong! 

See worked solution in OneNote for corrected proof.

<pre style="border: 2px solid blue">















</pre>

### Example 7

Use the result of Example 3 to determine the Fourier transform of $\cos\omega_0 t\; u_0(t)$.

<pre style="border: 2px solid blue">















</pre>

#### Answer

$$\cos\omega_0 t\; u_0(t)\Leftrightarrow \frac{\pi}{2}\left[\delta(\omega-\omega_0)+\delta(\omega+\omega_0)\right] + \frac{j\omega}{\omega_0^2 - \omega^2}$$

## Derivation of the Fourier Transform from the Laplace Transform

If a signal is a function of time $f(t)$ which is zero for $t\le 0$, we can obtain the Fourier transform from the Lpalace transform by substituting $s$ by $j\omega$.

### Example 8: Single Pole Filter

Given that 

$$\mathcal{L}\left\{e^{-at}u_0(t)\right\} = \frac{1}{s + a}$$

Compute 

$$\mathcal{F}\left\{e^{-at}u_0(t)\right\}$$

<pre style="border: 2px solid blue">















</pre>

### Example 9: Complex Pole Pair  cos term

Given that 

$$\mathcal{L}\left\{e^{-at}\cos\omega_0 t\;u_0(t)\right\} = \frac{s+a}{(s + a)^2+\omega_0^2}$$

Compute 

$$\mathcal{F}\left\{e^{-at}\cos\omega_0 t\;u_0(t)\right\}$$

<pre style="border: 2px solid blue">















</pre>

## Fourier Transforms of Common Signals

We shall conclude this session by computing as many of the the Fourier transform of some common signals as we have time for.

* rectangular pulse
* triangular pulse
* periodic time function
* unit impulse train (model of regular sampling)
