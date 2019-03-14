---
redirect_from:
  - "/fourier-transform/3/worksheet14"
interact_link: content/fourier_transform/3/worksheet14.ipynb
title: 'Worksheet 14 Fourier Transforms for Circuit and LTI Systems Analysis'
prev_page:
  url: /fourier_transform/2/worksheet13
  title: 'Worksheet 13 Fourier transforms of commonly occuring signals'
next_page:
  url: /fourier_transform/4/worksheet15
  title: 'Worksheet 15 Introduction to Filters'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 14

## To accompany Chapter 5.3 Fourier Transforms for Circuit and LTI Systems Analysis

We will step through this worksheet in class. 

You are expected to have at least watched the video presentation of [Chapter 5.3](https://cpjobling.github.io/eg-247-textbook/fourier_transform/3/ft3) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

## The System Function

### System response from system impulse response

Recall that the convolution integral of a system with impulse response $h(t)$ and input $u(t)$ is

$$h(t)*u(t)=\int_{-\infty}^{\infty}h(t-\tau)u(\tau)\,d\tau.$$

We let 

$$g(t) = h(t)*u(t)$$

Then by the time convolution property

$$h(t)*u(t) = g(t) \Leftrightarrow G(\omega) = H(\omega).U(\omega)$$

### The System Function

We call $H(\omega)$ the *system function*.

We note that the system function $H(\omega)$ and the impulse response $h(t)$ form the Fourier transform pair

$$h(t) \Leftrightarrow H(\omega)$$


### Obtaining system response

If we know the impulse resonse $h(t)$, we can compute the system response $g(t)$ of any input $u(t)$ by multiplying the Fourier transforms of $H(\omega)$ and $U(\omega)$ to obtain $G(\omega)$. Then we take the inverse Fourier transform of $G(\omega)$ to obtain the response $g(t)$.

1. Transform $h(t) \to H(\omega)$
2. Transform $u(t) \to U(\omega)$
3. Compute $G(\omega) = H(\omega).U(\omega)$
4. Find $\mathcal{F}^{-1}\left\{G(\omega)\right\} \to g(t)$

## Examples

### Example 1

Karris example 8.8: for the linear network shown below, the impulse response is $h(t)=3e^{-2t}$. Use the Fourier transform to compute the response $y(t)$ when the input $u(t)=2[u_0(t)-u_0(t-3)]$. Verify the result with MATLAB.

<img src="pictures/example1.png">

#### Solution

<pre style="border: 2px solid blue">
























</pre>

#### Matlab verification



{:.input_area}
```matlab
syms t w
U1 = fourier(2*heaviside(t),t,w)
```




{:.input_area}
```matlab
H = fourier(3*exp(-2*t)*heaviside(t),t,w)
```




{:.input_area}
```matlab
Y1=simplify(H*U1)
```




{:.input_area}
```matlab
y1 = simplify(ifourier(Y1,w,t))
```


Get y2

Substitute $t-3$ into $t$.



{:.input_area}
```matlab
y2 = subs(y1,t,t-3)
```




{:.input_area}
```matlab
y = y1 - y2
```


Plot result



{:.input_area}
```matlab
ezplot(y)
title('Solution to Example 1')
ylabel('y(y)')
xlabel('t [s]')
grid 
```


See [ft3_ex1.m](https://cpjobling.github.io/eg-247-textbook/fourier_transform/3/ft3_ex1.m)

Result is equivalent to:
    
    y = 3*heaviside(t) - 3*heaviside(t - 3) + 3*heaviside(t - 3)*exp(6 - 2*t) - 3*exp(-2*t)*heaviside(t)

Which after gathering terms gives

$$y(t) = 3(1 - 3e^{-2t})u_0(t) - 3(1 - 3e^{-2(t-3)})u_0(t-3)$$

### Example 2

Karris example 8.9: for the circuit shown below, use the Fourier transfrom method, and the system function $H(\omega)$ to compute $V_L(t)$. Assume $i_L(0^-)=0$. Verify the result with Matlab.

<img src="pictures/example2.png" width="50%">

#### Solution

<pre style="border: 2px solid blue">
























</pre>

#### Matlab verification



{:.input_area}
```matlab
syms t w
H = j*w/(j*w + 2)
```




{:.input_area}
```matlab
Vin = fourier(5*exp(-3*t)*heaviside(t),t,w)
```




{:.input_area}
```matlab
Vout=simplify(H*Vin)
```




{:.input_area}
```matlab
vout = simplify(ifourier(Vout,w,t))
```


Plot result



{:.input_area}
```matlab
ezplot(vout)
title('Solution to Example 2')
ylabel('v_{out}(t) [V]')
xlabel('t [s]')
grid 
```


See [ft3_ex2.m](https://cpjobling.github.io/eg-247-textbook/fourier_transform/3/ft3_ex2.m)

Result is equivalent to:
    
    vout = -5*exp(-3*t)*heaviside(t)*(2*exp(t) - 3)

Which after gathering terms gives

$$v_{\mathrm{out}} = 5\left(3e^{-3t} - 2e^{-2t}\right)u_0(t)$$


### Example 3

Karris example 8.10: for the linear network shown below, the input-output relationship is:

$$\frac{d}{dt}v_{\mathrm{out}}+4v_{\mathrm{out}}=10v_{\mathrm{in}}$$

where $v_{\mathrm{in}}=3e^{-2t}$. Use the Fourier transform method, and the system function $H(\omega)$ to compute the output $v_{\mathrm{out}}$. Verify the result with Matlab.

<img src="pictures/example3.jpg" width="75%">

#### Solution

<pre style="border: 2px solid blue">
























</pre>

#### Matlab verification



{:.input_area}
```matlab
syms t w
H = 10/(j*w + 4)
```




{:.input_area}
```matlab
Vin = fourier(3*exp(-2*t)*heaviside(t),t,w)
```




{:.input_area}
```matlab
Vout=simplify(H*Vin)
```




{:.input_area}
```matlab
vout = simplify(ifourier(Vout,w,t))
```


Plot result



{:.input_area}
```matlab
ezplot(vout)
title('Solution to Example 2')
ylabel('v_{out}(t) [V]')
xlabel('t [s]')
grid 
```


See [ft3_ex3.m](https://cpjobling.github.io/eg-247-textbook/fourier_transform/3/ft3/ft3_ex3.m)

Result is equiavlent to:
    
    15*exp(-4*t)*heaviside(t)*(exp(2*t) - 1)

Which after gathering terms gives

$$v_{\mathrm{out}}(t) = 15\left(e^{-2t}) - e^{-4t}\right)u_0(t)$$

### Example 4

Karris example 8.11: the voltage across a 1 $\Omega$ resistor is known to be $V_{R}(t)=3e^{-2t} u_0(t)$. Compute the energy dissipated in the resistor for $0\lt t\lt\infty$, and verify the result using Parseval's theorem. Verify the result with Matlab.

Note from [tables of integrals](http://en.wikipedia.org/wiki/Lists_of_integrals) 

$$\int\frac{1}{a^2 + x^2}\,dx = \frac{1}{a}\arctan\frac{x}{a}+C.$$

<img src="pictures/example4.png" width="25%">

#### Solution

<pre style="border: 2px solid blue">
























</pre>

#### Matlab verification



{:.input_area}
```matlab
syms t w
```


Calcuate energy from time function



{:.input_area}
```matlab
Vr = 3*exp(-2*t)*heaviside(t);
R = 1;
Pr = Vr^2/R
Wr = int(Pr,t,0,inf)
```


Calculate using Parseval's theorem



{:.input_area}
```matlab
Fw = fourier(Vr,t,w)
```




{:.input_area}
```matlab
Fw2 = simplify(abs(Fw)^2)
```




{:.input_area}
```matlab
Wr=2/(2*pi)*int(Fw2,w,0,inf)
```


See [ft3_ex4.m](https://cpjobling.github.io/eg-247-textbook/fourier_transform/3/ft3/ft3_ex4.m)

## Solutions

See Worked Solutions in the [Week 7 Section](https://swanseauniversity.sharepoint.com/sites/EG-247SignalsandSystems2017-2108-UsrGrpcopy-UsrGrp/_layouts/OneNote.aspx?id=%2Fsites%2FEG-247SignalsandSystems2017-2108-UsrGrpcopy-UsrGrp%2FSiteAssets%2FEG-247%20Signals%20and%20Systems%202017-2108-UsrGrp%20%5Bcopy%5D-UsrGrp%20Notebook&wd=target%28_Content%20Library%2FClasses%2FNew%20Section%201.one%7C681B0954-AC4E-9646-A567-FF06C3696F07%2FWeek%207%7C4CC13EA9-40BD-7B4F-B0B6-61B392AC4943%2F%29) of the OneNote Class Notebook.
