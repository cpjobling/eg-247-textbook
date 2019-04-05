---
interact_link: content/dft/1/worksheet18.ipynb
title: 'Worksheet 18 The Discrete-time Fourier Transform'
prev_page:
  url: /dt_systems/4/worksheet17
  title: 'Worksheet 17 Models of DT Systems'
next_page:
  url: /dft/2/worksheet19
  title: 'Worksheet 19 The Fast Fourier Transform'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 18

## To accompany Chapter 7.1 The Discrete Fourier Transform

We will step through this worksheet in class. 

You are expected to have at least watched the video presentation of [Chapter 7.1](https://cpjobling.github.io/eg-247-textbook/ddt/1/dft) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. 

If you haven't watch it afterwards!

### List of Abbreviations

* CT -- Continous Time
* DT -- Discrete Time
* DF - Discrete frequency
* DFT -- Discrete (Time) Fourier Transform
* FFT -- Fast Fourier Transform

### Notation

In the following we shall denote a DT signal as $x[n]$ and its discrete frequency function as $X[m]$.

## Z-Transform

Recall that

$$F(z) = \mathcal{Z} f[n] = \sum_{n=0}^{\infty} f[n]z^{-n}.$$

The value of this function on the unit circle in the Z-plane will be

$$F\left(\exp\left({j\omega T}\right)\right) = \sum_{n=0}^{\infty} f[n]\exp\left({-jn \omega T}\right).$$

This is an infinite sum.  So to compute it, we need to truncate it. 

## The Discrete-time Fourier Transform

Let's assume that instead of an infinite number of points, we have $N$ points, equally distributed around the unit circle, then the truncated version will be:

$$X[m] =  \sum_{n=0}^{N-1} x[n]\exp\left({-j2\pi \frac{m n}{N}}\right)$$

where

$$\omega  = \left( {\frac{2\pi}{N}} \right)m$$

and $m = 0,1,2,\ldots, N-1$.

We refer to the equation 

$$X[m] =  \sum_{n=0}^{N-1} x[n]\exp\left({-j2\pi \frac{m n}{N}}\right)$$

as the N-point Discrete-time Fourier Transform (DFT) of $x[n]$.

The inverse DFT is defined as

$$x[n] =  \frac{1}{N} \sum_{m=0}^{N-1} X[m]\exp\left({j2\pi \frac{m n}{N}}\right)$$

for $n = 0,1,2,\ldots, N-1$.

Note the symmetry of the DFT and the Inverse DFT!

In general, the DFT is complex, and thus it can be expressed as

$$X[m] = \Re\left\{X[m]\right\} + \Im\left\{X[m]\right\}$$

for $m = 0,1,2,\ldots,N-1$.

Since

$$\exp\left({-j2\pi \frac{m n}{N}}\right) = \cos\left(2\pi\frac{m n}{N}\right) + j\sin\left(2\pi \frac{m n}{N}\right)$$

the DFT can be expresssed as

$$X[m] =  \sum_{n=0}^{N-1} x[n]\exp\left({-j2\pi \frac{m n}{N}}\right) = \sum_{n=0}^{N-1}x[n]\cos\left(2\pi \frac{m n}{N}\right) + j\sum_{n=0}^{N-1}x[n]\sin\left(2\pi\frac{ m n}{N}\right).$$

For $n=0$ this reduces to 

$$X[m] = x[0].$$

Then the real part of $X[m]$ is

$$\Re \left\{ {X[m]} \right\} = x[0] + \sum\limits_{n = 1}^{N - 1} x [n]\cos \left( 2\pi \frac{mn}{N} \right)\quad {\text{for}}\quad m = 0,1,2, \ldots ,N - 1$$

and the imaginary part is

$$\Im \left\{ {X[m]} \right\} = - \sum\limits_{n = 1}^{N - 1} x [n]\cos \left( 2\pi \frac{mn}{N} \right)\quad {\text{for}}\quad m = 0,1,2, \ldots ,N - 1$$.

Note that the summations are from 1 to $N-1$ because $n=0$ is covered in the real term, and as $x[0]$ is real, it is zero in the corresponding imaginary term.

### In Class Example 1

A discrete time signal is defined by the sequence 

$x[0] = 1$, $x[1] = 2$, $x[2] = 2$, $x[3] = 1$, 
and $x[n]=0$ for all other values of $n$. 

Compute the frequency components $X[m]$.

### Solution 1

* Compute the $N$ point DFT for $\Re\left\{X[m]\right\}$.

<pre style="border: 2px solid blue">



















</pre>

* Compute the four point DFT for $\Im\left\{X[m]\right\}$.

<pre style="border: 2px solid blue">



















</pre>

* Add these together to find $X[m]$.

<pre style="border: 2px solid blue">



















</pre>

### In Class Example 2

Use the inverse DFT to compute the discrete-time sequence $x[n]$ from $X[m]$.

### Solution 2

* Write down the expression $x[n]$ in terms of $X[m]$.

<pre style="border: 2px solid blue">



















</pre>

* Compute $x[0]$ from this result.

<pre style="border: 2px solid blue">



















</pre>

* Repeat for $x[1]$, $x[2]$ and $x[3]$.

<pre style="border: 2px solid blue">



















</pre>

### Simulink model of the DFT



{:.input_area}
```matlab
cd matlab
pwd
```


{:.output .output_stream}
```

ans =

    '/Users/eechris/dev/eg-247-textbook/content/dft/1/matlab'


```

See [dft_ex10_1.slx](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/dft_ex10_1.slx?raw=true)



{:.input_area}
```matlab
dft_ex10_1
```


![Simulink Model of DFT](pictures/dft_10_1.png)

Try inputting your student number.

### MATLAB model of the DFT

Karris Example 10.1. To successfully run this script you will need to download the functions [dft.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/dft.m) and [idft.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/idft.m) and make them available on your `MATLABPATH`.



{:.input_area}
```matlab
xn = [1, 2, 2, 1];
```




{:.input_area}
```matlab
open dft
```




{:.input_area}
```matlab
Xm = dft(xn,4)
```


{:.output .output_stream}
```

Xm =

   6.0000 + 0.0000i  -1.0000 - 1.0000i   0.0000 - 0.0000i  -1.0000 + 1.0000i


```



{:.input_area}
```matlab
open idft
```




{:.input_area}
```matlab
xn = idft(Xm,4)
```


{:.output .output_stream}
```

xn =

   1.0000 - 0.0000i   2.0000 - 0.0000i   2.0000 + 0.0000i   1.0000 + 0.0000i


```

### A useful compact notation

The term

$$\exp\left(\frac{-j2\pi}{N}\right)$$

is a rotating vector where the range $0 <= \theta <= 2\pi$ is divided into $360/N$ equal segments. 

It is convenient to represent this as $W_N$, that is

$$W_N = \exp\left({\frac{-j2\pi}{N}}\right)$$

and consequently, 

$$W_N^{-1} = \exp\left({\frac{j2\pi}{N}}\right).$$

### In Class Example 3

Compute the complex numbers represented by the rotating vector
$W_8$

### Solution 3

* Rewrite $W_8$ in exponential form

<pre style="border: 2px solid blue">









</pre>

* Visualize on unit circle

![Visualization of the function unction $W_8^n$](pictures/circle.png)

* Complete this table

| $n$ | $\theta$        | Real | Imaginary | $W_8^n$ |
|-----|-----------------|------|-----------|--------|
| 0   | 0               | 1    |  0        | 1      |


<pre style="border: 2px solid blue">






















</pre>

Using this notation, the DFT and inverse DFT pairs are represented as:

$$X[m] =  \sum_{n=0}^{N-1} x[n]W_N^{nm}$$ 
and
$$x[n] = \frac{1}{N}\sum_{n=0}^{N-1} X[m]W_N^{-nm}$$ 

### MATLAB implementation of DFT

Using the W notation, it is very easy to write a function to implement the DFT. 

We will demonstrate this in class.

For example, consider [dft.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/dft.m):



{:.input_area}
```matlab
%%file matlab/dft.m
function [ Xm ] = dft( xn, N )
% Computes Discrete Fourier Transform
% -----------------------------------
% [Xm]  = dft(xn, N)
% Xm = DFT coeff. array over 0 <= m <= N-1
% xn = N-point finite-duration sequence
%  N = length of DFT
%
n = [0:1:N-1];          % row vector for n
m = [0:1:N-1];          % row vector for m
WN = exp(-j*2*pi/N);    % Wn factor
nm = n'*m;              % creates an N by N matrix of nm values
WNnm = WN .^ nm;        % DFT matrix
Xm = xn * WNnm;         % row vector of DFT coefficients
```


{:.output .output_stream}
```
Created file '/Users/eechris/dev/eg-247-textbook/content/dft/1/matlab/dft.m'.

```

Similarly for the inverse DFT [idft.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/idft.m):



{:.input_area}
```matlab
%%file matlab/idft.m
function [ xn ] = idft( Xm, N )
% Computes Inverse Discrete Fourier Transform
% -------------------------------------------
% [xn]  = idft(Xm, N)
% xn = N-point sequence over 0 <= n <= N-1
% Xm = DFT coeff. array over 0 <= m <= N-1
%  N = length of DFT
%
n = [0:1:N-1];          % row vector for n
m = [0:1:N-1];          % row vector for m
WN = exp(-j*2*pi/N);    % Wn factor
nm = n'*m;              % creates an N by N matrix of nm values
WNnm = WN .^ (-nm);     % DFT matrix
xn = (Xm * WNnm)/N;     % row vector for IDFT values
```
```


{:.output .output_stream}
```
Created file '/Users/eechris/dev/eg-247-textbook/content/dft/1/matlab/idft.m'.

```

### Notes

In the remainder of these notes, the correspondence between $x[n]$ and $X[m]$ will be written

$$x[n] \Leftrightarrow X[m]$$

In Example 2, we found that, although the DT sequence $x[n]$ was real, the discrete frequency (DF) sequence was complex. However, in most applications we are interested in the magnitude and phase of the DF, that is 

$$|X[m]|$$ 

and 

$$\angle X[m]$$.

### In Class Example 4

Use MATLAB to compute the magnitude of the frequency components of the following DT function:

| $n$ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 
|-----|---|---|---|---|---|---|---|---|---|---|----|----|----|----|----|----|
| $x[n]$ |1.0 |1.5 |2.0 |2.3 |2.7 |3.0 |3.4 |4.1 |4.7 |4.2 |3.5 | 3.6 | 3.2 | 2.9 | 2.5 | 1.8 |

We will compute this in class and make some comments afterwards.



{:.input_area}
```matlab
xn = [ 1, 2, 3, 2.5, 1.5, 0.5,...
    -0.5, -1.5, -2.5, -0.5,...
    0.25, 1.25, 2, 1.5, 1, 0.5];
```




{:.input_area}
```matlab
stem([0:15],xn),xlabel('n'),ylabel('x[n]'),title('Discrete Time Sequence')
```



{:.output .output_png}
![png](../../images/dft/1/worksheet18_48_0.png)





{:.input_area}
```matlab
Xm = dft(xn,16);
```




{:.input_area}
```matlab
stem([0:15],abs(Xm)),xlabel('m'),ylabel('|X[m]|'),title('Discrete Frequency Sequence')
```



{:.output .output_png}
![png](../../images/dft/1/worksheet18_50_0.png)



Points to note: 

* $X[0] = 12$ is the DC component of the DT sequence.
* After the $|X[8]| = 1.4872$ term, the magnitude of the frequency values for the range $9 <= m \le 15$ are the mirror image of the values for the range $0 <= m <= 7$.
* This is not a coincidence, in fact if $x[n]$ is an N-point *real discrete time function*, only $N/2$ of the *frequency components* of $|X[m]|$ *are unique*.

## A summary of the important features of sampling and the DFT

* $N$ is the number of samples in frequency.
* $f_s$ sampling frequency, samples per seconds.
* $T_t$ period of a periodic DT function.
* $t_s$ interval between the $N$ samples in time period $T_t$.
* $f_f$ period of a periodic DF function.
* $F_s$ interval between the $N$ samples in frequency period $T_f$.

The relationships between these quantities are:

$$t_t = \frac{T_t}{N}$$

$$f_s = \frac{1}{t_t}$$

$$t_f = \frac{T_f}{N}$$

##### $$t_t = \frac{1}{T_f}$$

$$f_f = \frac{1}{T_t}$$

We will add these quantities to the results of Example 4 in class.

### Example 4 (continued)

<img src="pictures/repeat.png" />

To reproduce this plot use [repeat.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/repeat.m).

### In Class Example 5

The period of a periodic DT function is 0.125 ms and it is sampled at 1024 equally spaced points. It is assumed that with this number of samples, the sampling theorem is satisfied and thus there will be no aliasing.

1. Compute the interval $t_t$ between samples for the periodic signal 
1. Compute the period $T_f$ of the frequency spectrum in kHz
2. Compute the interval $t_f$ between frequency components in kHz
3. Compute the sampling frequency $f_s$.
4. Compute the Nyquist frequency $f_n$.

### Solution

To be done in class.

*  Compute the interval $t_t$ between samples for the periodic signal 

<pre style="border: 2px solid blue">









</pre>

* Compute the period of the frequency spectrum $T_f$ in kHz

<pre style="border: 2px solid blue">









</pre>

* Compute the interval $t_f$ between frequency components in kHz

<pre style="border: 2px solid blue">









</pre>

* Compute the sampling frequency $f_s$.

<pre style="border: 2px solid blue">









</pre>

* Compute the Nyquist frequency $f_n$.

<pre style="border: 2px solid blue">









</pre>
