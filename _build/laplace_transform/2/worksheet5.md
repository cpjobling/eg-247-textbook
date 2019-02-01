---
redirect_from:
  - "/laplace-transform/2/worksheet5"
interact_link: content/laplace_transform/2/worksheet5.ipynb
title: 'Worksheet 5'
prev_page:
  url: /laplace_transform/1/worksheet4
  title: 'Worksheet 4'
next_page:
  url: /labs/index
  title: 'Laboratory Exercises'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 5

## To accompany Chapter 3.2 Inverse Laplace Transform

We will step through this worksheet in class. 

You are expected to have at least watched the video presentation of [Chapter 3.2](https://cpjobling.github.io/eg-247-textbook/laplace_transform/2/inverse_laplace) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

## The case of the distinct poles

### Example 1

Use the PFE method to simplify $F_1(s)$ below and find the time domain function $f_1(t)$ corresponding to $F_1(s)$

$$F_1(s) = \frac{2s+5}{s^2 + 5s + 6}$$

(Quick solution: [Wolfram Alpha](https://www.wolframalpha.com/input/?i=inverse+laplace+transform+%7B(2s+%2B+5)%2F(s%5E2+%2B+5s+%2B+6)%7D)

<pre style="border: 2px solid blue">


















</pre>

### Matlab Solution - Numerical



{:.input_area}
```matlab
format compact
clear all
```




{:.input_area}
```matlab
Ns = [2, 5]; Ds = [1, 5, 6];
[r,p,k] = residue(Ns, Ds)
```


Interpreted as:

$$F_1(s) = \frac{1}{s + 3} + \frac{1}{s + 2}$$

which because of the linearity property of the Laplace Transform and using tables results in the *Inverse Laplace Transform*

$$f_1(t) = e^{-3t} + e^{-2t}$$

#### Matlab solution - symbolic



{:.input_area}
```matlab
syms s t;
Fs = (2*s + 5)/(s^2 + 5*s + 6);
ft = ilaplace(Fs);
pretty(ft)
```


### Example 2

Determine the Inverse Laplace Transform of

$$F_2(s) = \frac{3s^2+2s+5}{s^3 + 9s^2 + 23s + 15}$$

(Quick solution: [Wolfram Alpha](http://www.wolframalpha.com/input/?i=inverse+laplace+transform+%283s%5E2+%2B+2s+%2B+5%29%2F%28s%5E3+%2B+9s%5E2+%2B+23s+%2B+15%29))

#### Solution 2

Because the denominator of $F_2(s)$ is a cubic, it will be difficult to factorise without computer assistance so we use MATLAB to factorise $D(s)$



{:.input_area}
```matlab
syms s;
factor(s^3 + 9*s^2 + 23*s + 15)
```


In an exam you'd be given the factors

<pre style="border: 2px solid blue">


















</pre>

We can now use the previous technique to find the solution which according to Matlab should be

$$f_1(t) = \frac{3}{4}e^{-t} - \frac{13}{2}e^{-3t} + \frac{35}{4}e^{-5t}$$

## The case of the complex poles

Quite often the poles of $F(s)$ are complex and because the complex poles occur as complex conjugate pairs, the number of complex poles is even. Thus if $p_k$ is a complex root of $D(s)$ then its complex conjugate $p_k^*$ is also a root of $D(s)$.

You can still use the PFE with complex poles, as demonstrated in Pages 3-5&mdash;3-7 in the textbook. However it is easier to use the fact that complex poles will appear as quadratic factors of the form $s^2 + as + b$ and then call on the two transforms in the PFE


$$\frac{\omega}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\sin\;\omega t$$

$$\frac{s + a}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\cos\;\omega t$$

### Example 3

Rework Example 3-2 from the text book using quadratic factors.

Find the Inverse Laplace Transform of 

$$F_3(s) = \frac{s + 3}{(s+1)(s^2 + 4s + 8)}$$

(Quick solution: [Wolfram Alpha](http://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s+%2B+1%29%28s%5E2+%2B+4s+%2B+8%29%29) &ndash; Shows that the computer is not always best!)

1. We complete the square in the denominator 

2. Then compare with the desired form $(s - a)^2 + \omega^2$

3. Solve thisby finding the PFE for the assumed solution: $$F_3(s) = \frac{r_1}{s+1} + \frac{r_2(s+a)}{(s + a)^2 + \omega^2} \frac{a r_3}{(s - a)^2 + \omega^2}.  $$ expecting the solution $$f_3(t) = r_1 e^{-t} - r_2 e^{-at}\cos \omega t + r_3 e^{-at}\sin \omega t.$$

You can use trig. identities to simplify this further if you wish.

#### Solution 3

<pre style="border: 2px solid blue">


















</pre>

## The case of the repeated poles

When a rational polynomial has repeated poles 

$$F(s) = \frac{N(s)}{(s - p_1)^m(s - p_2)\cdots(s - p_{n-1})(s-p_0)}$$

and the PFE will have the form:

$$\begin{array}{c}
F(s) = \frac{r_{11}}{(s - {p_1})^m} + \frac{r_{12}}{(s - {p_1})^{m - 1}} + \frac{r_{13}}{(s - {p_1})^{m - 2}} +  \cdots  + \frac{r_{1}}{(s - {p_1})}\\
 + \frac{r_2}{(s - {p_2})} + \frac{r_3}{(s - {p_3})} +  \cdots  + \frac{r_n}{(s - {p_n})}
\end{array}$$

The ordinary residues $r_k$ can be found using the rule used for distinct roots.

To find the residuals for the repeated term $r_{1k}$ we need to multiply both sides of the expression by $(s+p_1)^m$ and take repeated derivatives as described in detail in Pages 3-7&mdash;3-9 of the text book. This yields the general formula

$$r_{1k}=\lim_{s\to p_1}\frac{1}{(k-1)!}\frac{d^{k-1}}{ds^{k-1}}\left[(s-p_1)^mF(s)\right]$$

which in the age of computers is rarely needed.

### Example 4

Find the inverse Laplace Transform of 

$$F_4(s) = \frac{s+3}{(s+2)(s+1)^2}$$

Note that the transform

$$te^{at} \Leftrightarrow \frac{1}{(s - a)^2}$$

will be useful.

(Quick solution: [Wolfram Alpha](http://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s%2B2%29%28s+%2B+1%29%5E2%29))

#### Solution

We will leave the solution that makes use of the residude of repeated poles formula for you to study from the text book. In class we will illustrate the slightly simpler approach also presented in the text. 

For exam preparation, I would recommend that you use whatever method you find most comfortable.

<pre style="border: 2px solid blue">


















</pre>

## The case of the improper rational polynomial

If $F(s)$ is an improper rational polynomial, that is $m \ge n$, we must first divide the numerator $N(s)$ by the denomonator $D(s)$ to derive an expression of the form

$$F(s) = k_0 + k_1s + k_2s^2 + \cdots + k_{m-n}s^{m-n} + \frac{N(s)}{D(s)}$$

and then $N(s)/D(s)$ will be a proper rational polynomial.

### Example 5

$$F_6(s)= \frac{s^2 + 2s + 2}{s+1}$$

(Quick solution: [Wolfram Alpha](http://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%5E2+%2B+2s+%2B+2%29%2F%28s+%2B+1%29))

Dividing $s^2 + 2s + 2$ by $s + 1$ gives

$$F_6(s) = s + 1 + \frac{1}{s+1}$$

$$f_6(t) = e^{-t}+\delta(t)+\delta'(t)$$

See [notes for proof](inverse_laplace)

#### Matlab verification



{:.input_area}
```matlab
Ns = [1, 2, 2]; Ds = [1 1];
[r, p, k] = residue(Ns, Ds)
```




{:.input_area}
```matlab
syms s;
F6 = (s^2 + 2*s + 2)/(s + 1);
f6 = ilaplace(F6)
```

