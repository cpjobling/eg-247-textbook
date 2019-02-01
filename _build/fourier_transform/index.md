---
redirect_from:
  - "/fourier-transform/index"
title: 'Fourier Transform'
prev_page:
  url: /fourier_series/3/exp_fs2
  title: 'Line Spectra and their Applications'
next_page:
  url: /fourier_transform/1/ft1
  title: 'Defining the Fourier Transform'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---
# Fourier Transform

This chapter continues our coverage of **Fourier Analysis** with an introduction to the **Fourier Transform**.

* **Fourier Series** is used when we are dealing with signals that are *periodic* in time. It is based on harmonics of the fundamental frequency $\omega_0$ of the periodic signal where the period $T = 2\pi/\omega_0$.

* The line spectrum occur at integer multiples of the fundamental frequency $k\omega_0$ and is a *discrete* (or sampled) function of frequency.

* As the period $T$ is increased, the distance between harmonics decreases because $\omega_0$ reduces.

* In the limit $T\to \infty$, the signal becomes **aperiodic** and $k\omega_0 \to \omega$ which is a *continuous* function of frequency.

This is the basis of the **Fourier Transform** which is very important as the basis for data transmission, signal filtering, and the determination of system frequency reponse.

## Scope and Background Reading

The material in this presentation and notes is based on Chapter 8 (Starting at Section 8.1) of [Steven T. Karris, Signals and Systems: with Matlab Computation and Simulink Modelling, 5th Edition.](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?ppg=271&docID=3384197&tm=1518709033960) from the **Required Reading List**. I also used Chapter 5 of [Benoit Boulet, Fundamentals of Signals and Systems](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?ppg=194&docID=3135971&tm=1518709078944) from the **Recommended Reading List**.