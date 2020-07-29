---
jupytext:
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.9'
    jupytext_version: 1.5.2
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

+++ {"nbpresent": {"id": "90f3c07d-3646-44b0-a549-7020fc10d16f"}, "slideshow": {"slide_type": "slide"}}

# The Laplace Transformation

The preparatory reading for this section is [Chapter 2](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=43) of  {cite}`karris` which

* defines the Laplace transformation 
* gives the most useful properties of the Laplace transform with proofs 
* presents the Laplace transforms of the elementary signals discussed in the last session
* presents the transforms of the more common system response types that are found in basic signals and systems.

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

An annotatable copy for this presentation is available as [**Worksheet 4**](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/worksheet4).

* The source code for this page is [content/laplace_transform/1/index.ipynb](https://github.com/cpjobling/eg-247-textbook/blob/master/laplace_transform/1/laplace.ipynb).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/laplace.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/laplace.pdf) file.

+++ {"nbpresent": {"id": "90f3c07d-3646-44b0-a549-7020fc10d16f"}, "slideshow": {"slide_type": "notes"}}

## Do I really need to learn the theory?

There is some intellectual benefit to being aware of the properties of the Laplace transformation and their proofs but being a pragmatic breed, we engineers typically prefer to make use of quick references of these properties and transforms, relying on Mathematics only when facing a problem not before encountered.

In our practice, we want to encourage you to use of the properties and transform tables to solve problems so I will present only the properties and not the proofs.

+++ {"nbpresent": {"id": "f651cafb-8c2b-4d27-aec9-3491dbcce1aa"}, "slideshow": {"slide_type": "slide"}}

## Agenda

+++ {"nbpresent": {"id": "cdff914d-604d-4ae8-a8e6-8e5caf8bd41e"}, "slideshow": {"slide_type": "fragment"}}

* Definition of the Laplace Transform

+++ {"nbpresent": {"id": "74c922da-bfb7-4f82-808d-a89b61bd1ab6"}, "slideshow": {"slide_type": "fragment"}}

* Some Selected Properties

+++ {"nbpresent": {"id": "e7e4ac91-07af-41a4-98e4-6027ac34b41e"}, "slideshow": {"slide_type": "fragment"}}

* Transforms of Elementary Signals

+++ {"nbpresent": {"id": "11a99664-2fdb-4eff-8389-043965b5a6a5"}, "slideshow": {"slide_type": "subslide"}}

* Common system responses

+++ {"nbpresent": {"id": "a2796ec3-fd12-49d3-99b8-fdc640f0af04"}, "slideshow": {"slide_type": "fragment"}}

* Transform tables

+++ {"nbpresent": {"id": "b90e7c7c-1096-4140-81b3-53a0b7e12f6d"}, "slideshow": {"slide_type": "fragment"}}

* Examples

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "slide"}}

## Definition of the Laplace Transform

+++ {"nbpresent": {"id": "b8f02dd9-8876-4679-89fd-038772c205b9"}, "slideshow": {"slide_type": "subslide"}}

### Laplace transform

$$\mathcal{L}\{f(t)\}=F(s) = \int_{0}^{\infty}f(t)e^{-st}dt$$

+++ {"nbpresent": {"id": "13b40116-d2dd-4b2a-acaa-0988c1ad16b0"}, "slideshow": {"slide_type": "subslide"}}

### Inverse Laplace Transform

$$\mathcal{L}^{-1}\{F(s)\}=f(t)=\frac{1}{2\pi j}\int_{\sigma-j\omega}^{\sigma+j\omega}F(s)e^{st} ds$$

+++ {"nbpresent": {"id": "4ad52fcd-e2e8-4d41-8827-511753bd1148"}, "slideshow": {"slide_type": "notes"}}

### Region of convergence

For a Laplace transfomation to exist, the integral must be bounded. That is
$$\left| {\int_0^\infty  {f(t){e^{ - st}}dt} } \right| < \infty $$

For most signals and systems of interest in this module it will be.

(See discussion of exponential order on Page 2-2 of {cite}`karris`).

+++ {"nbpresent": {"id": "0dcb6800-1c02-4e86-a189-f1875ee1f083"}, "slideshow": {"slide_type": "subslide"}}

### Informal transform notation

The Laplace transform and its inverse come in pairs which are tabulated for ease of reference. For any given function of time $f(t)$ we only need to know the transform

$$f(t)\Leftrightarrow F(s)$$ 

to be able to get to the Laplace transform and *vice versa*.

+++ {"nbpresent": {"id": "352d0877-b48f-4b8d-9082-371f06fef621"}, "slideshow": {"slide_type": "slide"}}

## Some Selected Properties

+++ {"nbpresent": {"id": "1c9ba9ad-1952-4838-966c-f5c382aed98d"}, "slideshow": {"slide_type": "subslide"}}

### Linearity

$$c_1f_1(t) + c_2f_2(t) + \ldots + c_nf_n(t) \Leftrightarrow c_1F_1(s) + c_2F_2(s) + \ldots + c_nF_n(s)$$

