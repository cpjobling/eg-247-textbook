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

# Worksheet 7

## To accompany Chapter 3.4 Transfer Functions

+++ {"slideshow": {"slide_type": "notes"}}

## Colophon

This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet7.pdf). We will step through this worksheet in class. 

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 7** in the **Week 3: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 

You are expected to have at least watched the video presentation of [Chapter 3.4](https://cpjobling.github.io/eg-247-textbook/laplace_transform/4/transfer_functions) of the [notes](https://cpjobling.github.io/eg-247-textbook/) before coming to class. If you haven't watch it afterwards!

After class, the lecture recording and the annotated version of the worksheets will be made available through Canvas.

+++ {"slideshow": {"slide_type": "slide"}}

## Second Hour's Agenda

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
tags: [remove-output]
---
% Matlab setup
cd ../matlab 
pwd
clear all
format compact
```

+++ {"slideshow": {"slide_type": "slide"}}

## Transfer Functions for Circuits

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 6

Derive an expression for the transfer function $G(s)$ for the circuit below. In this circuit $R_g$ represents the internal resistance of the applied (voltage) source $v_s$, and $R_L$ represents the resistance of the load that consists of $R_L$, $L$ and $C$.

+++ {"slideshow": {"slide_type": "subslide"}}

<img title="Circuit for Example 6" src="pictures/example6.png" width="50%" />

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Sketch of Solution for Example 6

* Replace $v_s(t)$, $R_g$, $R_L$, $L$ and $C$ by their transformed (*complex frequency*) equivalents: $V_s(s)$, $R_g$, $R_L$, $sL$ and $1/(sC)$
* Use the *Voltage Divider Rule* to determine $V_\mathrm{out}(s)$ as a function of $V_s(s)$ 
* Form $G(s)$ by writing down the ratio $V_\mathrm{out}(s)/V_s(s)$

+++ {"slideshow": {"slide_type": "notes"}}

### Worked solution for Example 6

Pencast: [ex6.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex6.pdf) - open in Adobe Acrobat Reader.

+++ {"slideshow": {"slide_type": "subslide"}}

### Answer for Example 6

$$G(s) = \frac{V_\mathrm{out}(s)}{V_s(s)} = \frac{R_L + sL + 1/sC}{R_g + R_L + sL + 1/sC}.$$

+++ {"slideshow": {"slide_type": "subslide"}}

### Example 7

Compute the transfer function for the op-amp circuit shown below in terms of the circuit constants $R_1$, $R_2$, $R_3$, $C_1$ and $C_2$. Then replace the complex variable $s$ with $j\omega$, and the circuit constants with their numerical values and plot the magnitude

$$\left|G(j\omega)\right| = \frac{\left|V_{\mathrm{out}}(j\omega)\right|}{\left|V_{\mathrm{in}}(j\omega)\right|}$$

versus radian frequency $\omega$ rad/s.

+++ {"slideshow": {"slide_type": "subslide"}}

<img alt="Circuit for Example 7" src="pictures/example7.png" height="50%" />

+++ {"slideshow": {"slide_type": "notes"}}

<pre style="border: 2px solid blue">















</pre>

+++ {"slideshow": {"slide_type": "subslide"}}

### Sketch of Solution for Example 7

* Replace the components and voltages in the circuit diagram with their complex frequency equivalents
* Use nodal analysis to determine the voltages at the nodes either side of the 50K resistor $R_3$
* Note that the voltage at the input to the op-amp is a virtual ground
* Solve for $V_{\mathrm{out}}(s)$ as a function of $V_{\mathrm{in}}(s)$
* Form the reciprocal $G(s) = V_{\mathrm{out}}(s)/V_{\mathrm{in}}(s)$
* Use MATLAB to calculate the component values, then replace $s$ by $j\omega$.
* Plot 
    $$\left|G(j\omega)\right|$$
  on log-linear "paper".

+++ {"slideshow": {"slide_type": "notes"}}

### Worked solution for Example 7

Pencast: [ex7.pdf](https://cpjobling.github.io/eg-247-textbook/laplace_transform/worked_examples/ex7.pdf) - open in Adobe Acrobat Reader.

+++ {"slideshow": {"slide_type": "subslide"}}

### Answer for Example 7

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
tags: [remove-output]
---
syms s;
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
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
tags: [remove-output]
---
den = R1*((1/R1+ 1/R2 + 1/R3 + s*C1)*(s*R3*C2) + 1/R2);
simplify(den)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Result is: `100*s*((7555786372591433*s)/302231454903657293676544 + 1/20000) + 5`

+++ {"slideshow": {"slide_type": "subslide"}}

Simplify coefficients of s in denominator

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
format long
denG = sym2poly(ans)
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
numG = -1;
```

+++ {"slideshow": {"slide_type": "subslide"}}

Plot

For convenience, define coefficients $a$ and $b$:

```{code-cell}
:tags: [remove-output]

a = denG(1);
b = denG(2);
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
w = 1:10:10000;
```

+++ {"slideshow": {"slide_type": "subslide"}}

$$G(j\omega) = \frac{-1}{a\omega^2 - jb\omega + 5}$$

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
Gs = -1./(a*w.^2 - j.*b.*w + denG(3));
```

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
semilogx(w, abs(Gs))
xlabel('Radian frequency w (rad/s')
ylabel('|Vout/Vin|')
title('Magnitude Vout/Vin vs. Radian Frequency')
grid
```

+++ {"slideshow": {"slide_type": "slide"}}

## Using Transfer Functions in Matlab for System Analysis

Please use the file [tf_matlab.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/tf_matlab.m) to explore the Transfer Function features provide by Matlab. Use the *publish* option to generate a nicely formatted document.

+++ {"slideshow": {"slide_type": "slide"}}

## Using Transfer Functions in Simulink for System Simulation

![Using Transfer Functions in Simulink for System Simulation](pictures/sim_tf.png)

The Simulink transfer function (**`Transfer Fcn`**) block shown above implements a transfer function representing a general
input output function

$$G(s) = \frac{N(s)}{D(s)}$$

that it is not specific nor restricted to circuit analysis. It can, however be used in modelling and simulation studies.

+++ {"slideshow": {"slide_type": "subslide"}}

### Example

Recast Example 7 as a MATLAB problem using the LTI Transfer Function block. 

For simplicity use parameters $R_1 = R_2 = R_3 = 1\; \Omega$, and $C_1 = C_2 = 1$ F.

Calculate the step response using the LTI functions.

Verify the result with Simulink.

The Matlab solution: [example8.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example8.m)

+++ {"slideshow": {"slide_type": "subslide"}}

#### MATLAB Solution
From a previous analysis the transfer function is:

$$G(s) = \frac{V_\mathrm{out}}{V_\mathrm{in}} = \frac{-1}{R_1\left[(1/R_1 + 1/R_2 + 1/R_3 + sC_1)(sR_3C_2) + 1/R_2\right]}$$

so substituting the component values we get:

$$G(s) = \frac{V_{\mathrm{out}}}{V_{\mathrm{in}}} = \frac{-1}{s^2 + 3s + 1}$$

We can find the step response by letting $v_{\mathrm{in}}(t) = u_0(t)$ so that
$V_{\mathrm{in}}(s)=1/s$ then 

$$V_{\mathrm{out}}(s) = \frac{-1}{s^2 + 3s + 1}.\frac{1}{s}$$
 
We can solve this by partial fraction expansion and inverse Laplace transform
as is done in the text book with the help of Matlab's `residue` function.

Here, however we'll use the LTI block that was introduced in the lecture.

+++ {"slideshow": {"slide_type": "subslide"}}

Define the circuit as a transfer function

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
G = tf([-1],[1 3 1])
```

+++ {"slideshow": {"slide_type": "subslide"}}

step response is then:

```{code-cell}
---
slideshow:
  slide_type: subslide
tags: [remove-output]
---
step(G)
```

+++ {"slideshow": {"slide_type": "subslide"}}

Simples!

+++ {"slideshow": {"slide_type": "subslide"}}

#### Simulink model

See [example_8.slx](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example_8.slx)

```{code-cell}
---
slideshow:
  slide_type: fragment
tags: [remove-output]
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
tags: [remove-output]
---
bode(G)
```

## Matlab Solutions

For convenience, single script MATLAB solutions to the examples are provided and can be downloaded from the accompanying [MATLAB](https://github.com/cpjobling/eg-247-textbook/tree/master/laplace_transform/matlab) folder.

* Solution 7 [[solution7.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/solution7.m)]
* Example 8  [[example8.m](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example8.m)]
* Simulink model [[example_8.slx](https://cpjobling.github.io/eg-247-textbook/laplace_transform/matlab/example_8.slx)]

```{code-cell}
:tags: [remove-output]

cd ../matlab
ls
open solution7
```
