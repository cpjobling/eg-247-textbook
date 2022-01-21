---
jupytext:
  formats: ipynb,md:myst
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

# The Inverse Laplace Transform

+++ {"slideshow": {"slide_type": "notes"}}

The preparatory reading for this section is [Chapter 3](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=79) of {cite}`karris` which

* defines the Inverse Laplace transformation 
* gives several examples of how the Inverse Laplace Transform may be obtained
* thouroughly decribes the Partial Fraction Expansion method of converting complex rational polymial expressions into simple first-order and quadratic terms
* demonstrates the use of MATLAB for finding the poles and residues of a rational polymial in s and the symbolic inverse laplace transform

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

An annotatable worksheet for this presentation is available as [**Worksheet 5**](https://cpjobling.github.io/eg-247-textbook/laplace_transform/2/worksheet5.html).

* The source code for this page is [laplace_transform/2/inverse_laplace.ipynb](https://github.com/cpjobling/eg-247-textbook/blob/master/laplace_transform/2/inverse_laplace.ipynb).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/laplace_transform/2/inverse_laplace.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/laplace_transform/2/inverse_laplace.pdf) file.

+++ {"slideshow": {"slide_type": "slide"}}

## Definition

The formal definition of the Inverse Laplace Transform is

$$\mathcal{L}^{-1}\left\{ F(s) \right\} = \frac{1}{2\pi j}\int_{\sigma-j\omega}^{\sigma+j\omega} f(t)e^{st}ds$$

but this is difficult to use in practice because it requires contour integration using complex variable theory.

+++ {"slideshow": {"slide_type": "subslide"}}

For most engineering problems we can instead refer to **Tables of Properties** and **Common Transform Pairs** to look up the *Inverse Laplace Transform*

+++ {"slideshow": {"slide_type": "subslide"}}

(Or, if we are not taking an exam, we can use a computer or mobile device.)

+++ {"slideshow": {"slide_type": "slide"}}

## Partial Fraction Expansion

Quite often the Laplace Transform we start off with is a *rational polynomial* in $s$.

$$F(s) = \frac{N(s)}{D(s)} = \frac{b_ms^m + b_{m-1}s^{m-1}+b_{m-2}s^{m-2}+ \cdots +b_{1}s+b_{0}}{a_ns^n + a_{n-1}s^{n-1}+a_{n-2}s^{n-2}+ \cdots +a_{1}s+a_{0}}$$

The coefficients $a_k$ and $b_k$ are real for $k = 1, 2, 3, \ldots$

+++ {"slideshow": {"slide_type": "subslide"}}

### Proper and Improper Rational Functions

* If $m < n$ $F(s)$ is said to be a *proper rational function*. 
* If $m \ge n$ $F(s)$ is said to be an *improper rational function* 

(Think [proper fractions](https://www.mathsisfun.com/proper-fractions.html) and [improper fractions](https://www.mathsisfun.com/improper-fractions.html).)

+++ {"slideshow": {"slide_type": "subslide"}}

### Zeros

* The *roots* of the numerator polymonial $N(s)$ are found by setting $N(s)=0$
* When $s$ equals one of the $m$ roots of $N(s)$ then $F(s)$ will be zero.
* Thus the roots of $N(s)$ are the **zeros** of $F(s)$.

+++ {"slideshow": {"slide_type": "subslide"}}

### Poles

* The *roots* (*zeros*) of the denominator polynomial are found by setting $D(s) = 0$. 
* When $s$ equals one of the $n$ roots of $D(s)$ then $F(s)$ will be infinite $F(s_r) = N(s_r)/0=\infty$).
* These are called the **poles** of $F(s)$.

(Imagine telegraph poles planted at the points on the $s$-plane where $D(s)$ is zero.)

+++ {"slideshow": {"slide_type": "subslide"}}

### A Further Simplifying Assumption

If $F(s)$ is proper then it is conventional to make the coefficient $s_n$ unity thus:

$$F(s) = \frac{N(s)}{D(s)} = \frac{1/{a_n}\left({ {b_m}{s^m} + {b_{m - 1}}{s^{m - 1}} + {b_{m - 2}}{s^{m - 2}} +  \cdots  + {b_1}s + {b_0}} \right)}{s^n + \frac{a_{n - 1}}{a_n}{s^{n - 1}} + \frac{a_{n - 2}}{a_n}{s^{n - 2}} +  \cdots  + \frac{a_1}{a_n}s + \frac{a_0}{a_n}}$$

(I know it doesn't look simpler, but remember that the $a$ and $b$ coefficients are numbers in practice!)

+++ {"slideshow": {"slide_type": "slide"}}

## Inverse Laplace Transform by Partial Fraction Expansion (PFE)

The poles of $F(s)$ can be real and distinct, real and repeated, complex conjugate pairs, or a combination.

+++ {"slideshow": {"slide_type": "subslide"}}

### Defining the problem

The nature of the poles governs the best way to tackle the PFE that leads to the solution of the Inverse Laplace Transform. Thus, we need to structure our presentation to cover one of the following cases:

* The case where $F(s)$ has distinct poles
* The case where $F(s)$ has complex poles
* The case where $F(s)$ has repeated poles
* The case where $F(s)$ is an improper rational polynomial

We will examine each case by means of a worked example. Please refer to Chapter 3 of Karris for full details.

+++ {"slideshow": {"slide_type": "slide"}}

## The case of the distinct poles

+++ {"slideshow": {"slide_type": "fragment"}}

If the poles $p_1,\,p_2,\,p_3,\,\ldots,\, p_n$ are *distinct* we can factor the denominator of F(s) in the form 

$$F(s) = \frac{N(s)}{(s-p_1)(s-p_2)(s-p_3)\ldots(s-p_n)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Next, using *partial fraction expansion*

$$F(s)=\frac{r_1}{s-p_1}+\frac{r_2}{s-p_2}+\frac{r_3}{s-p_3}+\cdots + \frac{r_n}{s-p_n}$$

+++ {"slideshow": {"slide_type": "subslide"}}

To evaluate the *residue* $r_k$, we multiply both sides by $(s-p_k)$ then let $s \to p_k$

$$r_k = \lim_{s\to p_k}(s-p_k)F(s) = \left.(s-p_k)F(s)\right|_{s=p_k}$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 1

Use the PFE method to simplify $F_1(s)$ below and find the time domain function $f_1(t)$ corresponding to $F_1(s)$

$$F_1(s) = \frac{2s+5}{s^2 + 5s + 6}$$

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%7B(2s+%2B+5)%2F(s%5E2+%2B+5s+%2B+6)%7D)

+++ {"slideshow": {"slide_type": "subslide"}}

#### Matlab Solution - Numerical

```{code-cell} matlab
---
slideshow:
  slide_type: notes
---
clear all
format compact
imatlab_export_fig('print-svg')  % Static svg figures.
```

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
Ns = [2, 5]; Ds = [1, 5, 6];
[r,p,k] = residue(Ns, Ds)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Interpreted as:

$$F_1(s) = \frac{1}{s + 3} + \frac{1}{s + 2}$$

which because of the linearity property of the Laplace Transform and using tables results in the *Inverse Laplace Transform*

$$f_1(t) = e^{-3t} + e^{-2t}$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Matlab solution - symbolic

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
syms s t;
Fs = (2*s + 5)/(s^2 + 5*s + 6);
ft = ilaplace(Fs);
pretty(ft)
```

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 2

Determine the Inverse Laplace Transform of

$$F_2(s) = \frac{3s^2+2s+5}{s^3 + 9s^2 + 23s + 15}$$

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%283s%5E2+%2B+2s+%2B+5%29%2F%28s%5E3+%2B+9s%5E2+%2B+23s+%2B+15%29))

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution 2

+++ {"slideshow": {"slide_type": "fragment"}}

Because the denominator of $F_2(s)$ is a cubic, it will be difficult to factorise without computer assistance so we use Matlab to factorise $D(s)$

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
syms s;
factor(s^3 + 9*s^2 + 23*s + 15)
```

+++ {"slideshow": {"slide_type": "notes"}}

In an exam you'd be given the factors

+++ {"slideshow": {"slide_type": "subslide"}}

We can now use the previous technique to find the solution which according to Matlab should be

$$f_1(t) = \frac{3}{4}e^{-t} - \frac{13}{2}e^{-3t} + \frac{35}{4}e^{-5t}$$

We will prove this in class.

+++ {"slideshow": {"slide_type": "slide"}}

## The case of the complex poles

Quite often the poles of $F(s)$ are complex and because the complex poles occur as complex conjugate pairs, the number of complex poles is even. Thus if $p_k$ is a complex root of $D(s)$ then its complex conjugate $p_k^*$ is also a root of $D(s)$.

+++ {"slideshow": {"slide_type": "subslide"}}

You can still use the PFE with complex poles, as demonstrated in Pages 3-5&mdash;3-7 in the textbook. However it is easier to use the fact that complex poles will appear as quadratic factors of the form $s^2 + as + b$ and then call on the two transforms in the PFE


$$\frac{\omega}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\sin\;\omega t$$

$$\frac{s + a}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\cos\;\omega t$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 3

Rework Example 3-2 from the text book using quadratic factors.

Find the Inverse Laplace Transform of 

$$F_3(s) = \frac{s + 3}{(s+1)(s^2 + 4s + 8)}$$

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s+%2B+1%29%28s%5E2+%2B+4s+%2B+8%29%29) &ndash; Shows that the computer is not always best!)

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution 3

We complete the square 

$$s^2 + 4s + 8 = (s + 2)^2 + 4$$

Then comparing this with the desired form $(s - a)^2 + \omega^2$, we have $a = -2$ and $\omega^2 = 4 \to \omega = \sqrt{4} = 2$.

To solve this, we need to find the PFE for the assumed solution:

$$F_3(s) = \frac{r_1}{s+1} + \frac{r_2(s+2)}{(s + 2)^2 + 2^2} \frac{2 r_3}{(s + 2)^2 + 2^2}  $$

expecting the solution

$$f_3(t) = \frac{2}{5}e^{-t} - \frac{2}{5} e^{-2t}\cos 2t + \frac{3}{10} e^{-2t}\sin 2t$$

You can use trig. identities to simplify this further if you wish.

+++ {"slideshow": {"slide_type": "slide"}}

## The case of the repeated poles

When a rational polynomial has repeated poles 

$$F(s) = \frac{N(s)}{(s - p_1)^m(s - p_2)\cdots(s - p_{n-1})(s-p_0)}$$

and the PFE will have the form:

$$\begin{array}{c}
F(s) = \frac{r_{11}}{(s - {p_1})^m} + \frac{r_{12}}{(s - {p_1})^{m - 1}} + \frac{r_{13}}{(s - {p_1})^{m - 2}} +  \cdots  + \frac{r_{1}}{(s - {p_1})}\\
 + \frac{r_2}{(s - {p_2})} + \frac{r_3}{(s - {p_3})} +  \cdots  + \frac{r_n}{(s - {p_n})}
\end{array}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The ordinary residues $r_k$ can be found using the rule used for distinct roots.

To find the residuals for the repeated term $r_{1k}$ we need to multiply both sides of the expression by $(s+p_1)^m$ and take repeated derivatives as described in detail in Pages 3-7&mdash;3-9 of the text book. This yields the general formula

$$r_{1k}=\lim_{s\to p_1}\frac{1}{(k-1)!}\frac{d^{k-1}}{ds^{k-1}}\left[(s-p_1)^mF(s)\right]$$

which in the age of computers is rarely needed.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 4

Find the inverse Laplace Transform of 

$$F_4(s) = \frac{s+3}{(s+2)(s+1)^2}$$

Note that the transform

$$te^{at} \Leftrightarrow \frac{1}{(s - a)^2}$$

will be useful.

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s%2B2%29%28s+%2B+1%29%5E2%29))

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution 4

