---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.14.4
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

<!-- #region slideshow={"slide_type": "slide"} -->
# Answers to Worksheet 2

Consider a signal 

$$x = f(t) = \left\{ {\begin{array}{*{20}{c}}
{0\;:\;t <  - 1}\\
{t + 1\;:\; - 1 \le t \le 1}\\
{0\;:\;t > 1}
\end{array}} \right.$$

Sketch this signal

<img src="pictures/sig1.png">

plot the effect on this signal of applying the following basic signal operations

## Amplitude scaling

<img src="pictures/sigs2.png">

## Time scaling

<img src="pictures/sigs3.png">

## Mirroring

<img src="pictures/sigs4.png">

## Time shifting - delay and advance

<img src="pictures/sigs5.png">

## Exercise

We leave the solution of $-2f(-t+2)$ as an exercise for the reader but note that it involves *amplitude scaling*, *amplitude mirroring*, *time mirroring*, and a *time shift*. Each operation can be performed in sequence in any order.
<!-- #endregion -->