+++ {"nbpresent": {"id": "30dac3b5-90de-4b96-870a-762a98a9ec14"}, "slideshow": {"slide_type": "subslide"}}

### Time shift

$$f(t-a)u_0(t-a)\Leftrightarrow e^{-as}F(s)$$

+++ {"nbpresent": {"id": "ba9b31a1-0629-4a44-a66d-396a7db21360"}, "slideshow": {"slide_type": "subslide"}}

### Frequency shift

$$e^{-at}f(t)\Leftrightarrow F(s+a)$$

+++ {"nbpresent": {"id": "54b6a552-29a2-4907-a318-57a92c793a7e"}, "slideshow": {"slide_type": "subslide"}}

### Scaling

$$f(at)\Leftrightarrow \frac{1}{a}F\left(\frac{s}{a}\right)$$

+++ {"nbpresent": {"id": "9385975e-7004-4c81-b8f7-1e59b6c578bb"}, "slideshow": {"slide_type": "subslide"}}

### Differentiation in the time domain

$$f'(t) = \frac{d}{dt} f(t) \Leftrightarrow sF(s) - f(0^-)$$

This property facilitates the solution of differential equations

+++ {"nbpresent": {"id": "94a596bc-4117-4098-8b78-5776baa85cd2"}, "slideshow": {"slide_type": "notes"}}

The differentiation property can be extended to higher-orders as follows
$$f''(t) = \frac{d^2}{dt^2}f(t) \Leftrightarrow s^2F(s) - sf(0^-) - f'(0^-)$$

$$f''(t) = \frac{d^3}{dt^3}f(t) \Leftrightarrow s^3F(s) - s^2f(0) - sf'(0^-) - f''(0^-)$$

and in general

$$f^{(n)}(t) = \frac{d^n}{dt^n}f(t) \Leftrightarrow s^nF(s) - s^{n-1}f(0^-) - s^{n-2}f'(0^-) - \cdots - f^{(n-1)}(0^-)$$

+++ {"nbpresent": {"id": "bc0e0601-4390-4fa4-861b-87554a960643"}, "slideshow": {"slide_type": "subslide"}}

### Differentiation in the complex frequency domain

$$tf(t) \Leftrightarrow -\frac{d}{ds}F(s)$$

and in general

$$t^nf(t) \Leftrightarrow (-1)^n\frac{d^n}{ds^n}F(s)$$

+++ {"nbpresent": {"id": "f93fd2fa-8072-4953-abbc-6e950b92352a"}, "slideshow": {"slide_type": "subslide"}}

### Integration in the time domain

$$\int_{-\infty}^tf(\tau)d\tau \Leftrightarrow \frac{F(s)}{s}+\frac{f(0^-)}{s}$$

+++ {"nbpresent": {"id": "f93fd2fa-8072-4953-abbc-6e950b92352a"}, "slideshow": {"slide_type": "notes"}}