We will leave the solution that makes use of the residude of repeated poles formula for you to study from the text book. In class we will illustrate the slightly simpler approach also presented in the text. 

For exam preparation, I would recommend that you use whatever method you find most comfortable.

+++ {"slideshow": {"slide_type": "subslide"}}

## The case of the improper rational polynomial

If $F(s)$ is an improper rational polynomial, that is $m \ge n$, we must first divide the numerator $N(s)$ by the denomonator $D(s)$ to derive an expression of the form

$$F(s) = k_0 + k_1s + k_2s^2 + \cdots + k_{m-n}s^{m-n} + \frac{N(s)}{D(s)}$$

and then $N(s)/D(s)$ will be a proper rational polynomial.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 5 - and some new transform pairs.

$$F_6(s)= \frac{s^2 + 2s + 2}{s+1}$$

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%5E2+%2B+2s+%2B+2%29%2F%28s+%2B+1%29))

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution 5

Dividing $s^2 + 2s + 2$ by $s + 1$ gives

$$F_6(s) = s + 1 + \frac{1}{s+1}$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\frac{1}{s+1} \Leftrightarrow e^{-t}$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$1 \Leftrightarrow \delta(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$s \Leftrightarrow ?$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### What function of t has Laplace transform s?

+++ {"slideshow": {"slide_type": "subslide"}}

Recall from Session 2:
    
$$\frac{d}{dt}u_0(t)=u_0'(t)=\delta(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

and

$$\frac{d^2}{dt^2}u_0(t)=u_0''(t)=\delta'(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

Also, by the time differentiation property

$$u_0''(t)=\delta'(t)\Leftrightarrow s^2\mathcal{L}u_0(t) - su_0(0) - \left.\frac{d}{dt}u_0(t)\right|_{t=0} =  s^2\frac{1}{s} = s$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### New Transform Pairs

+++ {"slideshow": {"slide_type": "fragment"}}

$$s\Leftrightarrow \delta'(t)$$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\frac{d^n}{dt^n}\delta(t)\Leftrightarrow s^n$$

+++ {"slideshow": {"slide_type": "subslide"}}

$$f_6(t) = e^{-t}+\delta(t)+\delta'(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Matlab verification

```{code-cell} matlab
Ns = [1, 2, 2]; Ds = [1 1];
[r, p, k] = residue(Ns, Ds)
```

```{code-cell} matlab
---
slideshow:
  slide_type: subslide
---
syms s;
F6 = (s^2 + 2*s + 2)/(s + 1);
f6 = ilaplace(F6)
```

+++ {"slideshow": {"slide_type": "slide"}}

## Homework

Do the end of the chapter exercises (Section 3.67) from the {cite}`karris`. Don't look at the answers until you have attempted the problems.

+++ {"slideshow": {"slide_type": "slide"}}

## Matlab Solutions

For convenience, single script MATLAB solutions to the examples are provided and can be downloaded from the accompanying [MATLAB](https://github.com/cpjobling/eg-247-textbook/tree/master/laplace_transform/matlab) folder.

* Example 1 - Real poles [[ex3_1.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_1.m)]
* Example 2 - Real poles cubic denominator [[ex3_2.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_2.m)]
* Example 3 - Complex poles [[ex3_3.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_3.m)]
* Example 4 - Repeated real poles [[ex3_4.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_4.m)]
* Example 5 - Non proper rational polynomial [[ex3_5.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_5.m)]

```{code-cell} matlab
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
cd ../matlab
ls
open ex3_1
```

+++ {"slideshow": {"slide_type": "slide"}}

## Lab Work

In the lab, next Tuesday, we will explore the tools provided by MATLAB for taking Laplace transforms, representing polynomials, finding roots and factorizing polynomials and solution of inverse Laplace transform problems.

+++ {"slideshow": {"slide_type": "notes"}}

## Reference

See [Bibliography](/zbib)
