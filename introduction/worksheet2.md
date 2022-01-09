---
jupytext:
  formats: md:myst,ipynb
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

# Worksheet 2

Download as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet2.pdf).

+++ {"slideshow": {"slide_type": "slide"}}

Consider a signal 

$$x = f(t) = \left\{ {\begin{array}{*{20}{c}}
{0\;:\;t <  - 1}\\
{t + 1\;:\; - 1 \le t \le 1}\\
{0\;:\;t > 1}
\end{array}} \right.$$

Sketch this signal

<pre style="border: 2px solid blue">









</pre>

Sketch the effect on this signal of applying the following basic signal operations

+++ {"slideshow": {"slide_type": "slide"}}

## Amplitude scaling

$$2f(t)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

$$0.5 f(t)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## Time scaling

$$f(2t)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

$$f(0.5 t)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## Mirroring

$$-f(t)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

$$f(-t)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

$$-f(-t)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## Time shifting - delay and advance

$$f(t - 1)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

$$f(t + 1)$$

<pre style="border: 2px solid blue">









</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

## Exercise

We leave the solution of $-2f(-t+2)$ as an exercise for the reader but note that it involves *amplitude scaling*, *amplitude mirroring*, *time mirroring*, and a *time shift*. Each operation can be performed in sequence in any order.
