---
jupytext:
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.9'
    jupytext_version: 1.5.2
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

# The Impulse Response and Convolution

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

An annotatable worksheet for this presentation is available as [**Worksheet 8**](https://cpjobling.github.io/eg-247-textbook/laplace_transform/5/worksheet8.html).

* The source code for this page is [laplace_transform/5/convolution.ipynb](https://github.com/cpjobling/eg-247-textbook/blob/master/laplace_transform/5/convolution.ipynb).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/laplace_transform/5/convolution.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/laplace_transform/5/convolution.pdf) file.

+++ {"slideshow": {"slide_type": "notes"}}

## Scope and Background Reading

This section is an introduction to the impulse response of a system and time convolution. Together, these can be used to determine a Linear Time Invariant (LTI) system's time response to any signal.

As we shall see, in the determination of a system's response to a signal input, time convolution involves integration by parts and is a tricky operation. But time convolution becomes multiplication in the Laplace Transform domain, and is much easier to apply.

+++ {"slideshow": {"slide_type": "notes"}}

The material in this presentation and notes is based on [Chapter 6](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?ppg=185&docID=3384197&tm=1518698533541) of Karris{cite}`karris`.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

The material to be presented is:

+++ {"slideshow": {"slide_type": "fragment"}}

* Even and Odd Functions of Time
* Time Convolution

+++ {"slideshow": {"slide_type": "subslide"}}

* Graphical Evaluation of the Convolution Integral
* System Response by Laplace

+++ {"slideshow": {"slide_type": "slide"}}

## Even and Odd Functions of Time

(**This should be revision!**)

We need to be reminded of *even* and *odd* functions so that we can develop the idea of time convolution which is a means of determining the time response of any system for which we know its *impulse response* to any signal.

+++ {"slideshow": {"slide_type": "subslide"}}

The development requires us to find out if the Dirac delta function ($\delta(t)$) is an *even* or an *odd* function of time.

+++ {"slideshow": {"slide_type": "subslide"}}

### Even Functions of Time

A function $f(t)$ is said to be an *even function* of time if the following relation holds

$$f(-t) = f(t)$$

that is, if we relace $t$ with $-t$ the function $f(t)$ does not change.

+++ {"slideshow": {"slide_type": "subslide"}}

Polynomials with even exponents only, and with or without constants, are even functions.

+++ {"slideshow": {"slide_type": "fragment"}}

For example:

$$\cos t = 1 - \frac{t^2}{2!} + \frac{t^4}{4!} - \frac{t^6}{6!} + \ldots$$

is even.

+++ {"slideshow": {"slide_type": "subslide"}}

### Other Examples of Even Functions

<img src="pictures/even_funcs.png" width="75%">

+++ {"slideshow": {"slide_type": "subslide"}}

### Odd Functions of Time

A function $f(t)$ is said to be an *odd function* of time if the following relation holds

$$-f(-t) = f(t)$$

that is, if we relace $t$ with $-t$, we obtain the negative of the function $f(t)$.

+++ {"slideshow": {"slide_type": "subslide"}}

Polynomials with odd exponents only, and no constants, are odd functions.

+++ {"slideshow": {"slide_type": "fragment"}}

For example:

$$\sin t = t - \frac{t^3}{3!} + \frac{t^5}{5!} - \frac{t^7}{7!} + \ldots$$

is odd.

+++ {"slideshow": {"slide_type": "subslide"}}

### Other Examples of Odd Functions

<img src="pictures/odd_funcs.png" width="75%">

+++ {"slideshow": {"slide_type": "subslide"}}

### Observations

* For odd functions $f(0) = 0$.
* If $f(0) = 0$ we should not conclude that $f(t)$ is an odd function. *c.f.* $f(t) = t^2$ is even, not odd.
* The product of *two even* or *two odd* functions is an even function.
* The product of an even and an odd function, is an odd function.

+++ {"slideshow": {"slide_type": "subslide"}}

In the following $f_e(t)$ will denote an even function and $f_o(t)$ an odd function.

+++ {"slideshow": {"slide_type": "slide"}}

### Time integrals of even and odd functions

+++ {"slideshow": {"slide_type": "fragment"}}

For an even function $f_e(t)$

$$\int_{-T}^{T}f_e(t) dt = 2 \int_{0}^{T}f_e(t) dt$$

+++ {"slideshow": {"slide_type": "subslide"}}

For an odd function $f_o(t)$

$$\int_{-T}^{T}f_o(t) dt = 0$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Even/Odd Representation of an Arbitrary Function

A function $f(t)$ that is neither even nor odd can be represented as an even function by use of:
    
$$f_e(t) = \frac{1}{2}\left[f(t)+f(-t)\right]$$

+++ {"slideshow": {"slide_type": "subslide"}}

or as an odd function by use of:

$$f_o(t) = \frac{1}{2}\left[f(t)-f(-t)\right]$$

+++ {"slideshow": {"slide_type": "subslide"}}

Adding these together, an abitrary signal can be represented as

$$f(t) = f_e(t) + f_o(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

That is, any function of time can be expressed as the sum of an even and an odd function.

+++ {"slideshow": {"slide_type": "slide"}}

### Example 1

Is the Dirac delta $\delta(t)$ an *even* or an *odd* function of time?

We'll decide in class.

+++ {"slideshow": {"slide_type": "notes"}}

#### Solution to example 1

Let $f(t)$ be an arbitrary function of time that is continous at $t=t_0$. Then by the sifting property of the delta function

$$\int_{-\infty}^{\infty} f(t)\delta(t-t_0) dt = f(t_0)$$

and for $t_0 = 0$

$$\int_{-\infty}^{\infty} f(t)\delta(t) dt = f(0)$$

Also for an even function $f_e(t)$

$$\int_{-\infty}^{\infty} f_e(t)\delta(t) dt = f_e(0)$$

and for an odd function $f_o(t)$

$$\int_{-\infty}^{\infty} f_o(t)\delta(t) dt = f_o(0)$$

#### Even or odd?

An odd function $f_o(t)$ evaluated at $t=0$ is zero, that is $f_o(0) = 0$.

Hence

$$\int_{-\infty}^{\infty} f_o(t)\delta(t) dt = f_o(0) = 0$$

Hence the product $f_o(t)\delta(t)$ is odd function of $t$.

Since $f_o(t)$ is odd, $\delta(t)$ must be even because only an *even* function multiplied by an *odd* function can result in an *odd* function.

(Even times even or odd times odd produces an even function. See earlier slide)

+++ {"slideshow": {"slide_type": "slide"}}

## Time Convolution

Consider a system whose input is the Dirac delta ($\delta(t)$), and its output is the ***impulse response*** $h(t)$.

+++ {"slideshow": {"slide_type": "subslide"}}

We can represent the input-output relationship as a block diagram

<img src="pictures/conv1.png" width="50%">

+++ {"slideshow": {"slide_type": "subslide"}}

### In general

<img src="pictures/conv2.png" width="50%">

+++ {"slideshow": {"slide_type": "subslide"}}

### Add an arbitrary input

Let $u(t)$ be any input whose value at $t=\tau$ is $u(\tau)$, Then because of the sampling property of the delta function

<img src="pictures/conv3.png" width="50%">

(output is $u(\tau)h(t-\tau)$)

+++ {"slideshow": {"slide_type": "subslide"}}

### Integrate both sides

Integrating both sides over all values of $\tau$ ($-\infty < \tau < \infty$) and making use of the fact that the delta function is even, i.e. 

$$\delta(t-\tau)=\delta(\tau-t)$$

we have:

+++ {"slideshow": {"slide_type": "subslide"}}

<img src="pictures/conv4.png">

+++ {"slideshow": {"slide_type": "subslide"}}

### Use the sifting property of delta

The second integral on the left side reduces to $u(t)$

<img src="pictures/conv5.png">

+++ {"slideshow": {"slide_type": "subslide"}}

### The Convolution Integral

+++ {"slideshow": {"slide_type": "fragment"}}

The integral

$${\int_{-\infty}^{\infty} u(\tau)h(t-\tau)d\tau}$$

+++ {"slideshow": {"slide_type": "subslide"}}

or

$${\int_{-\infty}^{\infty} u(t-\tau)h(\tau)d\tau}$$

+++ {"slideshow": {"slide_type": "fragment"}}

is known as the *convolution integral*; it states that if we know the impulse response of a system, we can compute its time response to any input by using either of the integrals.

+++ {"slideshow": {"slide_type": "subslide"}}

The convolution integral is usually written $u(t)*h(t)$ or $h(t)*u(t)$ where the asterisk ($*$) denotes convolution.

+++ {"slideshow": {"slide_type": "subslide"}}

## Graphical Evaluation of the Convolution Integral

The convolution integral is most conveniently evaluated by a graphical evaluation. The text book gives three examples (6.4-6.6) which we will demonstrate in class using a [graphical visualization tool](https://uk.mathworks.com/matlabcentral/fileexchange/25199-graphical-demonstration-of-convolution) developed by Teja Muppirala of the Mathworks.

The tool: [convolutiondemo.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/convolution_demo/convolutiondemo.m) (see [license.txt](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/convolution_demo/license.txt)).

```{code-cell}
---
slideshow:
  slide_type: subslide
---
clear all
cd ../matlab/convolution_demo
pwd
format compact
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
convolutiondemo % ignore warnings
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Convolution by Graphical Method - Summary of Steps

+++ {"slideshow": {"slide_type": "fragment"}}

For simplicity, we give the rules for $u(t)$, but the procedure is the same if we reflect and slide $h(t)$

+++ {"slideshow": {"slide_type": "subslide"}}

1. Substitute $u(t)$ with $u(\tau)$ &ndash; this is a simple change of variable. It doesn't change the definition of $u(t)$.

+++ {"slideshow": {"slide_type": "fragment"}}

2. Reflect $u(\tau)$ about the vertical axis to form $u(-\tau)$

+++ {"slideshow": {"slide_type": "fragment"}}

3. Slide $u(-\tau)$ to the right a distance $t$ to obtain $u(t-\tau)$

+++ {"slideshow": {"slide_type": "subslide"}}

4. Multiply the two signals to obtain the product $u(t-\tau)h(\tau)$

+++ {"slideshow": {"slide_type": "fragment"}}

5. Integrate the product over all $\tau$ from $-\infty$ to $\infty$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Examples

+++ {"slideshow": {"slide_type": "fragment"}}

We will do these live in class.

+++ {"slideshow": {"slide_type": "notes"}}

#### Example 2

(This is example 6.4 in the textbook)

The signals $h(t)$ and $u(t)$ are shown below. Compute $h(t)*u(t)$ using the graphical technique.

<img src="pictures/conv_ex1.png">

+++ {"slideshow": {"slide_type": "notes"}}

##### h(t)

The signal $h(t)$ is the straight line $f(t)=-t+1$ but this is defined only between $t = 0$ and $t = 1$. We thus need to gate the function by multiplying it by $u_0(t)-u_0(t-1)$ as illustrated below:

<img src="pictures/gate_h.png">

Thus

$$h(t) \Leftrightarrow H(s)$$

$$h(t) = (-t + 1)(u_0(t)-u_0(t-1)) = (-t + 1)u_0(t) - (-(t - 1)u_0(t - 1)) = -t u_0(t) + u_0(t) + (t - 1)u_0(t - 1)$$

$$-t u_0(t) + u_0(t) + (t - 1)u_0(t - 1) \Leftrightarrow - \frac{1}{s^2} + \frac{1}{s} +\frac{e^{-s}}{s^2}$$

$$H(s) = \frac{s + e^{-s} - 1}{s^2}$$

##### u(t)

The input $u(t)$ is the gating function:

$$u(t) = u_0(t)-u_0(t-1)$$

so

$$U(s) = \frac{1}{s}-\frac{e^{-s}}{s} = \frac{1 - e^{-s}}{s}$$

+++ {"slideshow": {"slide_type": "notes"}}

##### Prepare for convolutiondemo

To prepare this problem for evaluation in the `convolutiondemo` tool, we need to determine the Laplace Transforms of $h(t)$ and $u(t)$.

+++ {"slideshow": {"slide_type": "notes"}}

##### convolutiondemo settings

* Let `g = (1 - exp(-s))/s`
* Let `h = (s + exp(-s) - 1)/s^2`
* Set range $-2 < \tau < -2$

+++ {"slideshow": {"slide_type": "notes"}}

##### Summary of result

1. For $t < 0$: $$u(t-\tau)h(\tau) = 0$$
2. For $t = 0$: $u(t-\tau) = u(-\tau)$ and $u(-\tau)h(\tau) = 0$
3. For $0 < t \le 1$: 
    $$h*u = \int_0^t (1)(-\tau + 1)d\tau = \left.\tau - \tau^2/2\right|_0^t = t-t^2/2$$
4. For $1 < t \le 2$: 
    $$h*u = \int_{t-1}^1(-\tau + 1)d\tau = \left.\tau - \tau^2/2\right|_{t-1}^{1} = t^2/2-2t+2$$
5. For $2 \le t$: $$u(t-\tau)h(\tau) = 0$$

+++ {"slideshow": {"slide_type": "notes"}}

#### Example 3

This is example 6.5 from the text book.

$$h(t) = e^{-t}$$

$$u(t) = u_0(t)-u_0(t-1)$$

+++ {"slideshow": {"slide_type": "notes"}}

##### Answer 3

$$y(t) = \left\{ {\begin{array}{*{20}{l}}
{0:t \le 0}\\
1 - e^{ - t}:\;0 < t \le 1\\
e^{ - t}\left( {e - 1} \right):\;1 < t \lt \infty
\end{array}} \right.$$

+++ {"slideshow": {"slide_type": "notes"}}

##### Check with MATLAB

```{code-cell}
---
slideshow:
  slide_type: notes
---
syms t tau
x1=int(exp(-tau),tau,0,t)
```

```{code-cell}
---
slideshow:
  slide_type: notes
---
x2=int(exp(-tau),tau,t-1,t)
```

+++ {"slideshow": {"slide_type": "notes"}}

#### Example 4

This is example 6.6 from the text book.

$$h(t) = 2(u_0(t)-u_0(t-1))$$

$$u(t) = u_0(t)-u_0(t-2)$$

+++ {"slideshow": {"slide_type": "notes"}}

##### Answer 4

$$y(t) = \left\{ {\begin{array}{*{20}{l}}
{0:t \le 0}\\
{2t:\;0 < t \le 1}\\
{2:\;1 < t \le 2}\\
{-2t+6:\;2 < t \le 3}\\
{0:\;3 \le t}\\
\end{array}} \right.$$

+++ {"slideshow": {"slide_type": "slide"}}

## System Response by Laplace

In the discussion of Laplace, we stated that

$$\mathcal{L} \left\{ f(t)*g(t)\right\} = F(s)G(s)$$

We can use this property to make the solution of convolution problems even simpler.

+++ {"slideshow": {"slide_type": "notes"}}

### Impulse Response and Transfer Functions

Returning to the example we started with

<img src="pictures/conv1.png" width="50%">

Then the impulse response of the system $h(t)$ will be given by:

$$\mathcal{L} \left\{ h(t)*\delta(t)\right\} = H(s)\Delta(s)$$

Where $H(s)$ be the laplace transform of the impulse response of the system $h(t)$. From properties of the Laplace transform we know that

$$\delta(t) \Leftrightarrow 1$$

so that $\Delta(s) = 1$ and

$$h(t)*\delta(t) \Leftrightarrow H(s).1 = H(s)$$

A consequence of this is that the transform of the impulse response $h(t)$ of a system with transfer function $H(s)$ is completely defined by the transfer function itself.

Previously we argued that the response of system with impulse response $h(t)$ was given by the convolution integrals:

$$h(t)*u(t) = {\int_{-\infty}^{\infty} u(\tau)h(t-\tau)d\tau} = {\int_{-\infty}^{\infty} u(t-\tau)h(\tau)d\tau}$$

Thus the Laplace transform of any system subject to an input $u(t)$ is simply

$$Y(s) = H(s)U(s)$$

and 

$$y(t) = \mathcal{L}^{-1} \left\{ G(s) U(s) \right\}$$

Using tables, solution of a convolution problem by Laplace is usually simpler than using convolution directly.

+++ {"slideshow": {"slide_type": "subslide"}}

### More Examples

We will work through these in class

+++ {"slideshow": {"slide_type": "notes"}}

#### Example 5

This is example 6.7 from the textbook.

<img src="pictures/example4.jpg" width="75%">

+++ {"slideshow": {"slide_type": "notes"}}

For the circuit shown above, show that the transfer function of the circuit is:

$$ H(s) = \frac{V_c(s)}{V_s(s)} = \frac{1/RC}{s + 1/RC} $$

Hence determine the impulse respone $h(t)$ of the circuit and the response of the capacitor voltage when the input is the unit step function $u_0(t)$ and $v_c(0^-)=0$.

Assume $C=1\; \mathrm{F}$ and $R=1\;\Omega$.

+++ {"slideshow": {"slide_type": "notes"}}

##### Solution 5a - Impulse response

$$h(t)=\frac{1}{RC}e^{-t/RC}u_0(t)$$

which when $C=1\; \mathrm{F}$ and $R=1\;\Omega$ reduces to

$$h(t)=e^{-t}u_0(t)$$.

+++ {"slideshow": {"slide_type": "notes"}}

##### Solution  5b - Step response

$$h(t) = e^{−t}u_0(t) \Leftrightarrow H(s) = \frac{1}{s+1}$$

$$u(t) = u_0(t) \Leftrightarrow U(s) = \frac{1}{s}$$

$$y(t) = h(t)*u(t) \Leftrightarrow Y(s) = H(s)U(s) = \left(\frac{1}{s+1}\right)\times\left(\frac{1}{s}\right)$$

By PFE 

$$Y(s) = \frac{r_1}{s+1} + \frac{r_2}{s}$$

The residues are $r_1=-1$, $r_2=1$, so

$$Y(s) = -\frac{1}{s+1} + \frac{1}{s} \Leftrightarrow y(t) = \left(1-e^{-t}\right)u_0(t)$$

+++ {"slideshow": {"slide_type": "notes"}}

### Homework 

Verify this result using the convolution integral

$$h(t)*u(t) = {\int_{-\infty}^{\infty} u(\tau)h(t-\tau)d\tau}$$


### Reference

See [Bibliography](/zbib).
