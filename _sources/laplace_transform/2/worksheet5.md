---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.4
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

# Worksheet 5

## To accompany Chapter 3.2 Inverse Laplace Transform

+++ {"slideshow": {"slide_type": "notes"}}

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet5.pdf). We will step through this worksheet in class. 

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 5** in the **Week 2: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 

You are expected to have at least watched the video presentation of [Chapter 3.2](https://cpjobling.github.io/eg-247-textbook/laplace_transform/2/inverse_laplace) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

After class, the lecture recording and the annotated version of this worksheet will be made available through Canvas.

```{code-cell}
---
slideshow:
  slide_type: skip
---
clear all
format compact
```

+++ {"slideshow": {"slide_type": "slide"}}

## Quiz

+++ {"slideshow": {"slide_type": "subslide"}}

### Question 2: Inverse Laplace transforms

Inverse laplace transform the following


<table>
<tr><td>1.</td><td>
    
$$1$$
    
</td><td>A.</td><td>
    
$$e^{-at}$$
    
</td></tr>
<tr><td>2.</td><td>
    
$$\frac{1}{s}$$
    
</td><td>B.</td><td>
    
$$\delta'(t)$$
    
</td></tr>
<tr><td>3.</td><td>

$$\frac{1}{s+a}$$
    
</td><td>C.</td><td>
    
$$u_0(t)$$
    
</td></tr>
<tr><td>4.</td><td>
    
$$\frac{\omega}{(s + a)^2 + \omega^2}$$
    
</td><td>D.</td><td>
    
$$e^{-at}\cos\omega t$$
    
</td></tr>
<tr><td>5.</td><td>
    
$$\frac{s+a}{(s + a)^2 + \omega^2}$$
    
</td><td>E.</td><td>
    
$$e^{-at}\sin\omega t$$
    
</td></tr>
<tr><td>6.</td><td>
    
$$s$$
    
</td><td>F.</td><td>
    
$$\delta(t)$$
    
</td></tr>
</table>

+++ {"slideshow": {"slide_type": "subslide"}}

### Question 3: Fill in the blanks

Complete this sentence:
The [----] of a rational polynomial are the zeros of the numerator. The [----] of a rational polynomial are the zeros of the [-----].

+++ {"slideshow": {"slide_type": "subslide"}}

### Question 4: Knowledge check

Is there anything in this quiz that you think we should go over in more detail in class?

Write your answers in the chat or add to the **💬❓Questions and Discussion on the Laplace Transformation and its Applications** board in Canvas after class.

+++ {"slideshow": {"slide_type": "slide"}}

## The case of the distinct poles

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 1

Use the PFE method to simplify $F_1(s)$ below and find the time domain function $f_1(t)$ corresponding to $F_1(s)$

$$F_1(s) = \frac{2s+5}{s^2 + 5s + 6}$$

Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%7B(2s+%2B+5)%2F(s%5E2+%2B+5s+%2B+6)%7D)

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">


















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

#### Matlab Solution - Numerical

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
format compact
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
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

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
---
syms s t;
Fs = (2*s + 5)/(s^2 + 5*s + 6);
ft = ilaplace(Fs);
pretty(ft)
```

+++ {"slideshow": {"slide_type": "slide"}}

### Example 2

Determine the Inverse Laplace Transform of

$$F_2(s) = \frac{3s^2+2s+5}{s^3 + 9s^2 + 23s + 15}$$

Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%283s%5E2+%2B+2s+%2B+5%29%2F%28s%5E3+%2B+9s%5E2+%2B+23s+%2B+15%29)

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution 2

+++ {"slideshow": {"slide_type": "fragment"}}

Because the denominator of $F_2(s)$ is a cubic, it will be difficult to factorise without computer assistance so we use MATLAB to factorise $D(s)$

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
syms s;
factor(s^3 + 9*s^2 + 23*s + 15)
```

+++ {"slideshow": {"slide_type": "notes"}}

In an exam you'd be given the factors

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">


















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

We can now use the previous technique to find the solution which according to Matlab should be

$$f_1(t) = \frac{3}{4}e^{-t} - \frac{13}{2}e^{-3t} + \frac{35}{4}e^{-5t}$$

+++ {"slideshow": {"slide_type": "slide"}}

## The case of the complex poles

Quite often the poles of $F(s)$ are complex and because the complex poles occur as complex conjugate pairs, the number of complex poles is even. Thus if $p_k$ is a complex root of $D(s)$ then its complex conjugate $p_k^*$ is also a root of $D(s)$.

+++ {"slideshow": {"slide_type": "subslide"}}

You can still use the PFE with complex poles, as demonstrated in Pages 3-5&mdash;3-7 in the textbook. However it is easier to use the fact that complex poles will appear as quadratic factors of the form $s^2 + as + b$ and then call on the two transforms in the PFE


