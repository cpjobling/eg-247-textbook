---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.14.1
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

<!-- #region slideshow={"slide_type": "slide"} -->
# Homework 2

## The Laplace and Inverse Laplace Transforms

This questions are based on the end of Chapter 2 and Chapter 3 questions in Karris{cite}`karris`.

### The Laplace Transform

We will distribute this PDF to the _Homework_ section of your personal section of the **OneNote Class Notebook** then you can use the *ink feature* (if supported) to hand-write or sketch your answers. You may wish to use MATLAB to solve or check your solutuons to some of these problems. You may include your MATLAB solutions as extra items in your records for [Lab 2](../labs/lab02/index).

<i>Hint</i>: $u_0(t)$ is used as a "gating function" which changes the limits on the Laplace transform integral.

1. Derive the Laplace transformation of the following time domain signals: 
   1. $13$;
   2. $5u_0(t)$;
   3. $22u_0(t - 10)$;
   4. $6tu_0(t)$;
   5. $3t^4u_0(t)$.
   
2. Derive the Laplace transformation of the following time domain signals: 
   1. $j10$;
   2. $j6\angle -90^\circ$;
   3. $4e^{-4t}u_0(t)$;
   4. $7t^6e^{-4t}u_0(t)$;
   5. $14\delta(t)$.
   
3. Derive the Laplace transformation of the following time domain signals: 
   1. $\left(t^3 + 4t^2 + 3t + 5\right)u_0(t)$;
   2. $3(3t-2)\delta(t-3)$;
   4. $\left(2\sin 4t\right)u_0(t)$;
   5. $\left(7\cos5t\right)u_0(t)$.
   
4. Derive the Laplace transformation of the following time domain signals: 
   1. $3t\left(\sin 5t\right)u_0(t)$;
   2. $2t^2\left(\cos 3t\right)u_0(t)$;
   3. $2e^{-5t}\sin 5t$;
   4. $8e^{-3t}\cos 4t$;
   5. $\left(\cos t\right)\delta(t-\pi/4)$.

5. Derive the Laplace transformation of the following time domain signals: 
   1. $5tu_0(t-3)$;
   2. $\left(2t^2 - 5t + 4\right)u_0(t-3)$;
   3. $(t-3)e^{-2t}u_0(t-2)$.
   
6. Derive the Laplace transformation of the following derivatives: 
   1. $$\frac{d}{dt}\left(\sin 3t\right);$$
   2. $$\frac{d}{dt}\left(3e^{-4t}\right).$$
<!-- #endregion -->

### The Inverse Laplace Transform

Find the inverse Laplace transform of the following:

1. $$\frac{5}{s+2}$$
2. $$\frac{2}{(s+2)(s+4)}$$
3. $$\frac{6}{(s+2)^2}$$
4. $$\frac{4s+2}{s^2+4s+85}$$



### Reference

See [Bibliography](/zbib).

