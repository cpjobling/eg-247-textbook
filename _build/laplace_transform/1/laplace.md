---
redirect_from:
  - "/laplace-transform/1/laplace"
interact_link: content/laplace_transform/1/laplace.ipynb
title: 'The Laplace Transformation'
prev_page:
  url: /laplace_transform/index
  title: 'Laplace Transforms and their Applications'
next_page:
  url: /laplace_transform/2/inverse_laplace
  title: 'The Inverse Laplace Transform'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# The Laplace Transformation

The preparatory reading for this section is [Chapter 2 of Karris](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=43) which

* defines the Laplace transformation 
* gives the most useful properties of the Laplace transform with proofs 
* presents the Laplace transforms of the elementary signals discussed in the last session
* presents the transforms of the more common system response types that are found in basic signals and systems.

An annotatable copy of the full notes for this presentation will be distributed before the second class meeting as **Worksheet 4** in the handouts section for week 2 in the *_Content Library* of the **OneNote Class Notebook**. You can also view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/laplace.html)) and as a downloadable [PDF file](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/laplace.pdf).

There is some intellectual benefit to being aware of the properties of the Laplace transformation and their proofs but being a pragmatic breed, we engineers typically prefer to make use of quick references of these properties and transforms, relying on Mathematics only when facing a problem not before encountered.

In our practice, we want to encourage you to use of the properties and transform tables to solve problems so I will present only the properties and not the proofs.

## Agenda

* Definition of the Laplace Transform

* Some Selected Properties

* Transforms of Elementary Signals

* Common system responses

* Transform tables

* Examples

## Definition of the Laplace Transform

### Laplace transform

$$\mathcal{L}\{f(t)\}=F(s) = \int_{0}^{\infty}f(t)e^{-st}dt$$

### Inverse Laplace Transform

$$\mathcal{L}^{-1}\{F(s)\}=f(t)=\frac{1}{2\pi j}\int_{\sigma-j\omega}^{\sigma+j\omega}F(s)e^{st} ds$$

### Region of convergence

For a Laplace transfomation to exist, the integral must be bounded. That is
$$\left| {\int_0^\infty  {f(t){e^{ - st}}dt} } \right| < \infty $$

For most signals and systems of interest in this module it will be.

(See discussion of exponential order on Page 2-2 of Karris).

### Informal transform notation

The Laplace transform and its inverse come in pairs which are tabulated for ease of reference. For any given function of time $f(t)$ we only need to know the transform

$$f(t)\Leftrightarrow F(s)$$ 

to be able to get to the Laplace transform and *vice versa*.

## Some Selected Properties

### Linearity

$$c_1f_1(t) + c_2f_2(t) + \ldots + c_nf_n(t) \Leftrightarrow c_1F_1(s) + c_2F_2(s) + \ldots + c_nF_n(s)$$

### Time shift

$$f(t-a)u_0(t-a)\Leftrightarrow e^{-as}F(s)$$

### Frequency shift

$$e^{-at}f(t)\Leftrightarrow F(s+a)$$

### Scaling

$$f(at)\Leftrightarrow \frac{1}{a}F\left(\frac{s}{a}\right)$$

### Differentiation in the time domain

$$f'(t) = \frac{d}{dt} f(t) \Leftrightarrow sF(s) - f(0^-)$$

This property facilitates the solution of differential equations

The differentiation property can be extended to higher-orders as follows
$$f''(t) = \frac{d^2}{dt^2}f(t) \Leftrightarrow s^2F(s) - sf(0^-) - f'(0^-)$$

$$f''(t) = \frac{d^3}{dt^3}f(t) \Leftrightarrow s^3F(s) - s^2f(0) - sf'(0^-) - f''(0^-)$$

and in general

$$f^{(n)}(t) = \frac{d^n}{dt^n}f(t) \Leftrightarrow s^nF(s) - s^{n-1}f(0^-) - s^{n-2}f'(0^-) - \cdots - f^{(n-1)}(0^-)$$

### Differentiation in the complex frequency domain

$$tf(t) \Leftrightarrow -\frac{d}{ds}F(s)$$

and in general

$$t^nf(t) \Leftrightarrow (-1)^n\frac{d^n}{ds^n}F(s)$$

### Integration in the time domain

$$\int_{-\infty}^tf(\tau)d\tau \Leftrightarrow \frac{F(s)}{s}+\frac{f(0^-)}{s}$$

This property is important because it provides a way to model the solution of a differential equation using op-amp integrators in so-called [Analogue Computers](http://en.wikipedia.org/wiki/Analog_computer) and is now the basis for numerical integration systems like Simulink.

### Integration in the complex frequency domain

Providing that 

$$\lim_{t\to 0} \frac{f(t)}{t}$$

exists

$$\frac{f(t)}{t}\Leftrightarrow \int_s^\infty F(s)ds$$



### Time periodicity property

If $f(t)$ is a periodic function with period $T$ such that $f(t) = f(t+nT)$ for $n=1,2,3,\ldots$ then

$$f(t+nT) \Leftrightarrow \frac{\int_0^T f(t)e^{-st}dt}{1-e^{-sT}}$$

### Initial value theorem

$$\lim_{t\to 0}f(t) \Leftrightarrow \lim_{s\to \infty} sF(s) = f(0^-)$$

### Final value theorem

$$\lim_{t\to \infty}f(t) \Leftrightarrow \lim_{s\to 0} sF(s) = f(\infty)$$

### Convolution in the time domain

$$f_1(t)*f_2(t) = \int_{0}^{t}f_1(\tau)f_2(t-\tau) d\tau \Leftrightarrow F_1(s) F_2(s)$$

This is another important result as it allows us to compute the response of a system by simply multiplying the Laplace transforms of the system and the signal and then inverse Laplace transforming the result. 

This is usually much simpler than computing the convolution integral in the time domain &ndash; an operation we we see later!

### Convolution in the complex frequency domain

Multiplying two signals together in the time domain is the same as performing convolution in the complex frequency domain. 

$$f_1(t)f_2(t) \Leftrightarrow \frac{1}{2\pi j}F_1(s) * F_2(s) = \frac{1}{2\pi j}\lim_{T\to \infty}\int_{c-jT}^{c+jT}F_1(\sigma)F_2(s-\sigma)d\sigma$$

Convolution in the complex frequency domain is nasty &ndash; multiplication in the time domain is relatively painless.

## Transform tables

Every textbook that covers Laplace transforms will provide a tables of properties and the most commonly encountered transforms. Karris is no exception and you will find a table of transforms in Tables 2.1 and 2.2. 

Here are a couple that are on the net for your reference

* Laplace transform [(Wikipedia)](http://en.wikipedia.org/wiki/Laplace_transform)
* Laplace Transform [(Wolfram Alpha)](http://mathworld.wolfram.com/LaplaceTransform.html)

### Don't panic

Tables of Laplace transform properties and transforms will be included with the exam paper.

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

## Laplace transforms of common waveforms

We will work through a few of the following on the board in class

* Pulse
* Linear segment
* Triangular waveform
* Rectangular periodic waveform (square wave)
* Half rectified sine wave

## Using Matlab to Find Laplace Transforms

The Matlab function `laplace` can be used to find laplace transforms of time functions. The lab exercises will illustrate this.

## Homework

Attempt at least one of the end-of-chapter exercises from each question 1-7 of [Section 2.7 of Karris](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=71). Don't look at the answers until you have attempted the problems.

If we have time, I will work through one or two of these in class.
