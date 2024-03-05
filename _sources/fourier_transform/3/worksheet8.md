---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.15.2
  kernelspec:
    display_name: Matlab
    language: matlab
    name: matlab
---

<!-- #region slideshow={"slide_type": "slide"} -->
(ws8)=
# Worksheet 8

## To accompany Chapter 4.3 Fourier Transforms for Circuit and LTI Systems Analysis
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "skip"} -->
This worksheet can be downloaded as a [PDF file](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet8.pdf). We will step through this worksheet in class. 

An annotatable copy of the notes for this presentation will be distributed before the second class meeting as **Worksheet 8** in the **Week 6: Classroom Activities** section of the Canvas site. I will also distribute a copy to your personal **Worksheets** section of the **OneNote Class Notebook** so that you can add your own notes using OneNote. 

You are expected to have at least watched the video presentation of {ref}`ft3` of the [notes](https://cpjobling.github.io/eg-247-textbook/) before coming to class. If you haven't watch it afterwards!

After class, the lecture recording and the annotated version of the worksheets will be made available through Canvas.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->
## The System Function
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
### System response from system impulse response

Recall that the convolution integral of a system with impulse response $h(t)$ and input $u(t)$ is

$$h(t)*u(t)=\int_{-\infty}^{\infty}h(t-\tau)u(\tau)\,d\tau.$$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
We let 

$$g(t) = h(t)*u(t)$$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
Then by the time convolution property

$$h(t)*u(t) = g(t) \Leftrightarrow G(\omega) = H(\omega).U(\omega)$$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
We call $H(\omega)$ the *system function*.

We note that the system function $H(\omega)$ and the impulse response $h(t)$ form the Fourier transform pair

$$h(t) \Leftrightarrow H(\omega)$$

<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
### Obtaining system response

If we know the impulse resonse $h(t)$, we can compute the system response $g(t)$ of any input $u(t)$ by multiplying the Fourier transforms of $H(\omega)$ and $U(\omega)$ to obtain $G(\omega)$. Then we take the inverse Fourier transform of $G(\omega)$ to obtain the response $g(t)$.
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
1. Transform $h(t) \to H(\omega)$
2. Transform $u(t) \to U(\omega)$
3. Compute $G(\omega) = H(\omega).U(\omega)$
4. Find $\mathcal{F}^{-1}\left\{G(\omega)\right\} \to g(t)$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "slide"} -->
## Examples
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
### Example 1

Karris example 8.8: for the linear network shown below, the impulse response is $h(t)=3e^{-2t}$. Use the Fourier transform to compute the response $y(t)$ when the input $u(t)=2[u_0(t)-u_0(t-3)]$. Verify the result with MATLAB.

![Example 1](./pictures/example1.png)