$$\frac{\omega}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\sin\;\omega t$$

$$\frac{s + a}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\cos\;\omega t$$

+++ {"slideshow": {"slide_type": "slide"}}

### Example 3

Rework Example 3-2 from the text book using quadratic factors.

Find the Inverse Laplace Transform of 

$$F_3(s) = \frac{s + 3}{(s+1)(s^2 + 4s + 8)}$$

Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s+%2B+1%29%28s%5E2+%2B+4s+%2B+8%29%29) &ndash; Shows that the computer is not always best!

+++ {"slideshow": {"slide_type": "subslide"}}

1. We complete the square in the denominator 

2. Then compare with the desired form $(s - a)^2 + \omega^2$

3. Solve this by finding the PFE for the assumed solution: $$F_3(s) = \frac{r_1}{s+1} + \frac{r_2(s - a)}{(s - a)^2 + \omega^2} + \frac{a r_3}{(s - a)^2 + \omega^2}.  $$ expecting the solution $$f_3(t) = r_1 e^{-t} - r_2 e^{-at}\cos \omega t + r_3 e^{-at}\sin \omega t.$$

You can use trig. identities to simplify this further if you wish.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution 3

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">


















</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## The case of the repeated poles

When a rational polynomial has repeated poles 

$$F(s) = \frac{N(s)}{(s - p_1)^m(s - p_2)\cdots(s - p_{n-1})(s-p_0)}$$

and the PFE will have the form:

$$
    \begin{array}{c}
F(s) = \frac{r_{11}}{(s - {p_1})^m} + \frac{r_{12}}{(s - {p_1})^{m - 1}} + \frac{r_{13}}{(s - {p_1})^{m - 2}} +  \cdots  + \frac{r_{1}}{(s - {p_1})}\\
 + \frac{r_2}{(s - {p_2})} + \frac{r_3}{(s - {p_3})} +  \cdots  + \frac{r_n}{(s - {p_n})}
\end{array}
$$

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

and the derivative of a quotient rule

$$\frac{d}{ds}\left(\frac{N(s)}{D(s)}\right) = \frac{D(s)\frac{dN(s)}{ds} - N(s)\frac{dD(s)}{ds}}{D(s)^2}$$

will be useful.

Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s%2B2%29%28s+%2B+1%29%5E2%29)

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution 4

We will leave the solution that makes use of the residude of repeated poles formula for you to study from the text book. In class we will illustrate the slightly simpler approach also presented in the text. 

For exam preparation, I would recommend that you use whatever method you find most comfortable.

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">


















</pre>

+++ {"slideshow": {"slide_type": "slide"}}

## The case of the improper rational polynomial

If $F(s)$ is an improper rational polynomial, that is $m \ge n$, we must first divide the numerator $N(s)$ by the denomonator $D(s)$ to derive an expression of the form

$$F(s) = k_0 + k_1s + k_2s^2 + \cdots + k_{m-n}s^{m-n} + \frac{N(s)}{D(s)}$$

and then $N(s)/D(s)$ will be a proper rational polynomial.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 5

$$
    F_6(s)= \frac{s^2 + 2s + 2}{s+1}
$$

Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%5E2+%2B+2s+%2B+2%29%2F%28s+%2B+1%29)

+++ {"slideshow": {"slide_type": "subslide"}}

Dividing $s^2 + 2s + 2$ by $s + 1$ gives

$$F_6(s) = s + 1 + \frac{1}{s+1}$$

+++ {"slideshow": {"slide_type": "subslide"}}

$$f_6(t) = e^{-t}+\delta(t)+\delta'(t)$$

See [notes for proof](inverse_laplace).

+++ {"slideshow": {"slide_type": "subslide"}}

#### Matlab verification for solition 5

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
Ns = [1, 2, 2]; Ds = [1 1];
[r, p, k] = residue(Ns, Ds)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
syms s;
F6 = (s^2 + 2*s + 2)/(s + 1);
f6 = ilaplace(F6)
```

+++ {"slideshow": {"slide_type": "slide"}}

## Matlab Solutions

For convenience, single script MATLAB solutions to the examples are provided and can be downloaded from the accompanying [MATLAB](https://github.com/cpjobling/eg-247-textbook/tree/master/laplace_transform/matlab) folder.

* Example 1 - Real poles [[ex3_1.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_1.m)]
* Example 2 - Real poles cubic denominator [[ex3_2.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_2.m)]
* Example 3 - Complex poles [[ex3_3.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_3.m)]
* Example 4 - Repeated real poles [[ex3_4.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_4.m)]
* Example 5 - Non proper rational polynomial [[ex3_5.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/ex3_5.m)]

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
cd ../matlab
ls
open ex3_1
ex3_1
```
