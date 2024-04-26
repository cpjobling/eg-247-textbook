---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.15.2
  kernelspec:
    display_name: Matlab
    language: matlab
    name: matlab
---

<!-- #region slideshow={"slide_type": "slide"} -->
(unit7.2)=
# Unit 7.2: Designing Digital Filters in MATLAB
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
## Colophon

* The source code for this page is [filters/1/filters.md](https://github.com/cpjobling/eg-247-textbook/blob/master/filter_design/digital_filters.md).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/filter_design/digital_filters.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/filter_design/digital_filters.pdf) file.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
## Scope and Background Reading

**[TODO] Write this properly**

We introduced the idea of filters in {ref}`ft4` and examined in some detail the idea of an ideal low-pass filter and an approximation to the ideal filter known and the *Butterworth* filter. We also showed how a high-pass filter, stop-band filter and and pass-band filter could be implemented by simple manipulations of the frequency response (or transfer functions) of a low-pass filter. 

An advantage of the Butterworth filter is that it has a flat response in the pass band, a consistent attenuation of -3 dB at the cut-off frequency, and a steady roll-off in the stop band. A disadvantage is that you need a high-order filter to get a fast transition between the pass-band and the stop-band.

In {ref}`demo`, we showed how an analogue 2nd-order Butterworth filter could be translated into a discrete-time (DT) system using the MATLAB function `c2d`, and we demonstrated the architecture and code that might be used to implement the digital filter.

In this unit we will explore further some of the concepts of what is called *filter design by analogue prototype*. This Unit is based on Chapter 11 of {cite}`karris`. We will illustrate the concepts using MATLAB and Simulink as appropriate on the understanding that you should be able to use the bilinear transform to convert a 2nd-order analogue proptotype into a digital filter.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
## Agenda

* {ref}`unit7.2:digital`
<!-- #endregion -->

```matlab
format compact
cd matlab
```

<!-- #region slideshow={"slide_type": "slide"} -->
(unit7.2:digital)=
## Digital filters

A *digital filter* is a computational process (algorithm) that converts one sequence of numbers $x[n]$ representing the input, to another sequence $y[n]$ that represents the output.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
A digital filter can be used to filter out desired bands of frequency.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
Digital filters can also be used to perform other functions, such as integration, differentiation, and estimation.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
The input-output *difference equation* that relates the output and input can be expressed in the discrete-time (DT) domain as a summation of the form

$$y[n] = \sum_{i=0}^{k}b_i y[n - i]-\sum_{i=0}^{k}a_i y[n - i]$$ (eq:7.2:1)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
or, as a Z-transform as

$$G(z) = \frac{N(z)}{D(z)} = \frac{\displaystyle\sum_{i=0}^{k}b_i z^{-i}}{1 + \displaystyle\sum_{i=0}^{k}a_i z^{-i}}$$ (eq:7.2:2)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
Therefore, the design of a digital filter ro perform a desired function, entails the determination of the coefficients $b_i$ and $a_i$.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
(unit7.2:classification)=
### Classification of digital filters

Digital filters are classified in terms of the duration of the impulse response, and in terms of realization.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### 1. Impulse response duration
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
a). An *infinite impulse response* (IIR) filter as an infinite number of samples in its impulse response $h[n]$.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
b). A *finite impulse response* (FIR) filter as an finite number of samples in its impulse response $h[n]$.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### 2. Realization
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
a). In a *recursive realization* digital filter, the output depends on the input and the *previous* values of the output. In a recursive digital filter, both the coefficients $b_i$ and $a_i$ are present.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
b). In a *non-recursive realization* digital filter, the output depends on present and past value of the input only. In a non-recursive digital filter, only the coefficients $b_i$ are present, i.e. $a_i=0$.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
### Implementation of digital filters
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
{numref}`fig:u72:1` shows a Simulink model of a third-order (3-delay element or 3-tap) recursive realization of a digital filter[^u72:note:1]
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
[^u72:note:1]: Note that the block labelled $z^{-1}$ is a one unit delay $y[n] = x[n - 1]$; the triangular blocks are gains $y[n] = k x[n]$; and the circular blocks are summing points. Following the equations we have $w[n] = x[n] - a_1 w[n-1] - a_2 w[n-2] - a_3 w[n-3]$ and $y[n] = b_0 w[n] + b_1 w[n-1] + b_2 w[n-2] + b_3 w[n-3]$. It is left as an exercise for the reader to show that combining these two equations, taking Z-transforms, and eliminating $W(z)$, results in the transfer function $H(z) = Y(z)/X(z)$ given in {eq}`eq:7.2:2` and hence the difference equation of {eq}`eq:7.2:1`.
<!-- #endregion -->

```matlab slideshow={"slide_type": "fragment"}
recursive
```

<!-- #region slideshow={"slide_type": "notes"} -->
:::{figure-md} fig:u72:1
<img src="pictures/recursive.png" alt="Picture of a digital filter realization in Simulink" width="100%" />

Recursive digital filter realization in Simulink
:::
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
Download Simulink model [recursive.slx](matlab/nonrecursive.slx)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
{numref}`fig:u72:2` shows a Simulink model of a third-order non-recursive realization of a digital filter[^u72:note:2]
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
[^u72:note:2]: It is obvious from this figure that $y[n] = b_0 x[n] + b_1 x[n-1] + b_2 x[n-2] + b_3 x[n-3]$.
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
nonrecursive
```

<!-- #region slideshow={"slide_type": "notes"} -->
:::{figure-md} fig:u72:2
<img src="pictures/nonrecursive.png" alt="Picture of a digital filter realization in Simulink" width="100%" />

Non-recursive digital filter realization in Simulink
:::
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
Download Simulink model [nonrecursive.slx](matlab/nonrecursive.slx)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
Generally, IIR filters are implemented by a recursive realization, and FIR filters are implemented by a non-recursive implementation.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
### Digital filter design methods

As demonstrated in {ref}`unit7.1`, filter-design methods have been established and analogue prototypes have been published. Thus, we can choose an appropriate analogue prototype to satisfy the requirements.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
Transformation methods are also available to transform analogue prototypes into an equivalent digital filter.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "fragment"} -->
Three commonly used transformation methods are
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### 1. The *impulse invariant method*
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### 2. The *step invariant method*
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### 3. The *bilnear transform method*
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
## References

See [Bibliography](/zbib).
<!-- #endregion -->

```matlab slideshow={"slide_type": "notes"}

```
