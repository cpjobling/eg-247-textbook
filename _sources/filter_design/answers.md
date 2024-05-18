---
jupyter:
  jupytext:
    formats: md,ipynb
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.15.2
  kernelspec:
    display_name: Matlab (Connection)
    language: matlab
    name: matlab_connect
---

# Worked Solutions to Exercises 7.2

(sol:ex7.2.1)=
## Solution to Exercise 7.2.1

See: {ref}`u72:ex:1`


We first write down the difference equations by tracing through the signals in the block diagram of {numref}`fig:u72:1`.

$$
y[n] = b_0 w[n] + b_1w[n-1] + b_2w[n-2] + b_3w[n-2] 
$$ (eq:sol:7.2.1:1)

$$
w[n] = x[n] - a_1 w[n-1] - a_1 w[n-2] - a_3w[n-2] 
$$ (eq:sol:7.2.1:2)


We take Z-transforms of equations {eq}`eq:sol:7.2.1:1` and {eq}`eq:sol:7.2.1:2`:

$$
Y(z) = b_0 W(z) + b_1 z^{-1} W(z)  + b_2 z^{-2} W(z) + b_3 z^{-3} W(z) 
$$ (eq:sol:7.2.1:3)

$$
W(z) = X(z) + a_1 z^{-1} W(z) + a_1 z^{-2} W(z) + a_3 z^{-3} W(z) 
$$ (eq:sol:7.2.1:4)


Gather terms in {eq}`eq:sol:7.2.1:3` and {eq}`eq:sol:7.2.1:4`:

$$
Y(z) = \left(b_0 + b_1 z^{-1} + b_2 z^{-2} + b_3 z^{-3}\right) W(z) 
$$ (eq:sol:7.2.1:5)

$$
\left(1 + a_1 z^{-1}- a_1 z^{-2} - a_3 z^{-3} \right) W(z) = X(z) 
$$ (eq:sol:7.2.1:6)


From {eq}`eq:sol:7.2.1:6` we obtain

$$W(z) = \frac{1}{1 + a_1 z^{-1}- a_1 z^{-2} - a_3 z^{-3}}  X(z)$$ (eq:sol:7.2.1:7)

We then use {eq}`eq:sol:7.2.1:7` to eliminate $W(z)$ from {eq}`eq:sol:7.2.1:5`, giving

$$Y(z) = \frac{b_0 W(z) + b_1 z^{-1} W(z)  + b_2 z^{-2} W(z) + b_3 z^{-3}}{1 + a_1 z^{-1}- a_1 z^{-2} - a_3 z^{-3}} X(z)$$

and the transfer function follows:

$$H(z) = \frac{Y(z)}{X(z)} = \frac{b_0 W(z) + b_1 z^{-1} W(z)  + b_2 z^{-2} W(z) + b_3 z^{-3}}{1 + a_1 z^{-1}- a_1 z^{-2} - a_3 z^{-3}}$$ (eq:sol:7.2.1:8)




(sol:ex7.2.2)=
## Solution to Exercise 7.2.2

> Use the block diagram shown in {numref}`fig:u72:4` to validate {eq}`eq:7.2:18`. Write down the equivalent difference equation.

See: {ref}`u72:ex:2`

----

The same procedure used for {ref}`sol:ex7.2.1` is used.





(sol:ex7.2.3)=
# Solution to Exercise 7.2.3

> Design a 2nd-order Butterworth filter with $\omega_c = 20$ kHz. Use the Bilinear transformation to convert the analogue filter to a digital filter with sampling frequency of 44.1 kHz. Use pre-warping to ensure that the cutoff frequency is correct at the equivalent digital frequency.

See: {ref}`u72:ex:3`


---- 


The magnitude squared function of a $k$-th order Butterworth low-pass filter is

$$A^2(\omega) = \frac{1}{\left(\omega/\omega_c)^2k + 1\right)}$$

We need to design a filter that has $k=2$ and $\omega_c = 2\times\pi\times 20\times 10^3 = 125,66371\times 10^3$ rad/s. It will be easier to design the filter for $\omega_c = 1$ then complete the design by subsitution of the actual cut-off frequency afterwards.

We follow the procedure outlined in the notes (see {ref}`unit7.1:butter`).

$$A^2(\omega) = \frac{1}{\omega^4 + 1}$$

which on subsitution of $\omega^2 = -s^2$ gives

$$G(s)G(-s) = \frac{1}{s^4 + 1}$$

