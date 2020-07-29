---
jupytext:
  formats: md:myst,ipynb
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.9'
    jupytext_version: 1.5.2
kernelspec:
  display_name: Matlab
  language: matlab
  name: matlab
---

+++ {"slideshow": {"slide_type": "slide"}}

# Transfer Functions

+++ {"slideshow": {"slide_type": "notes"}}

The preparatory reading for this section is [Chapter 4.4](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?docID=3384197&ppg=75#ppg=113) {cite}`karris` which discusses transfer function models of electrical circuits.

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon


An annotatable worksheet for this presentation is available as [**Worksheet 7**](https://cpjobling.github.io/eg-247-textbook/laplace_transform/4/worksheet7.html).

* The source code for this page is [laplace_transform/4/transfer_functions.ipynb](https://github.com/cpjobling/eg-247-textbook/blob/master/laplace_transform/4/transfer_functions.ipynb).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/laplace_transform/4/transfer_functions.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/laplace_transform/4/transfer_functions.pdf) file.

+++ {"slideshow": {"slide_type": "slide"}}

## Agenda

+++ {"slideshow": {"slide_type": "fragment"}}

* Transfer Functions

+++ {"slideshow": {"slide_type": "fragment"}}

* A Couple of Examples

+++ {"slideshow": {"slide_type": "fragment"}}

* Circuit Analysis Using MATLAB LTI Transfer Function Block

+++ {"slideshow": {"slide_type": "fragment"}}

* Circuit Simulation Using Simulink Transfer Function Block

```{code-cell}
---
slideshow:
  slide_type: skip
---
% Matlab setup
cd ../matlab 
pwd
clear all
format compact
```

+++ {"slideshow": {"slide_type": "slide"}}

## Transfer Functions for Circuits

When doing circuit analysis with components defined in the complex frequency domain, the ratio of the output voltage $V_{\mathrm{out}}(s)$ to the input voltage $V_{\mathrm{in}}(s)$ *under zero initial conditions* is of great interest.

+++ {"slideshow": {"slide_type": "subslide"}}

This ratio is known as the *voltage transfer function* denoted $G_v(s)$:

+++ {"slideshow": {"slide_type": "fragment"}}

$$G_v(s) = \frac{V_{\mathrm{out}}(s)}{V_{\mathrm{in}}(s)}$$

+++ {"slideshow": {"slide_type": "subslide"}}

Similarly, the ratio of the output current $I_{\mathrm{out}}(s)$ to the input current $I_{\mathrm{in}}(s)$ *under zero initial conditions*, is called the *cuurent transfer function* denoted $G_i(s)$:

+++ {"slideshow": {"slide_type": "fragment"}}

$$G_i(s) = \frac{I_{\mathrm{out}}(s)}{I_{\mathrm{in}}(s)}$$

+++ {"slideshow": {"slide_type": "notes"}}

In practice, the current transfer function is rarely used, so we will use the voltage transfer function denoted:

$$G(s) = \frac{V_{\mathrm{out}}(s)}{V_{\mathrm{in}}(s)}$$

+++ {"slideshow": {"slide_type": "slide"}}

## Examples

See [Worksheet 7](worksheet7) for the worked solutions to the examples. We will work through these in class. Here I'll demonstrate the MATLAB solutions.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 6

Derive an expression for the transfer function $G(s)$ for the circuit below. In this circuit $R_g$ represents the internal resistance of the applied (voltage) source $v_s$, and $R_L$ represents the resistance of the load that consists of $R_L$, $L$ and $C$.

+++ {"slideshow": {"slide_type": "subslide"}}

<img title="Circuit for Example 6" src="pictures/example6.png" width="50%" />

+++ {"slideshow": {"slide_type": "subslide"}}

### Sketch of Solution

+++ {"slideshow": {"slide_type": "fragment"}}

* Replace $v_s(t)$, $R_g$, $R_L$, $L$ and $C$ by their transformed (*complex frequency*) equivalents: $V_s(s)$, $R_g$, $R_L$, $sL$ and $1/(sC)$

+++ {"slideshow": {"slide_type": "fragment"}}

* Use the *Voltage Divider Rule* to determine $V_\mathrm{out}(s)$ as a function of $V_s(s)$

+++ {"slideshow": {"slide_type": "subslide"}}

* Form $G(s)$ by writing down the ratio $V_\mathrm{out}(s)/V_s(s)$

+++ {"slideshow": {"slide_type": "notes"}}

### Worked solution.

Pencast: [ex6.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex6.pdf) - open in Adobe Acrobat Reader.

+++ {"slideshow": {"slide_type": "subslide"}}

### Answer

$$G(s) = \frac{V_\mathrm{out}(s)}{V_s(s)} = \frac{R_L + sL + 1/sC}{R_g + R_L + sL + 1/sC}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 7

Compute the transfer function for the op-amp circuit shown below in terms of the circuit constants $R_1$, $R_2$, $R_3$, $C_1$ and $C_2$.

+++ {"slideshow": {"slide_type": "subslide"}}

<img alt="Circuit for Example 7" src="pictures/example7.png" width="50%" />

+++ {"slideshow": {"slide_type": "subslide"}}

Then replace the complex variable $s$ with $j\omega$, and the circuit constants with their numerical values and plot the magnitude

$$\left|G(j\omega)\right| = \frac{\left|V_{\mathrm{out}}(j\omega)\right|}{\left|V_{\mathrm{in}}(j\omega)\right|}$$

versus radian frequency $\omega$ rad/s.

+++ {"slideshow": {"slide_type": "subslide"}}

### Sketch of Solution

+++ {"slideshow": {"slide_type": "fragment"}}

* Replace the components and voltages in the circuit diagram with their complex frequency equivalents

+++ {"slideshow": {"slide_type": "fragment"}}

* Use nodal analysis to determine the voltages at the nodes either side of the 50K resistor $R_3$

+++ {"slideshow": {"slide_type": "subslide"}}

* Note that the voltage at the input to the op-amp is a virtual ground

+++ {"slideshow": {"slide_type": "fragment"}}

* Solve for $V_{\mathrm{out}}(s)$ as a function of $V_{\mathrm{in}}(s)$

+++ {"slideshow": {"slide_type": "fragment"}}

* Form the reciprocal $G(s) = V_{\mathrm{out}}(s)/V_{\mathrm{in}}(s)$

+++ {"slideshow": {"slide_type": "subslide"}}

* Use MATLAB to calculate the component values, then replace $s$ by $j\omega$.

+++ {"slideshow": {"slide_type": "fragment"}}

* Plot

    $$\left|G(j\omega)\right|$$

  on log-linear "paper".

+++ {"slideshow": {"slide_type": "notes"}}

### Worked solution.

Pencast: [ex7.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex7.pdf) - open in Adobe Acrobat Reader.

+++ {"slideshow": {"slide_type": "subslide"}}

### Answer

$$G(s) = \frac{V_\mathrm{out}(s)}{V_\mathrm{in}(s)} = \frac{-1}{R_1\left(\left(1/R_1 + 1/R_2 + 1/R_3 + sC_1\right)\left(sC_2R_3\right)+1/R_2\right)}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### The Matlab Bit

See attached script: [solution7.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution7.m).

+++ {"slideshow": {"slide_type": "subslide"}}

#### Week 3: Solution 7

```{code-cell}
---
slideshow:
  slide_type: fragment
---
syms s;
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
R1 = 200*10^3; 
R2 = 40*10^3;
R3 = 50*10^3;

C1 = 25*10^(-9);
C2 = 10*10^(-9);
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
den = R1*((1/R1+ 1/R2 + 1/R3 + s*C1)*(s*R3*C2) + 1/R2);
simplify(den)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Simplify coefficients of s in denominator

```{code-cell}
---
slideshow:
  slide_type: subslide
---
format long
denG = sym2poly(ans)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
---
numG = -1;
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot

For convenience, define coefficients $a$ and $b$:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
a = denG(1);
b = denG(2);
```

+++ {"slideshow": {"slide_type": "subslide"}}

$$G(j\omega) = \frac{-1}{a\omega^2 - jb\omega + 5}$$

```{code-cell}
---
slideshow:
  slide_type: fragment
---
w = 1:10:10000;
Gs = -1./(a*w.^2 - j.*b.*w + denG(3));
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot

```{code-cell}
---
slideshow:
  slide_type: fragment
---
semilogx(w, abs(Gs))
xlabel('Radian frequency w (rad/s')
ylabel('|Vout/Vin|')
title('Magnitude Vout/Vin vs. Radian Frequency')
grid
```

+++ {"slideshow": {"slide_type": "slide"}}

## Using Transfer Functions in MATLAB for System Analysis

Please use the file [tf_matlab.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/tf_matlab.m) to explore the Transfer Function features provide by MATLAB. Open the file as a Live Script to see a nicely formatted document.

+++ {"slideshow": {"slide_type": "slide"}}

## Using Transfer Functions in Simulink for System Simulation

+++ {"slideshow": {"slide_type": "fragment"}}

![Using Transfer Functions in Simulink for System Simulation](pictures/sim_tf.png)

+++ {"slideshow": {"slide_type": "fragment"}}

The Simulink transfer function (**`Transfer Fcn`**) block implements a transfer function

+++ {"slideshow": {"slide_type": "subslide"}}

The transfer function block represents a general input output function

$$G(s) = \frac{N(s)}{D(s)}$$

and is not specific nor restricted to circuit analysis.

+++ {"slideshow": {"slide_type": "fragment"}}

It can, however be used in modelling and simulation studies.

+++ {"slideshow": {"slide_type": "slide"}}

### Example

Recast Example 7 as a MATLAB problem using the LTI Transfer Function block. 

For simplicity use parameters $R_1 = R_2 = R_3 = 1\; \Omega$, and $C_1 = C_2 = 1$ F.

Calculate the step response using the LTI functions.

+++ {"slideshow": {"slide_type": "subslide"}}

Verify the result with Simulink.

The Matlab solution: [example8.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example8.m)

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB Solution
From a previous analysis the transfer function is:

$$G(s) = \frac{V_\mathrm{out}}{V_\mathrm{in}} = \frac{-1}{R_1\left[(1/R_1 + 1/R_2 + 1/R_3 + sC_1)(sR_3C_2) + 1/R_2\right]}$$

+++ {"slideshow": {"slide_type": "subslide"}}

so substituting the component values we get:

$$G(s) = \frac{V_{\mathrm{out}}}{V_{\mathrm{in}}} = \frac{-1}{s^2 + 3s + 1}$$

+++ {"slideshow": {"slide_type": "subslide"}}

We can find the step response by letting $v_{\mathrm{in}}(t) = u_0(t)$ so that
$V_{\mathrm{in}}(s)=1/s$ then 

$$V_{\mathrm{out}}(s) = \frac{-1}{s^2 + 3s + 1}.\frac{1}{s}$$

+++ {"slideshow": {"slide_type": "subslide"}}

We can solve this by partial fraction expansion and inverse Laplace transform
as is done in the text book with the help of MATLAB's `residue` function.

Here, however we'll use the LTI block.

+++ {"slideshow": {"slide_type": "subslide"}}

Define the circuit as a transfer function

```{code-cell}
---
slideshow:
  slide_type: fragment
---
G = tf([-1],[1 3 1])
```

+++ {"slideshow": {"slide_type": "subslide"}}

step response is then:

```{code-cell}
---
slideshow:
  slide_type: fragment
---
step(G)
```

+++ {"slideshow": {"slide_type": "notes"}}

Simples!

+++ {"slideshow": {"slide_type": "subslide"}}

#### Simulink model

See [example_8.slx](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example_8.slx)

```{code-cell}
---
slideshow:
  slide_type: fragment
---
open example_8
```

+++ {"slideshow": {"slide_type": "notes"}}

![Simulink model](pictures/ex8_sim.png)

+++ {"slideshow": {"slide_type": "notes"}}

Result

![Simulation result](pictures/ex8_sim_result.png)

+++ {"slideshow": {"slide_type": "subslide"}}

Let's go a bit further by finding the frequency response:

```{code-cell}
---
slideshow:
  slide_type: subslide
---
bode(G)
```

## Reference 

See [Bibliography](/zbib).
