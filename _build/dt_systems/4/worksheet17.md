---
redirect_from:
  - "/dt-systems/4/worksheet17"
interact_link: content/dt_systems/4/worksheet17.ipynb
title: 'Worksheet 17 Models of DT Systems'
prev_page:
  url: /dt_systems/3/worksheet16
  title: 'Worksheet 16 The Inverse Z-Transform'
next_page:
  url: /dft/1/worksheet18
  title: 'Worksheet 18 The Discrete-time Fourier Transform'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 17

## To accompany Chapter 6.4 Models of Discrete-Time Systems

We will step through this worksheet in class. 

You are expected to have at least watched the video presentation of [Chapter 6.4](https://cpjobling.github.io/eg-247-textbook/dt_systems/4/dt_models) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. 

If you haven't watch it afterwards!

## Agenda

* Discrete Time Systems (Notes)

* Transfer Functions in the Z-Domain (Notes)

* Modelling digital systems in MATLAB/Simulink

* Continuous System Equivalents

* In-class demonstration: Digital Butterworth Filter

## Discrete Time Systems

In the lecture that introduced the z-transform we talked about the representation of a discrete-time (DT) system by the model shown below:

<img src="pictures/ct-to-dt.png">

In this session, we want to explore the contents of the central block.

### Example 5

Karris Example 9.10:

The difference equation describing the input-output relationship of a DT system with zero initial conditions, is:

$$y[n] - 0.5 y[n-1] + 0.125 y[n-2] = x[n] + x[n -1]$$

Compute:

1. The transfer function $H(z)$
2. The DT impulse response $h[n]$
3. The response $y[n]$ when the input $x[n]$ is the DT unit step $u_0[n]$

### 5.1. The transfer function

$$H(z) = \frac{Y(z)}{U(z)} = ...?$$

<pre style="border: 2px solid blue">



















</pre>

### 5.2. The DT impulse response

Start with:

$$\frac{H(z)}{z} = \frac{z - 1}{z^2 + 0.5 z + 0.125}$$

<pre style="border: 2px solid blue">



















</pre>

### MATLAB Solution



{:.input_area}
```matlab
clear all
cd matlab
pwd
format compact
```


{:.output .output_stream}
```

ans =

    '/Users/eechris/dev/eg-247-textbook/content/dt_systems/4/matlab'


```

See [dtm_ex1_2.mlx](matlab/dtm_ex1_2.mlx). (Also available as [dtm_ex1_2.m](matlab/dtm_ex1_2.m).)

The difference equation describing the input-output relationship of the DT system with zero initial conditions, is:

$$y[n] - 0.5 y[n-1] + 0.125 y[n-2] = x[n] + x[n -1]$$
 

#### Transfer function

Numerator $z + 1$



{:.input_area}
```matlab
Nz = [0 1 1];
```


Denominator $z^2 - 0.5 z + 0.125$



{:.input_area}
```matlab
Dz = [1 -0.5 0.125];
```


#### Poles and residues



{:.input_area}
```matlab
[r,p,k] = residue(Nz,Dz)
```


{:.output .output_stream}
```
r =
   0.5000 - 2.5000i
   0.5000 + 2.5000i
p =
   0.2500 + 0.2500i
   0.2500 - 0.2500i
k =
     []

```

#### Impulse Response



{:.input_area}
```matlab
Hz = tf(Nz,Dz,1)
hn = impulse(Hz, 15);
```


{:.output .output_stream}
```

Hz =
 
         z + 1
  -------------------
  z^2 - 0.5 z + 0.125
 
Sample time: 1 seconds
Discrete-time transfer function.


```

#### Plot the response



{:.input_area}
```matlab
stem([0:15], hn)
grid
title('Example 5 - Part 2')
xlabel('n')
ylabel('Impulse response h[n]')
```



{:.output .output_png}
![png](../../images/dt_systems/4/worksheet17_28_0.png)



#### Response as stepwise continuous y(t)



{:.input_area}
```matlab
impulse(Hz,15)
grid
title('Example 5 - Part 2 - As Analogue Signal')
xlabel('nTs [s]')
ylabel('Impulse response h(t)')
```



{:.output .output_png}
![png](../../images/dt_systems/4/worksheet17_30_0.png)



### 5.3. The DT step response

$$Y(z) = H(z)X(z)$$

$$u_0[n] \Leftrightarrow \frac{z}{z - 1}$$

$$\begin{array}{lcl}
Y(z) = H(z){U_0}(z) &=& \frac{z^2 + z}{z^2 + 0.5z + 0.125}.\frac{z}{z - 1}\\
 & = & \frac{z(z^2 + z)}{(z^2 + 0.5z + 0.125)(z - 1)}
\end{array}$$

$$\frac{Y(z)}{z} = \frac{z^2 + z}{(z^2 + 0.5 z + 0.125)(z - 1)}$$

Solved by inverse Z-transform.

<pre style="border: 2px solid blue">



















</pre>

### MATLAB Solution

See [dtm_ex1_3.mlx](matlab/dtm_ex1_3.mlx). (Also available as [dtm_ex1_3.m](matlab/dtm_ex1_3.m).)
    



{:.input_area}
```matlab
open dtm_ex1_3
```


### Results

<img src="pictures/dtm_ex1_3_1.png">

## Modelling DT systems in MATLAB and Simulink

We will consider some examples in class

### MATLAB

Code extracted from [dtm_ex1_3.m](matlab/dtm_ex1_3.m):

 



{:.input_area}
```matlab
Ts = 1;
z = tf('z', Ts);
```




{:.input_area}
```matlab
Hz = (z^2 + z)/(z^2 - 0.5 * z + 0.125)
```


{:.output .output_stream}
```

Hz =
 
        z^2 + z
  -------------------
  z^2 - 0.5 z + 0.125
 
Sample time: 1 seconds
Discrete-time transfer function.


```



{:.input_area}
```matlab
step(Hz)
grid
title('Example 1 - Part 3 - As Analogue Signal')
xlabel('nTs [s]')
ylabel('Step response y(t)')
axis([0,15,0,3.5])
```



{:.output .output_png}
![png](../../images/dt_systems/4/worksheet17_45_0.png)



### Simulink Model

See [dtm.slx](matlab/dtm.slx):

<img src="pictures/simulink_model.png">



{:.input_area}
```matlab
dtm
```


#### Results

<img src="pictures/scope.png">

## Converting Continuous Time Systems to Discrete Time Systems

### Continuous System Equivalents

* There is no digital system that uniquely represents a continuous system
* This is because as we are sampling, we only have knowledge of signals being processed at the sampling instants, and need to *reconstruct* the inter-sample behaviour.
* In practice, only a small number of transformations are used.
* The derivation of these is beyond the scope of this module, but here we'll demonstrate the ones that MATLAB provides in a function called `c2d`

### MATLAB c2d function

Let's see what the help function says:



{:.input_area}
```matlab
help c2d
```




{:.input_area}
```matlab
doc c2d
```


### Example 6

* Design a 2nd-order butterworth low-pass anti-aliasing filter with transfer function $H(s)$ for use in sampling music. 
* The cut-off frequency $\omega_c = 20$&nbsp;kHz and the filter should have an attenuation of at least $-80$&nbsp;dB in the stop band. 
* Choose a suitable sampling frequency for the audio signal and give the transfer function $H(z)$ and an algorithm to implement $h[n]$

### Solution

See [digit_butter.mlx](matlab/digit_butter.mlx).

First determine the cut-off frequency $\omega_c$

$$\omega_c = 2\pi f_c = 2\times \pi \times 20\times 10^3\;\mathrm{rad/s}$$



{:.input_area}
```matlab
wc = 2*pi*20e3
```


{:.output .output_stream}
```
wc =
   1.2566e+05

```

$$\omega_c = 125.66\times 10^3\;\mathrm{rad/s}$$

From the lecture on filters, we know the 2nd-order butterworth filter has transfer function:

$$H(s) = \frac{Y(s)}{U(s)} = \frac{\omega _c^2}{s^2 + \omega _c\sqrt 2 \,s + \omega _c^2}$$

Substituting for $\omega_c = 125.6637\times 10^3 $ this is ...?



{:.input_area}
```matlab
Hs = tf(wc^2,[1 wc*sqrt(2), wc^2])
```


{:.output .output_stream}
```

Hs =
 
           1.579e10
  ---------------------------
  s^2 + 1.777e05 s + 1.579e10
 
Continuous-time transfer function.


```

$$H(s) = \frac{15.79 \times 10^9}{s^2 + 177.7 \times 10^3 s + 15.79 \times 10^9}$$

### Bode plot

MATLAB:



{:.input_area}
```matlab
bode(Hs,{1e4,1e8})
grid
```



{:.output .output_png}
![png](../../images/dt_systems/4/worksheet17_64_0.png)



### Sampling Frequency

From the bode diagram, the frequency at which $|H(j\omega)|$ is $-80$&nbsp;dB is approx $12.6\times 10^6$&nbsp;rad/s.

To avoid aliasing, we should choose a sampling frequency twice this = ?

$\omega_s = 2\times 12.6\times 10^6$&nbsp;rad/s.



{:.input_area}
```matlab
ws = 2* 12.6e6
```


{:.output .output_stream}
```
ws =
    25200000

```

So

$\omega_s = 25.2\times 10^6$&nbsp;rad/s.

Sampling frequency ($f_s$) in Hz  = ?

$$f_s = \omega_s/(2\pi)\;\mathrm{Mhz}$$




{:.input_area}
```matlab
fs = ws/(2*pi)
```


{:.output .output_stream}
```
fs =
   4.0107e+06

```

$$f_s = 40.11\;\mathrm{Mhz}$$

Sampling time $T_s = ?$

$T_s = 1/fs\;\mathrm{s}$



{:.input_area}
```matlab
Ts = 1/fs
```


{:.output .output_stream}
```
Ts =
   2.4933e-07

```

$$T_s = 1/f_s \approx 0.25\;\mu\mathrm{s}$$

### Digital Butterworth

zero-order-hold equivalent



{:.input_area}
```matlab
Hz = c2d(Hs, Ts)
```


{:.output .output_stream}
```

Hz =
 
  0.0004836 z + 0.0004765
  -----------------------
  z^2 - 1.956 z + 0.9567
 
Sample time: 2.4933e-07 seconds
Discrete-time transfer function.


```

### Step response



{:.input_area}
```matlab
step(Hz)
```



{:.output .output_png}
![png](../../images/dt_systems/4/worksheet17_79_0.png)



### Algorithm

From previous result:

$$H(z) = \frac{Y(z)}{U(z)} = \frac{486.6\times 10^{-6}z +  476.5\times 10^{-6}}{z^2 - 1.956z + 0.9567}$$

Dividing top and bottom by $z^2$ ...

$$H(z) = \frac{Y(z)}{U(z)} = \frac{486.6\times 10^{-6}z^{-1} +  476.5\times 10^{-6}z^{-2}}{1 - 1.956z^{-1} + 0.9567z^{-2}}$$

expanding out ...

$$\begin{array}{l}
Y(z) - 1.956{z^{ - 1}}Y(z) + 0.9567{z^{ - 2}}Y(z) = \\
\quad 486.6 \times {10^{ - 6}}{z^{ - 1}}U(z) + 476.5 \times {10^{ - 6}}{z^{ - 2}}U(z)
\end{array}$$

Inverse z-transform gives ...

$$\begin{array}{l}
y[n] - 1.956y[n - 1] + 0.9567y[n - 2] = \\
\quad 486.6 \times {10^{ - 6}}u[n - 1] + 476.5 \times {10^{ - 6}}u[n - 2]
\end{array}$$



in algorithmic form (compute $y[n]$ from past values of $u$ and $y$) ...

$$\begin{array}{l}
y[n] = 1.956y[n - 1] - 0.9567y[n - 2] + 486.6 \times {10^{ - 6}}u[n - 1] + ...\\
\quad 476.5 \times {10^{ - 6}}u[n - 2]
\end{array}$$

### Block Diagram of the digital BW filter

![digital filter](pictures/digifilter-bd.png)

### As Simulink Model



{:.input_area}
```matlab
open digifilter
```


### Convert to code

To implement:
$$y[n] = 1.956 y[n-1] - 0.9567 y[n - 2] + 486.6\times 10^{-6} u[n-1] + 476.5\times 10^{-6} u[n-2]$$

    /* Initialize */
    Ts = 2.4933e-07; /* more probably some fraction of clock speed */
    ynm1 = 0; ynm2 = 0; unm1 = 0; unm2 = 0;
    while (true) {
        un = read_adc;
        yn = 1.956*ynm1 - 0.9567*ynm2 + 486.6e-6*unm1 + 476.5e-6*unm2;
        write_dac(yn);
        /* store past values */
        ynm2 = ynm1; ynm1 = yn;
        unm2 = unm1; unm1 = un;
        wait(Ts);
    }

### Comments

PC soundcards can sample audio at 44.1 kHz so this implies that the anti-aliasing filter is much sharper than this one as $f_s/2 = 22.05$ kHz.

You might wish to find out what order butterworth filter would be needed to have $f_c = 20$ kHz and $f_{\mathrm{stop}}$ of 22.05 kHz.