This property is important because it provides a way to model the solution of a differential equation using op-amp integrators in so-called [Analogue Computers](https://en.wikipedia.org/wiki/Analog_computer) and is now the basis for numerical integration systems like Simulink.

+++ {"nbpresent": {"id": "6abec7fb-dc16-4dee-a4e6-78bc0a4ef4f8"}, "slideshow": {"slide_type": "subslide"}}

### Integration in the complex frequency domain

Providing that 

$$\lim_{t\to 0} \frac{f(t)}{t}$$

exists

$$\frac{f(t)}{t}\Leftrightarrow \int_s^\infty F(s)ds$$

+++ {"nbpresent": {"id": "9c3efaa7-edf9-42e1-b35d-302a88719f7b"}, "slideshow": {"slide_type": "subslide"}}

### Time periodicity property

If $f(t)$ is a periodic function with period $T$ such that $f(t) = f(t+nT)$ for $n=1,2,3,\ldots$ then

$$f(t+nT) \Leftrightarrow \frac{\int_0^T f(t)e^{-st}dt}{1-e^{-sT}}$$

+++ {"nbpresent": {"id": "2d3c3350-228e-4b8f-8a2f-8244033a00af"}, "slideshow": {"slide_type": "subslide"}}

### Initial value theorem

$$\lim_{t\to 0}f(t) \Leftrightarrow \lim_{s\to \infty} sF(s) = f(0^-)$$

+++ {"nbpresent": {"id": "9b6d70ca-bf5a-4366-8701-b5ec61b24e93"}, "slideshow": {"slide_type": "subslide"}}

### Final value theorem

$$\lim_{t\to \infty}f(t) \Leftrightarrow \lim_{s\to 0} sF(s) = f(\infty)$$

+++ {"nbpresent": {"id": "509b27f0-eef5-446b-b7be-6be1757afd6a"}, "slideshow": {"slide_type": "subslide"}}

### Convolution in the time domain

$$f_1(t)*f_2(t) = \int_{0}^{t}f_1(\tau)f_2(t-\tau) d\tau \Leftrightarrow F_1(s) F_2(s)$$

+++ {"nbpresent": {"id": "509b27f0-eef5-446b-b7be-6be1757afd6a"}, "slideshow": {"slide_type": "notes"}}

This is another important result as it allows us to compute the response of a system by simply multiplying the Laplace transforms of the system and the signal and then inverse Laplace transforming the result. 

This is usually much simpler than computing the convolution integral in the time domain &ndash; an operation we we see later!

+++ {"nbpresent": {"id": "c9bee9cc-fcec-4bbf-922d-74d59842e5b7"}, "slideshow": {"slide_type": "subslide"}}

### Convolution in the complex frequency domain

Multiplying two signals together in the time domain is the same as performing convolution in the complex frequency domain. 

$$f_1(t)f_2(t) \Leftrightarrow \frac{1}{2\pi j}F_1(s) * F_2(s) = \frac{1}{2\pi j}\lim_{T\to \infty}\int_{c-jT}^{c+jT}F_1(\sigma)F_2(s-\sigma)d\sigma$$

Convolution in the complex frequency domain is nasty &ndash; multiplication in the time domain is relatively painless.

+++ {"nbpresent": {"id": "e58f747d-f0a8-464d-b62f-f7bb9ce8b605"}, "slideshow": {"slide_type": "slide"}}

## Transform tables

Every textbook that covers Laplace transforms will provide a tables of properties and the most commonly encountered transforms. Karris is no exception and you will find a table of transforms in Tables 2.1 and 2.2. 

Here are a couple that are on the net for your reference

* Laplace transform [(Wikipedia)](https://en.wikipedia.org/wiki/Laplace_transform)
* Laplace Transform [(Wolfram Alpha)](https://mathworld.wolfram.com/LaplaceTransform.html)

+++ {"nbpresent": {"id": "0deac4e0-df0c-4513-a0ae-81ed56e94aec"}, "slideshow": {"slide_type": "subslide"}}

### Don't panic

Tables of Laplace transform properties and transforms will be included with the exam paper.

+++ {"nbpresent": {"id": "2a56e188-1891-420a-a66b-be808a1a11e2"}, "slideshow": {"slide_type": "slide"}}

## Transforms of Elementary Signals

<table width="60%">
<thead>
<tr><td width="10%">&nbsp;</td><th width="40%">f(t)</th><th width="40%">F(s)</th></tr>
</thead>
<tbody>
<tr><td>1</td><td>$$\delta(t)$$</td><td>$$1$$</td></tr>
<tr><td>2</td><td>$$\delta(t-a)$$</td><td>$$e^{-as}$$</td></tr>
<tr><td>3</td><td>$$u_0(t)$$</td><td>$$\frac{1}{s}$$</td></tr>
<tr><td>4</td><td>$$t u_0(t)$$</td><td>$$\frac{1}{s^2}$$</td></tr>
<tr><td>5</td><td>$$t^n u_0(t)$$</td><td>$$\frac{n!}{s^{n+1}}$$</td></tr>
<tr><td>6</td><td>$$e^{-at}u_0(t)$$</td><td>$$\frac{1}{s+a}$$</td></tr>
<tr><td>7</td><td>$$t^n e^{-at} u_0(t)$$</td><td>$$\frac{n!}{(s+a)^{n+1}}$$</td></tr>
<tr><td>8</td><td>$$\sin (\omega t) u_0(t)$$</td><td>$$\frac{\omega}{s^2 + \omega^2}$$</td></tr>
<tr><td>9</td><td>$$\cos (\omega t) u_0(t)$$</td><td>$$\frac{s}{s^2 + \omega^2}$$</td></tr>
<tr><td>10</td><td>$$e^{-at} \sin (\omega t) u_0(t)$$</td><td>$$\frac{\omega}{(s + a)^2 + \omega^2}$$</td></tr>
<tr><td>11</td><td>$$e^{-at}\cos (\omega t) u_0(t)$$</td><td>$$\frac{s+a}{(s+a)^2 + \omega^2}$$</td></tr>
</tbody>
</table>


Refer to the textbook if you want to see the proof of these transforms.

+++ {"nbpresent": {"id": "f49c045e-0507-4c62-8cb2-9389df04b6b9"}, "slideshow": {"slide_type": "slide"}}

## Laplace transforms of common waveforms

We will work through a few of the following on the board in class

* Pulse
* Linear segment
* Triangular waveform
* Rectangular periodic waveform (square wave)
* Half rectified sine wave

+++ {"nbpresent": {"id": "027ac91d-b792-4ffb-a0b4-72a4a144638b"}, "slideshow": {"slide_type": "slide"}}

## Using Matlab to Find Laplace Transforms

The Matlab function `laplace` can be used to find laplace transforms of time functions. The lab exercises will illustrate this.

+++ {"nbpresent": {"id": "4f9f0fa3-84d5-45c3-a6fd-78f84f94388c"}, "slideshow": {"slide_type": "slide"}}

## Homework

Attempt at least one of the end-of-chapter exercises from each question 1-7 of [Section 2.7](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=71) of {cite}`karris` . Don't look at the answers until you have attempted the problems.

If we have time, I will work through one or two of these in class.

## Reference

See [Bibliography](/zbib)
