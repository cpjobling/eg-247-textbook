---
redirect_from:
  - "/fourier-series/1/worksheet9"
interact_link: content/fourier_series/1/worksheet9.ipynb
title: 'Worksheet 9 Trigonometric Fourier Series'
prev_page:
  url: /laplace_transform/5/worksheet8
  title: 'Worksheet 8 Impulse Response and Time Convolution'
next_page:
  url: /fourier_series/2/worksheet10
  title: 'Worksheet 10 Exponential Fourier Series'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 9

## To accompany Chapter 4.1 Trigonometric Fourier Series

We will step through this worksheet in class. 

You are expected to have at least watched the video presentation of [Chapter 4.1](https://cpjobling.github.io/eg-247-textbook/fourier_series/1/trig_fseries) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

## Motivating Example

In the class I will demonstrate the Fourier Series demo (see [Notes](trig_fs)).

## Symmetry in Trigonometric Fourier Series

There are simplifications we can make if the original periodic properties has certain properties:

* If $f(t)$ is odd, $a_0=0$ and there will be no cosine terms so ${a_n} = 0\; \forall n > 0$
* If $f(t)$ is even, there will be no sine terms and ${b_n} = 0\; \forall n > 0$. The DC may or may not be zero.
* If $f(t)$ has *half-wave symmetry* only the odd harmonics will be present. That is $a_n$ and $b_n$ is zero for all even values of $n$ (0, 2, 4, ...)
    

### Odd, Even and Half-wave Symmetry

**Recall**

* An *odd* function is one for which $f(t) = -f(-t)$. The function $\sin t$ is an *odd* function.
* An *even* function is one for which $f(t) = f(-t)$. The function $\cos t$ is an *even* function.

**Half-wave symmetry**

* A periodic function with period $T$ is a function for which $f(t) = f(t + T)$
* A periodic function with period $T$, has *half-wave symmetry* if $f(t) = -f(t + T/2)$

### Symmetry in Common Waveforms

To reproduce the following waveforms (without annotation) publish the script [waves.m](waves.m).

#### Squarewave

<img src="pictures/square.png">

* Average value over period $T$ is ...?
* It is an **odd**/**even** function?
* It **has/has not** half-wave symmetry $f(t)=-f(t+T/2)$?


#### Shifted Squarewave

<img src="pictures/shifted_sq.png">

* Average value over period $T$ is 
* It is an **odd**/**even** function?
* It **has/has not** half-wave symmetry $f(t)=-f(t+T/2)$?

#### Sawtooth

<img src="pictures/sawtooth.png">

* Average value over period $T$ is 
* It is an **odd**/**even** function?
* It **has/has not** half-wave symmetry $f(t)=-f(t+T/2)$?

#### Triangle

<img src="pictures/triangle.png">

* Average value over period $T$ is 
* It is an **odd**/**even** function?
* It **has/has not** half-wave symmetry $f(t)=-f(t+T/2)$?

### Symmetry in fundamental, Second and Third Harmonics

In the following, $T/2$ is taken to be the half-period of the fundamental sinewave.

#### Fundamental

<img src="pictures/fundamental.png">


* Average value over period $T$ is 
* It is an **odd**/**even** function?
* It **has/has not** half-wave symmetry $f(t)=-f(t+T/2)$?

#### Second Harmonic

<img src="pictures/2nd_harm.png">


* Average value over period $T$ is 
* It is an **odd**/**even** function?
* It **has/has not** half-wave symmetry $f(t)=-f(t+T/2)$?

#### Third Harmonic

<img src="pictures/3rd_harm.png">

* Average value over period $T$ is 
* It is an **odd**/**even** function?
* It **has/has not** half-wave symmetry $f(t)=-f(t+T/2)$?

### Some simplifications that result from symmetry

* The limits of the integrals used to compute the coefficents $a_n$ and $b_n$ of the Fourier series are given as $0\to 2\pi$ which is one period $T$
* We could also choose to integrate from $-\pi \to \pi$
* If the function is *odd*, or *even* or has *half-wave symmetry* we can compute $a_n$ and $b_n$ by integrating from $0\to \pi$ and multiplying by 2.
* If we have *half-wave symmetry* we can compute $a_n$ and $b_n$ by integrating from $0\to \pi/2$ and multiplying by 4.

(For more details see page 7-10 of the textbook)

## Computing coefficients of Trig. Fourier Series in Matlab

As an example let's take a square wave with amplitude $\pm A$ and period $T$.

<img src="pictures/square_wave.png">

### Solution

Solution: See [square_ftrig.mlx](square_ftrig.mlx). Script confirms that:

* $a_0 = 0$
* $a_i = 0$: function is odd
* $b_i = 0$: for $i$ even - half-wave symmetry

```
ft =
 
(4*A*sin(t))/pi + (4*A*sin(3*t))/(3*pi) + (4*A*sin(5*t))/(5*pi) + (4*A*sin(7*t))/(7*pi) + (4*A*sin(9*t))/(9*pi) + (4*A*sin(11*t))/(11*pi)
```

Note that the coefficients match those given in the textbook (Section 7.4.1).

$$f(t) = \frac{4A}{\pi}\left(\sin \Omega_0 t + \frac{1}{3}\sin 3\Omega_0 t + \frac{1}{5}\sin 5\Omega_0 t + \cdots\right) = \frac{4A}{\pi}\sum_{n=\mathrm{odd}}\frac{1}{n}\sin n\Omega_0 t$$

### Using symmetry - computing the Fourier series coefficients of the shifted square wave

<img src="pictures/shifted_square_wave.png">

* As before $a_0=0$
* We observe that this function is even, so all $b_k$ coefficents will be zero
* The waveform has half-wave symmetry, so only odd indexed coeeficents will be present.
* Further more, because it has half-wave symmetry we can just integrate from $0 \to \pi/2$ and multiply the result by 4.

See [shifted_sq_ftrig.mlx](shifted_sq_ftrig.mlx).

```
ft =
 
(4*A*cos(t))/pi - (4*A*cos(3*t))/(3*pi) + (4*A*cos(5*t))/(5*pi) - (4*A*cos(7*t))/(7*pi) + (4*A*cos(9*t))/(9*pi) - (4*A*cos(11*t))/(11*pi)
```

Note that the coefficients match those given in the textbook (Section 7.4.2).

$$f(t) = \frac{4A}{\pi}\left(\cos \Omega_0 t - \frac{1}{3}\cos 3\Omega_0 t + \frac{1}{5}\cos 5\Omega_0 t - \cdots\right) = \frac{4A}{\pi}\sum_{n=\mathrm{odd}}(-1)^{\frac{n-1}{2}} \frac{1}{n}\cos n\Omega_0 t$$
