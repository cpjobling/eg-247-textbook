---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.15.2
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

(tf_concepts)=
# Unit 2.1 Laplace transforms and LTI systems

+++ {"slideshow": {"slide_type": "subslide"}}

## Learning Outcomes

In this unit, students will...

* Compute Laplace transforms by hand and using symbolic math.
* Describe the properties of the Laplace transform.
* Apply Laplace transforms to solve initial value problems.
* Recall the definition of a linear time-invariant (LTI) operator.

+++ {"slideshow": {"slide_type": "notes"}}

:::{note}
This unit is based on the MATLAB LiveScript `ConceptReview.mlx` from the curriculum module [Transfer Function Analysis of Dynamic Systems](https://github.com/MathWorks-Teaching-Resources/Transfer-Function-Analysis-of-Dynamic-Systems). 

Some of the examples rely on interactive features of MATLAB that are not readily reproduced in these notes. To make use of these facilities, you are advised to access the script directly from the project in MATLAB online.

These materials © Copyright 2023 The MathWorks™, Inc. (See {ref}`mathworks_license`).
:::

```{code-cell}
---
slideshow:
  slide_type: notes
---
%% Lecturer: set up the TransferFunctions project for in class execution of exercise tests and activities.

% Setup MATLAB to use the ConceptReview.mlx LiveScript in class.
% I am assuming that this is on the MATLAB Drive

format compact 
% Change this to local set up where this Jupyter book is run
cd '/Users/eechris/MATLAB-Drive/Repositories/Transfer-Function-Analysis-of-Dynamic-Systems'
open('TransferFunctions.prj')
```

+++ {"slideshow": {"slide_type": "slide"}}

## Introduction

Transfer functions are derived by computing the **Laplace transform** of **linear time-invariant (LTI)** dynamic systems. In these notes, the basics of Laplace transforms and LTI systems are reviewed.

+++ {"slideshow": {"slide_type": "slide"}}

(laplace_xform)=
## The Laplace Transform

+++ {"slideshow": {"slide_type": "fragment"}}

### Definition

The Laplace transform of a locally integrable function $f$  is 

$$F(s) = \mathcal{L}\{f(t)\} =\int_{0}^{\infty} f(t) e^{-st} \ dt$$

+++ {"slideshow": {"slide_type": "fragment"}}

The corresponding inverse Laplace transform is denoted as

$$f(t) = \mathcal{L}^{-1} \{ F(s) \}$$

+++ {"slideshow": {"slide_type": "notes"}}

Inverse Laplace transforms (and forward Laplace transforms, for that matter) are usually found by appealing to a transform table. The formal definition of the inverse Laplace transform is rarely used and so is not discussed here.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Example 1

![example](images/write.png)

+++ {"slideshow": {"slide_type": "fragment"}}

(a)  Compute the Laplace transform of $f(t) = u_0(t - a)$ by hand, where $u_o(t)$ is the Heaviside step function with $a > 0$.

+++ {"slideshow": {"slide_type": "fragment"}}

(b) Compute the analytic Laplace transform of $f$ using the [Symbolic Math Toolbox](https://www.mathworks.com/products/symbolic.html).

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution

(a)

+++ {"slideshow": {"slide_type": "fragment"}}

$$\begin{array}{rl}
F(s) &= \int_{0}^{\infty}  u_0(t-a) e^{-st} \ dt \\
 &= \int_{a}^{\infty}  e^{-st} \ dt \\
&= \left. -\frac{1}{s} e^{-st} \ \right\vert_a^\infty \\
&= \frac{1}{s} e^{-as} \\
\end{array}$$

+++ {"slideshow": {"slide_type": "subslide"}}

(b) The [laplace](https://www.mathworks.com/help/symbolic/laplace.html) function computes the analytic transform of a symbolic expression $f$. You can use the syntax:
```matlab
Fs = laplace(f,var,transformVar)
```

+++ {"slideshow": {"slide_type": "subslide"}}

1. Start by declaring symbolic variables

```{code-cell}
---
slideshow:
  slide_type: fragment
---
format compact % use less white space in outputs
syms t s
syms a positive
```

+++ {"slideshow": {"slide_type": "fragment"}}

2. Then, define the function $f$. You can find a list of mathematical functions present in the Symbolic Math Toolbox in [the documentation](https://www.mathworks.com).

```{code-cell}
---
slideshow:
  slide_type: fragment
---
f = heaviside(t - a)
```

+++ {"slideshow": {"slide_type": "subslide"}}

3. Finally, compute the Laplace transform with the input variable `t` and transform variable `s`.

```{code-cell}
Fs = laplace(f, t, s)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Exercise 1

![example](images/write.png) 

1. Compute the Laplace transform of some standard functions listed below on paper[^examples]. Assume $a$ is real and $a > 0$

**a.** $f(t) = 1$ **b.** $f(t) = e^{-at}$ **c.** $f(t) = t$ **d.** $f(t) = \delta(t - a)$ 

**e.** $f(t) = \cos(t)$ **f.** $f(t) = t^2 e^{-at}$ **g.** $f(t) = e^{-at}\sin(t)$

+++ {"slideshow": {"slide_type": "notes"}}

**Hints: a/b.** substitution, **c.** integration by parts, **d.** [dirac](https://www.mathworks.com/help/symbolic/sym.dirac.html) for the symbolic computation), **e/g** integrate by parts and rearrange terms, **f.** multiple integration by parts.

+++ {"slideshow": {"slide_type": "subslide"}}

2. Verify your answers by computing the Laplace transforms in the space provided below using symbolic math.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
% Symbolic variable declarations
syms t s
syms a positive
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution 1 (a).

```{code-cell}
---
slideshow:
  slide_type: fragment
---
f = 1
Fs = laplace(f,t,s)
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution 1 (b).

```{code-cell}
---
slideshow:
  slide_type: fragment
---
f = exp(-a*t)
Fs = laplace(exp(-a*t))
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution 1 (c).

```{code-cell}
---
slideshow:
  slide_type: fragment
---
f = t
Fs = laplace(f, t, s)
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution 1 (d).

```{code-cell}
---
slideshow:
  slide_type: fragment
---
f = dirac(t - a)
Fs = laplace(f, t, s)
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution 1 (e).

```{code-cell}
---
slideshow:
  slide_type: fragment
---
f = cos(t)
Fs = laplace(f, t, s)
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution 1 (f).

```{code-cell}
---
slideshow:
  slide_type: fragment
---
f = t^2 * exp(-a*t)
Fs = laplace(f, t, s)
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution 1 (g).

```{code-cell}
---
slideshow:
  slide_type: fragment
---
f = exp(-a*t) * sin(t)
Fs = laplace(f, t, s)
```

+++ {"slideshow": {"slide_type": "slide"}}

### Visualize Laplace transforms

![Try](images/try.png) 

See the MATLAB LiveScript `ConceptReview.mlx`.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
open('ConceptReview.mlx')
```

+++ {"slideshow": {"slide_type": "notes"}}

#### Reflect

![reflect](images/reflect.png)

* What class of functions is most commonly observed in the Laplace transform?
* How do the poles of the Laplace transform reflect the behavior of the time domain function $f(t)$?

+++ {"slideshow": {"slide_type": "notes"}}

Laplace transforms and their inverses are also commonly found using a table, like [this one](https://en.wikipedia.org/wiki/List_of_Laplace_transforms#Table).

See also {ref}`lxf_table` in this textbook.

+++ {"slideshow": {"slide_type": "slide"}}

(ltp)=
### Laplace transform properties

Laplace transforms have several important properties that can be derived from the definition. A few essential properties are reviewed below.

+++ {"slideshow": {"slide_type": "subslide"}}

$$\left.
\begin{array}{lll}
\textbf{Name} & \mathbf{f(t)} & \mathbf{F(s)}
\\
\text{Time derivative} \quad& \dot{f}(t) \quad & sF(s) - f(0)
\\
\text{Time integral} \quad& \int_0^t f(\tau) d\tau \quad & \frac{F(s)}{s}
\\
\text{Frequency shift} \quad& e^{at} f(t) \quad & F(s-a)
\\
\text{Time shift} \quad& f(t-a)u_0(t-a) \quad & e^{-as} F(s)
\\
\text{Time scaling} \quad& f(at) \quad & \frac{1}{a}F\left( \frac{s}{a}\right)
\\
\text{Time domain convolution} \quad &  (f*g)(t) & F(s) G(s)
\end{array}
\right.
$$

+++ {"slideshow": {"slide_type": "notes"}}

A more complete list of Laplace transform properties is to be found in {ref}`lxf_props` in this textbook.

+++ {"slideshow": {"slide_type": "subslide"}}

For example, the Laplace transform of a time derivative can be computed through integration by parts:

+++ {"slideshow": {"slide_type": "subslide"}}

$$
\begin{array}{rl}
\mathcal{L}\{f'(t)\} &= \int_{0}^{\infty} \dot{f}(t) e^{-st} \ dt
\\
&= \left. f(t) e^{-st} \ \right\vert_0^\infty - \int_{0}^{\infty}  f(t) \left( -s  e^{-st}\right) \ dt
\\
&= - f(0) + sF(s)
\end{array}
$$

+++ {"slideshow": {"slide_type": "subslide"}}

#### Try this

![try](images/try.png)

The symbolic derivative of $f$ is defined below by declaring a symbolic function using the syntax

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms f(t)
```

+++ {"slideshow": {"slide_type": "subslide"}}

The derivative is then computed using the [diff](https://uk.mathworks.com/help/matlab/ref/diff.html) function.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms t f(t)
dfdt = diff(f)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Use the [laplace](https://uk.mathworks.com/help/symbolic/sym.laplace.html) function to compute the Laplace transform of `dfdt` in the space below.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Fs = laplace(dfdt)
```

+++ {"slideshow": {"slide_type": "subslide"}}

#### Exercise 2

![exercise](images/write.png)

##### 2 (a).

Find the formula for the Laplace transform of the second time derivative $\ddot{f}(t)$ by hand[^examples].

+++ {"slideshow": {"slide_type": "subslide"}}

##### 2(b).

Verify your answer by computing the Laplace transform using symbolic math.

+++ {"slideshow": {"slide_type": "notes"}}

##### Pro-tip:

![pro-tip](images/pro-tip.png)

To compute the second derivative, use the [diff](https://uk.mathworks.com/help/matlab/ref/diff.html) function with the syntax: `diff(f,n)`, where `n` is the order of the derivative.

+++ {"slideshow": {"slide_type": "subslide"}}

##### Solution 2(b)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms t f(t) % Definitions of the symbolic variables
% Perform your symbolic computations here
d2fdt2 = diff(f,2)
```

```{code-cell}
---
slideshow:
  slide_type: fragment
---
Fs = laplace(d2fdt2)
```

+++ {"slideshow": {"slide_type": "slide"}}

### Visualize Laplace transform properties

![try](images/try.png)

See the MATLAB LiveScript `ConceptReview.mlx`

+++ {"slideshow": {"slide_type": "slide"}}

### Solving differential equations using the Laplace transform

You can solve initial value problems analytically using Laplace transforms. In general, this is accomplished by: 

1. taking the Laplace transform, 
2. solving for the solution variable in the Laplace domain ($X(s)$), and
3. taking the inverse Laplace transform by referring to a Laplace transform table.

+++ {"slideshow": {"slide_type": "subslide"}}

#### Example 3

![example](images/write.png) 

Use the Laplace transform to solve for the dynamics of the mass-spring-damper with 
* constant forcing $F = 10$ N
* physical parameters: $m = 1$ kg, $c = 2$ Ns/m, and $k = 10$ N/m
* zero initial conditions: $x(0) = 0$ and $x'(0) = 0$

+++ {"slideshow": {"slide_type": "subslide"}}

![A spring mass-damper-system](images/smd.png)

+++ {"slideshow": {"slide_type": "subslide"}}

#### Solution

##### 1. Derive the equations of motion.

You can draw a free body diagram and apply Newton's second law to derive the equations of motion.

+++ {"slideshow": {"slide_type": "subslide"}}

![Free Body Diagram of Spring-Mass-Damper signal](images/fbd.png)

+++ {"slideshow": {"slide_type": "subslide"}}

##### 2. Compute the Laplace transform of the dynamic system ODE and solve for $X$

Note $\mathcal{L}\{x(t)\} = X(s)$

+++ {"slideshow": {"slide_type": "fragment"}}

$$\mathcal{L} \left\{ m \ddot{x} + c\dot{x} + kx = F \right\} \rightarrow$$

$$m[s^2 X - sx(0) - x'(0)] + c [s X - x(0)] + kX = \frac{F}{s}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Applying the zero initial conditions and the values of the physical parameters implies

$$s^2 X + 2 s X  + 10X = \frac{10}{s}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Solving for  yields

$$X = \frac{10}{s^3 + 2  s^2   + 10s }$$

+++ {"slideshow": {"slide_type": "subslide"}}

##### 3. Use partial fraction decomposition to separate the expression for  into terms where the inverse Laplace transform $X$ is known

Try performing the partial fraction decomposition on paper and comparing your result to the symbolic solution found below.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
% Define X(s)
syms s 
X = 10/(s^3 + 2*s^2 + 10*s)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
% Compute the partial fraction decomposition
Xdecomp = partfrac(X,s)
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### 4. Take the inverse Laplace transform

You can take the inverse Laplace transform by rewriting  as a sum of terms in forms found on a [transform table](https://en.wikipedia.org/wiki/List_of_Laplace_transforms#Table).

+++ {"slideshow": {"slide_type": "fragment"}}

$$X(s) = \frac{1}{s}-\frac{s+2}{s^2 +2 \ s+10} =  \frac{1}{s}-\frac{s+2}{(s + 1)^2 + 9}  =  \frac{1}{s}-\frac{s+1}{(s + 1)^2 + 3^2}  -\frac{1}{3}\frac{3}{(s + 1)^2 + 3^2}$$

+++ {"slideshow": {"slide_type": "subslide"}}

The solution is then constructed by taking the inverse transform:

$$
\begin{array}{rl}
x(t) &= \mathcal{L}^{-1} \left\{ \frac{1}{s}-\frac{s+1}{(s + 1)^2 + 3^2}  -\frac{1}{3}\frac{3}{(s + 1)^2 + 3^2} \right\}
\\
  &= u_0(t) - u_0(t) e^{-t} \cos( 3 t) - \frac{1}{3} u_0(t) e^{-t} \sin(3t)
\\
  &= \left( 1  - e^{-t} \cos( 3 t) - \frac{1}{3} e^{-t} \sin(3t)\right)u_0(t)
\end{array}
$$

+++ {"slideshow": {"slide_type": "subslide"}}

Alternatively, you can use the symbolic function [ilaplace](https://uk.mathworks.com/help/symbolic/sym.ilaplace.html) to find the inverse Laplace transform of $X(s)$.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms x
x = ilaplace(X)
```

+++ {"slideshow": {"slide_type": "subslide"}}

##### 5. Plot the solution

```{code-cell}
---
slideshow:
  slide_type: fragment
---
% Create solution array
t = linspace(0,5,150);
x = 1-exp(-t).*(cos(3*t) + 1/3*sin(3*t));
plot(t, x)
```

+++ {"slideshow": {"slide_type": "subslide"}}

There is an animated version of the solution to this spring-mass-damper system in the MATLAB LiveScript `ConceptReview.mlx`.

```{code-cell}
---
slideshow:
  slide_type: fragment
---
open('ConceptReview.mlx')
```

+++ {"slideshow": {"slide_type": "slide"}}

#### Exercise 4

![exercise](images/write.png)

In this exercise, you will solve for the dynamics of the simple pendulum using the Laplace transform.

![A simple pendulum](images/pendulum.png)

+++ {"slideshow": {"slide_type": "subslide"}}

##### 4(a) 

Draw a free-body diagram for the simple pendulum shown above and derive the equation of motion for a pendulum with length $l = 0.5$ m and a gravitational constant of 9.8 m/s. Linearize the equation near $\theta = 0$ and show that it is equivalent to

$$\ddot \theta + 19.6 \theta = 0$$

+++ {"slideshow": {"slide_type": "subslide"}}

##### 4(b)

Use the Laplace transform to solve the linearized equations of motion:

$$\ddot \theta + 19.6 \theta = 0$$
      
with initial conditions $\theta(0) = \pi/6$, $\dot{\theta}(0) = 0$.


Write your solution in the variable `theta` in terms of the symbolic variable `t`. Then click the checkbox to plot your solution.

```{code-cell}
---
slideshow:
  slide_type: subslide
---
syms t s
% Replace NaN with your symbolic solution and run the section
Theta = (pi/6)*s/(s^2 + 19.6);
theta = ilaplace(Theta)
```

+++ {"slideshow": {"slide_type": "subslide"}}

There is an animated version of the solution to this simple pendulum system in the MATLAB LiveScript `ConceptReview.mlx`. Open the LiveScript file and paste your solution into the appropriate place to see the animation. 

```{code-cell}
---
slideshow:
  slide_type: fragment
---
open('ConceptReview.mlx')
```

+++ {"slideshow": {"slide_type": "slide"}}

## Linear Time-invariant Systems

Linear time-invariant (LTI) systems are characterized by the two properties stated in the name: linearity and time-invariance.

![Block diagram of a system](images/system.png)

Consider an operator $g$ that maps an input $u(t)$ to an output $y(t)$.

+++ {"slideshow": {"slide_type": "subslide"}}

### 1. Linearity
The operator $g$ is linear if it has two properties:
* Superposition: $g[u_1(t) + u_2(t)]$ = $y_1(t)$ + $y_2(t)$
* Homogeneity: $g[au(t)] = ay(t)$

Often these two properties are written together as

$$g[a u_1(t) + bu_2(t)] = ay_1(t) + by_2(t)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### 2. Time invariance

The operator $g$ is time-invariant if a time-shifted input produces an output with the same time shift:

$$g[u(t - \tau)]= y(t - \tau)$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Exercise 5. 

![reflect](images/reflect.png)

Consider the simple operators listed below. Which operators are linear? Which are time-invariant? 

Use the interactive tool in the MATLAB LiveScript `ConceptReview.mlx` to explore these and reflect on the results.

* $g$: $y(t) = g[u(t)]$ with $g = \frac{d}{dt}  + \frac{d^2}{dt^2}$
* $h$: $y(t) = 4\sin^2[u(t)]$
* $i$: $y(t) = \int_{t - 1}^{t + 1} 3u(\tau) d\tau$
* $j$: $y(t) = t \frac{d}{dt} u(t)$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
open('ConceptReview.mlx')
```

+++ {"slideshow": {"slide_type": "slide"}}

(homework1)=
## Homework 1: Laplace Transform and LTI Systems

1. Register with the MathWorks (if you haven't already) using your Swansea University email and install your own copy of the curriculum module [Transfer Function Analysis of Dynamic Systems](https://github.com/MathWorks-Teaching-Resources/Transfer-Function-Analysis-of-Dynamic-Systems) into the online MATLAB version[^installation].
2. Open the `ConceptsReview.mlx` activity.
3. Complete the Exercises and Activities and add your own notes to the LiveScript file in response to the Reflection prompts given above.

+++ {"slideshow": {"slide_type": "notes"}}

## Solutions to Selected Exercises

### Solution to Exercise 1

We have made use of the resource [Laplace Transforms](https://www.lboro.ac.uk/departments/mlsc/student-resources/helm-workbooks/) from the [HELM project](https://www.lboro.ac.uk/media/media/schoolanddepartments/mlsc/downloads/HELM%20Workbook%2020%20Laplace%20Transforms.pdf) {cite}`HELM,HELM-Laplace` hosted at Loughborough University. We have made the [HELM resource available in the Canvas site](https://canvas.swansea.ac.uk/courses/44853/modules/items/2565502) for this module. 

Compute the Laplace transform of some standard functions listed below:

**a.** $f(t) = 1$


$$
\begin{align}
F(s) &= \mathcal{L}\left\{f(t)\right\} = \int_0^\infty 1.e^{-st}\,dt\\
     &= -\frac{1}{s}\left. e^{-st}\right|_0^\infty\\
     &= -\frac{1}{s}\left[ e^{-s\infty} - e^{s.0}\right]\\
     &= -\frac{1}{s}\left[0 - 1\right]\\
     &= \frac{1}{s}
\end{align}
$$

```{note}
We have given all the steps here: in the remaining exercises we will omit some of the details but the results would be much the same. We will also demonstrate pragmatism by using the provided Laplace transform properties and transform tables ({ref}`lxf_props`, {ref}`lxf_table`) when they simplify the analysis. This is generally the approach you should take too.
```

**b.** $f(t) = e^{-at}$ 

$$
\begin{align}
F(s) &= \int_0^\infty e^{-at}.e^{-st}\,dt\\
     &= \int_0^\infty e^{-(a + s)t}\,dt\\
     &= -\frac{1}{a + s}\left. e^{-(a + s)t}\right|_0^\infty\\
     &= \frac{1}{s + a}
\end{align}
$$

**c.** $f(t) = t$ 

$$
F(s) \int_0^\infty t.e^{-st}\,dt
$$
Using integration by parts

$$
\begin{align}
\mathcal{L}\left\{t\right\} & = \left[\frac{t.e^{-st}}{-s}\right]_0^\infty - \int_0^\infty \left(\frac{e^{-st}}{-s}\right)\,dt\\
     &= \left[\frac{t.e^{-st}}{-s}\right]_0^\infty - \left[\frac{e^{-st}}{-s^2}\right]_0^\infty
\end{align}
$$

Now we have the difficulty of substituting in the limits of integration. The only problem arises with the upper limit ($t = \infty$). We shall always assume that the parameter $s$ is so chosen that no contribution ever arises from the upper limit ($t = \infty$). In this particular case we need only demand that $s$ is real and positive. Using this 'rule of thumb':

$$
\begin{align}
\mathcal{L}\left\{t\right\} & = \left[0 - 0\right] - \left[0 - \left(\frac{1}{-s^2}\right)\right]\\
     &= \frac{1}{s^2}
\end{align}
$$

**d.** $f(t) = \delta(t - a)$ 

The solution uses the sampling property $f(t)\delta(t-a) = f(a)\delta(t-a)$ and the sifting property 

$$
\int_0^\infty f(t)\delta(t - a)\,dt = f(a). See 
$$

(see [Important Properties of the Delta Function](https://cpjobling.github.io/eg-150-textbook/signals_and_systems/elementary_signals/index.html#important-properties-of-the-delta-function) in {cite}`jobling-eg-150`).

$$
\begin{align}
F(s) &= \int_0^\infty e^{-st}\delta(t-a)\,dt\\
     &= e^{-as}
\end{align}
$$

**e.** $f(t) = \cos(t)$ 

Using the identity

$$\cos(t) = \frac{e^{j t} + e^{-jt}}{2}$$

and applying the result of (b)

$$
\begin{align}
\mathcal{L}\left\{\cos(t)\right\} &= \frac{1}{2}\left(\mathcal{L}\left\{e^{j t}\right\} + \mathcal{L}\left\{e^{-j t}\right\}\right) \\
   &= \frac{1}{2}\left(\frac{1}{s + j} + \frac{1}{s - j}\right) \\
   &= \frac{1}{2}\left(\frac{s - j + s + j}{(s + j)(s - j)}\right) \\
   &= \frac{1}{2}\left(\frac{2s}{s^2 + 1}\right) \\
   &= \frac{s}{s^2 + 1}
\end{align}
$$

**f.** $f(t) = t^2 e^{-at}$ 

From transform tables (e.g. {ref}`lxf_table`)

$$
\begin{align}
  \mathcal{L}\left\{t^n\right\} &= \frac{n!}{s^{n+1}} \\
  \mathcal{L}\left\{t^2\right\} &= \frac{2!}{s^{2+1}} \\
  & = \frac{1\times 2}{s^3} \\
  & = \frac{2}{s^3}
\end{align}
$$

From the frequency shift property (see {ref}`ltp`)

$$\mathcal{L}\left\{e^{-at}\right\} = F(s + a)$$

so 

$$
\mathcal{L}\left\{e^{-at} t^2\right\} = \frac{2}{\left(s + a\right)^3}
$$

**g.** $f(t) = e^{-at}\sin(t)$

To complete this from first principles you can use the approach we used to solve (e). If you want to do this you should note that 

$$\sin(t) = \frac{1}{j2}\left(e^{jt} - e^{-jt}\right).$$

It is easy to show that 

$$\mathcal{L}\left\{\sin(\omega t)\right\} = \frac{\omega}{s^2 + \omega^2}$$

An in this case $\omega = 1$ so

$$\mathcal{L}\left\{\sin(t)\right\} = \frac{1}{s^2 + 1}$$

By the frequency shift property (see previous solution)

$$
\begin{align}
  \mathcal{L}\left\{e^{-at} \sin(t)\right\} = \frac{1}{(s + a)^2 + 1}
\end{align}
$$

+++

## References for this Unit

```{bibliography}
:filter: docname in docnames
```

+++ {"slideshow": {"slide_type": "notes"}}

## Footnotes

[^examples]: We will tackle some of the paper-based exercises in the examples class.

[^installation]: Installation details are given in Canvas here: [Prepare the MATLAB Curriculum Module used in Unit 2 and Lab 2](https://canvas.swansea.ac.uk/courses/44853/pages/prepare-the-matlab-curriculum-module-used-in-unit-2-and-lab-2).

```{code-cell}

```
