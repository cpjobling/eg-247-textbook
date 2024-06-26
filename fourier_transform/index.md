---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.15.2
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

(unit4)=
# Unit 4: Fourier Transform

This chapter continues our coverage of **Fourier Analysis** with an introduction to the **Fourier Transform**.

* **Fourier Series** is used when we are dealing with signals that are *periodic* in time. It is based on harmonics of the fundamental frequency $\Omega_0$ of the periodic signal where the period $T = 2\pi/\Omega_0$.

* The line spectrum occur at integer multiples of the fundamental frequency $k\omega_0$ and is a *discrete* (or sampled) function of frequency.

* As the period $T$ is increased, the distance between harmonics decreases because $\Omega_0$ reduces.

* In the limit $T\to \infty$, the signal becomes **aperiodic** and $k\Omega_0 \to \omega$ which is a *continuous* function of frequency.

This is the basis of the **Fourier Transform** which is very important as the basis for data transmission, signal filtering, and the determination of system frequency response.

## Scope and Background Reading

The material in this presentation and notes is based on Chapter 8 (Starting at Section 8.1) of Karris {cite}`karris`. I also used Chapter 5 of {cite}`boulet` which unfortunately is no longer available as an e-book from the library.

## Contents

In this section of the course we will cover:

* {ref}`ft1`
* {ref}`ft2`
* {ref}`ft3`
* {ref}`ft4`


```python

```
