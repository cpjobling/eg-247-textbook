---
redirect_from:
  - "/fourier-transform/3/ft3"
interact_link: content/fourier_transform/3/ft3.ipynb
title: 'Fourier Transforms for Circuit and LTI Systems Analysis'
prev_page:
  url: /fourier_transform/2/ft2
  title: 'Fourier transforms of commonly occuring signals'
next_page:
  url: /fourier_transform/4/ft4
  title: 'Introduction to Filters'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Fourier Transforms for Circuit and LTI Systems Analysis

In this section we will apply what we have learned about Fourier transforms to some typical circuit problems. After a short introduction, the body of this chapter will form the basis of an examples class.

## Agenda

* The system function

* Examples

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

Karris example 8.8: for the linear network shown below, the impulse response is $h(t)=3e^{-2t}$. Use the Fourier transform to compute the response $y(t)$ when the input $u(t)=2[u_0(t)-u_0(t-3)]$. Verify the result with Matlab.

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


{:.output .output_stream}
```
 
U1 =
 
2*pi*dirac(w) - 2i/w
 

```



{:.input_area}
```matlab
H = fourier(3*exp(-2*t)*heaviside(t),t,w)
```


{:.output .output_stream}
```
 
H =
 
3/(2 + w*1i)
 

```



{:.input_area}
```matlab
Y1=simplify(H*U1)
```


{:.output .output_stream}
```
 
Y1 =
 
3*pi*dirac(w) - 6i/(w*(2 + w*1i))
 

```



{:.input_area}
```matlab
y1 = simplify(ifourier(Y1,w,t))
```


{:.output .output_stream}
```
 
y1 =
 
(3*exp(-2*t)*(sign(t) + 1)*(exp(2*t) - 1))/2
 

```

Get y2

Substitute $t-3$ into $t$.



{:.input_area}
```matlab
y2 = subs(y1,t,t-3)
```


{:.output .output_stream}
```
 
y2 =
 
(3*exp(6 - 2*t)*(sign(t - 3) + 1)*(exp(2*t - 6) - 1))/2
 

```



{:.input_area}
```matlab
y = y1 - y2
```


{:.output .output_stream}
```
 
y =
 
(3*exp(-2*t)*(sign(t) + 1)*(exp(2*t) - 1))/2 - (3*exp(6 - 2*t)*(sign(t - 3) + 1)*(exp(2*t - 6) - 1))/2
 

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



{:.output .output_png}
![png](../../images/fourier_transform/3/ft3_24_0.png)



See [ft3_ex1.m](ft3_ex1.m)

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


{:.output .output_stream}
```
 
H =
 
(w*1i)/(2 + w*1i)
 

```



{:.input_area}
```matlab
Vin = fourier(5*exp(-3*t)*heaviside(t),t,w)
```


{:.output .output_stream}
```
 
Vin =
 
5/(3 + w*1i)
 

```



{:.input_area}
```matlab
Vout=simplify(H*Vin)
```


{:.output .output_stream}
```
 
Vout =
 
(w*5i)/((2 + w*1i)*(3 + w*1i))
 

```



{:.input_area}
```matlab
vout = simplify(ifourier(Vout,w,t))
```


{:.output .output_stream}
```
 
vout =
 
-(5*exp(-3*t)*(sign(t) + 1)*(2*exp(t) - 3))/2
 

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



{:.output .output_png}
![png](../../images/fourier_transform/3/ft3_35_0.png)



See [ft3_ex2.m](files/matlab/ft3_ex2.m)

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


{:.output .output_stream}
```
 
H =
 
10/(4 + w*1i)
 

```



{:.input_area}
```matlab
Vin = fourier(3*exp(-2*t)*heaviside(t),t,w)
```


{:.output .output_stream}
```
 
Vin =
 
3/(2 + w*1i)
 

```



{:.input_area}
```matlab
Vout=simplify(H*Vin)
```


{:.output .output_stream}
```
 
Vout =
 
30/((2 + w*1i)*(4 + w*1i))
 

```



{:.input_area}
```matlab
vout = simplify(ifourier(Vout,w,t))
```


{:.output .output_stream}
```
 
vout =
 
(15*exp(-4*t)*(sign(t) + 1)*(exp(2*t) - 1))/2
 

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



{:.output .output_png}
![png](../../images/fourier_transform/3/ft3_46_0.png)



See [ft3_ex3.m](ft3_ex3.m)

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


{:.output .output_stream}
```
 
Pr =
 
9*exp(-4*t)*heaviside(t)^2
 
 
Wr =
 
9/4
 

```

Calculate using Parseval's theorem



{:.input_area}
```matlab
Fw = fourier(Vr,t,w)
```


{:.output .output_stream}
```
 
Fw =
 
3/(2 + w*1i)
 

```



{:.input_area}
```matlab
Fw2 = simplify(abs(Fw)^2)
```


{:.output .output_stream}
```
 
Fw2 =
 
9/abs(2 + w*1i)^2
 

```



{:.input_area}
```matlab
Wr=2/(2*pi)*int(Fw2,w,0,inf)
```


{:.output .output_stream}
```
 
Wr =
 
(51607450253003931*pi)/72057594037927936
 

```

See [ft3_ex4.m](ft3_ex4.m)