Worked solution: [ft3-ex1.pdf](https://cpjobling.github.io/eg-247-textbook/fourier_transform/solutions/ft3-ex1.pdf).

MATLAB solution: [ft3_ex1.mlx](https://cpjobling.github.io/eg-247-textbook/fourier_transform/solutions/ft3_ex1.mlx).

<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
#### Solution to example 1

<pre style="border: 2px solid blue">
























</pre>
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### Matlab verification of example 1
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
format compact
cd ../matlab
open ft3_ex1
```

```matlab slideshow={"slide_type": "subslide"}
syms t w
U1 = fourier(2*heaviside(t),t,w)
```

```matlab slideshow={"slide_type": "subslide"}
H = fourier(3*exp(-2*t)*heaviside(t),t,w)
```

```matlab slideshow={"slide_type": "subslide"}
Y1=simplify(H*U1)
```

```matlab slideshow={"slide_type": "subslide"}
y1 = simplify(ifourier(Y1,w,t))
```

<!-- #region slideshow={"slide_type": "subslide"} -->
Get y2

Substitute $t-3$ into $t$.
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
y2 = subs(y1,t,t-3)
```

```matlab slideshow={"slide_type": "subslide"}
y = y1 - y2
```

<!-- #region slideshow={"slide_type": "subslide"} -->
Plot result
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
fplot(y,[0,6])
title('Solution to Example 1')
ylabel('y(t)')
xlabel('t [s]')
grid 
```

<!-- #region slideshow={"slide_type": "notes"} -->
See [ft3_ex1.mlx](https://cpjobling.github.io/eg-247-textbook/fourier_transform/matlab/ft3_ex1.mlx)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
Result is equivalent to:
    
    y = 3*heaviside(t) - 3*heaviside(t - 3) + 3*heaviside(t - 3)*exp(6 - 2*t) - 3*exp(-2*t)*heaviside(t)

Which after gathering terms gives

$$y(t) = 3(1 - 3e^{-2t})u_0(t) - 3(1 - 3e^{-2(t-3)})u_0(t-3)$$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
### Example 2

Karris example 8.9: for the circuit shown below, use the Fourier transfrom method, and the system function $H(\omega)$ to compute $V_L(t)$. Assume $i_L(0^-)=0$. Verify the result with Matlab.

![Example 2](./pictures/example2-small.png)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
#### Solution to example 2

<pre style="border: 2px solid blue">
























</pre>
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### Matlab verification of example 2
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
syms t w
H = j*w/(j*w + 2)
```

```matlab slideshow={"slide_type": "subslide"}
Vin = fourier(5*exp(-3*t)*heaviside(t),t,w)
```

```matlab slideshow={"slide_type": "subslide"}
Vout=simplify(H*Vin)
```

```matlab slideshow={"slide_type": "subslide"}
vout = simplify(ifourier(Vout,w,t))
```

<!-- #region slideshow={"slide_type": "subslide"} -->
Plot result
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
fplot(vout,[0,6])
title('Solution to Example 2')
ylabel('v_{out}(t) [V]')
xlabel('t [s]')
grid 
```

<!-- #region slideshow={"slide_type": "notes"} -->
See [ft3_ex2.m](https://github.com/cpjobling/eg-247-textbook/blob/master/fourier_transform/matlab/ft3_ex2.m)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
Result is equivalent to:
    
    vout = -5*exp(-3*t)*heaviside(t)*(2*exp(t) - 3)

Which after gathering terms gives

$$v_{\mathrm{out}} = 5\left(3e^{-3t} - 2e^{-2t}\right)u_0(t)$$

<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
### Example 3

Karris example 8.10: for the linear network shown below, the input-output relationship is:

$$\frac{d}{dt}v_{\mathrm{out}}+4v_{\mathrm{out}}=10v_{\mathrm{in}}$$

where $v_{\mathrm{in}}=3e^{-2t}$. Use the Fourier transform method, and the system function $H(\omega)$ to compute the output $v_{\mathrm{out}}$. Verify the result with Matlab.

![Example 3](./pictures/example3-small.png)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
#### Solution to example 3

<pre style="border: 2px solid blue">
























</pre>
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### Matlab verification of example 3
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
syms t w
H = 10/(j*w + 4)
```

```matlab slideshow={"slide_type": "subslide"}
Vin = fourier(3*exp(-2*t)*heaviside(t),t,w)
```

```matlab slideshow={"slide_type": "subslide"}
Vout=simplify(H*Vin)
```

```matlab slideshow={"slide_type": "subslide"}
vout = simplify(ifourier(Vout,w,t))
```

<!-- #region slideshow={"slide_type": "subslide"} -->
Plot result
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
ezplot(vout)
title('Solution to Example 3')
ylabel('v_{out}(t) [V]')
xlabel('t [s]')
grid 
```

<!-- #region slideshow={"slide_type": "notes"} -->
See [ft3_ex3.m](https://github.com/cpjobling/eg-247-textbook/blob/master/fourier_transform/matlab/ft3_ex3.m)

Result is equiavlent to:
    
    15*exp(-4*t)*heaviside(t)*(exp(2*t) - 1)

Which after gathering terms gives

$$v_{\mathrm{out}}(t) = 15\left(e^{-2t} - e^{-4t}\right)u_0(t)$$
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
### Example 4

Karris example 8.11: the voltage across a 1 $\Omega$ resistor is known to be $V_{R}(t)=3e^{-2t} u_0(t)$. Compute the energy dissipated in the resistor for $0\lt t\lt\infty$, and verify the result using Parseval's theorem. Verify the result with Matlab.

Note from [tables of integrals](https://en.wikipedia.org/wiki/Lists_of_integrals) 

$$\int\frac{1}{a^2 + x^2}\,dx = \frac{1}{a}\arctan\frac{x}{a}+C.$$

![Example 4](./pictures/example4-small.png)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
#### Solution to example 4

<pre style="border: 2px solid blue">
























</pre>
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "subslide"} -->
#### Matlab verification of example 4
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
syms t w
```

<!-- #region slideshow={"slide_type": "subslide"} -->
Calcuate energy from time function
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
Vr = 3*exp(-2*t)*heaviside(t);
R = 1;
Pr = Vr^2/R
Wr = int(Pr,t,0,inf)
```

<!-- #region slideshow={"slide_type": "subslide"} -->
Calculate using Parseval's theorem
<!-- #endregion -->

```matlab slideshow={"slide_type": "subslide"}
Fw = fourier(Vr,t,w)
```

```matlab slideshow={"slide_type": "subslide"}
Fw2 = simplify(abs(Fw)^2)
```

```matlab slideshow={"slide_type": "subslide"}
Wr=2/(2*pi)*int(Fw2,w,0,inf)
```

<!-- #region slideshow={"slide_type": "notes"} -->
See [ft3_ex4.m](https://github.com/cpjobling/eg-247-textbook/blob/master/fourier_transform/matlab/ft3_ex4.m)
<!-- #endregion -->

<!-- #region slideshow={"slide_type": "notes"} -->
## Solutions

See Worked Solutions in the [Worked Solutions to Selected Week 6 Problems](https://canvas.swansea.ac.uk/courses/44853/pages/worked-solutions-to-selected-week-6-problems-2?module_item_id=2484101) of the Canvas course site.
<!-- #endregion -->