The poles of this equation are given by $s = \sqrt[4]{-1}$, that is $s = \sqrt[4]{1\angle 180^\circ}$ which, by De Moivre's theorem, with $n = 4$,

$$\sqrt[4]{1e^{j\pi}} = 1e^{j\left(\frac{\pi + 2k\pi}{4}\right)}$$


Thus $$
\begin{array}{ll}
s_1 = e^{j 3\pi/4} = -\frac{1}{\sqrt{2}} + j\frac{1}{\sqrt{2}} & s_2 = e^{j5\pi/4} = -\frac{1}{\sqrt{2}} - j\frac{1}{\sqrt{2}}\\
s_3 = e^{j 7\pi/4} = +\frac{1}{\sqrt{2}} - j\frac{1}{\sqrt{2}} & s_4 = e^{j9\pi/4} =  +\frac{1}{\sqrt{2}} + j\frac{1}{\sqrt{2}}
\end{array}
$$


We take the left-half plane poles $s_1$ and $s_2$ and

$$H(s) = \frac{K}{\left(s +\frac{1}{\sqrt{2}} + j\frac{1}{\sqrt{2}}\right)\left(s + \frac{1}{\sqrt{2}} + j\frac{1}{\sqrt{2}}\right)} $$

$$H(s) = \frac{K}{s^2 + \sqrt{2}s + 1} $$


The gain $K$ is found from $A^2(0) = 1$, and $H(0) = 1$, so $K=1$ and the prototype Butterworth low-pass filter is 

$$H(s) = \frac{1}{s^2 + \sqrt{2}s + 1}$$


We now convert this to the filter we need by substitution $s = s/\omega_c$

$$H(s) = \frac{1}{\left(\frac{s}{\omega_c}\right)^2 + \sqrt{2}\left(\frac{s}{\omega_c}\right) + 1}$$

from which

$$\frac{\omega_c^2}{s^2 + \sqrt{2}\omega_c s + \omega_c^2} $$


and

$$\frac{15.79\times 10^3}{s^2 + 177.7s + 15.79\times 10^3}$$

We will complete the problem by switching to MATLAB. We first need to determine the pre-warping correction

$$\omega_a = \frac{2}{T_s} \tan\left(\frac{ \omega_c T_s}{2}\right)$$

```matlab
fs = 44.1e2; % sampling frequency
Ts = 1/fs;
wc = 2*pi*20e3
```

```matlab
wa = (2/Ts)*tan(wc*Ts/2)
```

Re calculate Butterworth filter with pre-warped frequency

```matlab
Hs = tf(wa^2,[1 sqrt(2)*wa wa^2])
```

Now find $H(z)$ using the bilinear transformation by substituting

$$s = \frac{2}{Ts} \left(\frac{z-1}{z+1} \right)$$

You should try this algebraicly, but we will cheat

```matlab
Hz = c2d(Hs,Ts,'tustin')
```

From which

$$H(z) = \frac{1.169z^{2} + 2.338 z + 1.169}{z^2 + 2.309z + 1.367}$$


To implement this, we simply convert to negative powers of $z$

$$H(z) = \frac{1.169 + 2.338 z^{-1} + 1.169z^{-2}}{1 + 2.309z^{-1} + 1.367z^{-2}}$$


(sol:ex7.2.4)=
## Solution to Exercise 7.2.4

> A digital filter with cutoff frequency of 100 Hz for a signal sampled at 1 kHz has transfer function 
>
> $$H(z) = \frac{0.6401   -1.1518z^{-1}   + 0.6401z^{-2}}{1	-1.0130 z^{-1}    + 0.4190z^{-2}} $$
>
> The frequency response for this filter (plotted against $f/(f_s/2)$) is shown in {numref}`fig:u72:ex7.2.2`.
>
> a) What type of filter is this?
>
> b) Estimate the band-pass ripple, and stop-band ripple of the filter.
>
> c) Implement the filter as Direct Form Type II digital filter and sketch its block diagram.
>
> d) Use the example of {ref}`u454:code` to give a code implementation of the filter.
>
> e) If the input to this filter is a step function $x[n] = \left\{1,1,1,1,\ldots\right\}$, calculate the first 5 outputs $y[n]$ of the filter.

See: {ref}`u72:ex:4`

----



<!-- #region -->
This is a 2nd-order filter and the ripple is rather non-typical!

a) The gain at high frequency is 0 dB so the filter is high-pass. There is ripple in the pass-band so it is Chebyshev Type II.

b) The stop-band ripple is 10 dB, there is no ripple in the stop-band. Note that it is not clear that the cut-off frequency is 100 Hz!

c) For the sketch, refer to {numref}`fig:u72:4` and note that the coefficients will be: $b_0 = 0.6401$, $b_1 = -1.1518$, $b_3 = 0.6401$, $a_1 = 1.0130$, $a_2 = 0.4190$. Note in particular the signs of the $a$ coefficients. They are negative in the block diagram but positive in the transfer function.

d) To write the code, we need to express the transfer function as a difference equation.

$$H(z) = \frac{Y(z)}{X(z)} = \frac{0.6401   -1.1518z^{-1}   + 0.6401z^{-2}}{1	-1.0130 z^{-1}    + 0.4190z^{-2}} $$

So

$$
\begin{align*}
\left(1	- 1.0130 z^{-1}    + 0.4190z^{-2}\right)Y(z) &= \left(0.6401   -1.1518z^{-1}   + 0.6401z^{-2}\right)X(z) \\
Y(z)	- 1.0130 z^{-1}Y(z)    + 0.4190z^{-2}Y(z) &= 0.6401 X(z)   -1.1518z^{-1}X(z)   + 0.6401z^{-2}X(z) \\
Y(z) &= 0.6401 X(z)   -1.1518z^{-1}X(z)   + 0.6401z^{-2}X(z) + 1.0130 z^{-1}Y(z)    - 0.4190z^{-2}Y(z)
\end{align*}
$$


Taking inverse Z-transform:

$$y[n] = 0.6401 x[n]   -1.1518 x[n-1]   + 0.6401 x[n-2] + 1.0130 y[n-1]    - 0.4190 y[n-2]$$
<!-- #endregion -->

Using the example in {ref}`u454:code` with $T_s = 1/1000 = 0.001$

```c
/* Initialize */
Ts = 0.001; /* more probably some fraction of clock speed */
ynm1 = 0; ynm2 = 0; unm1 = 0; unm2 = 0;
while (true) {
    un = read_adc();
    yn = 0.6401*un + −1.1518*unm1 + 0.6401*unm2 + 1.0130*ynm1 - 0.4190*ynm2;
    write_dac(yn);
    /* store past values */
    ynm2 = ynm1; ynm1 = yn;
    unm2 = unm1; unm1 = un;
    wait(Ts);
}

```


e) The easiest way to complete the problem is to tabulate the data 

| $n$ | $x[n]$ | $0.6401 x[n]$ | $-1.1518 x[n-1]$ | $0.6401 x[n-2]$ | $1.0130 y[n-1] $ | $- 0.4190 y[n-2]$ | $y[n]$ |
|-----|--------|---------------|------------------|-----------------|------------------|-------------------|-------|
| $0$ | $1$    | $0.6401$      | $0$              | $0$             | $0$              | $0$               | $0.6401$ |
| $1$ | $1$    | $0.6401$      | $-1.1518$        | $0$             | $0.6486$         | $0$               | $0.1369$ |
| $2$ | $1$    | $0.6401$      | $-1.1518$        | $0.6401$        | $0.1387$         | $-0.2682$         | $-0.011$ |
| $3$ | $1$    | $0.6401$      | $-1.1518$        | $0.6401$        | $-0.0011$        | $-0.0574$         | $0.0700$ |
| $4$ | $1$    | $0.6401$      | $-1.1518$        | $0.6401$        | $0.0709$         | $0.0004$          | $0.1997$ |

from which $y[n] = \left\{0.6401,0.1369,-0.011,0.0700,0.1997,\dots\right\}$


I find the use of Excel to be a useful tool for confirming such results and the sheet for this one can be downloaded [sol_ex_7_2_3.xlsx](matlab/sol_ex_7_2_3.xlsx).

You can also use MATLAB of course. Here we set up the transfer function:

```matlab
fs = 1000;
Ts = 1/fs
Hz = tf([0.6401,-1.1518,0.6401],[1,-1.0130,0.4190],Ts)
```

Then compute the step response

```matlab
[yn,nTs] = step(Hz);
stem(nTs*1000,yn),grid,title('Step response of filter in Exercise 7.2.3'),xlabel('Time [ms]')
ylabel('y[n]')
```

Confirm the tabulated results

```matlab
yn(1:5)
```
