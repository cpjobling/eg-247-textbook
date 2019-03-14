---
redirect_from:
  - "/fourier-transform/4/worksheet15"
interact_link: content/fourier_transform/4/worksheet15.ipynb
title: 'Worksheet 15 Introduction to Filters'
prev_page:
  url: /fourier_transform/3/worksheet14
  title: 'Worksheet 14 Fourier Transforms for Circuit and LTI Systems Analysis'
next_page:
  url: /labs/index
  title: 'Laboratory Exercises'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Worksheet 15

## To accompany Chapter 5.4 Introduction to Filters

We will step through this worksheet in class. 

You are expected to have at least watched the video presentation of [Chapter 5.4](https://cpjobling.github.io/eg-247-textbook/fourier_transform/4/ft4) of the [notes](https://cpjobling.github.io/eg-247-textbook) before coming to class. If you haven't watch it afterwards!

## Frequency Selective Filters

An ideal frequency-selective filter is a system that let's the frequency components of a signal through undistorted while frequency components at other components are completely cut off.

* The range of frequencies which are let through belong to the **pass Band**
* The range of frequencies which are cut-off by the filter are called the **stopband**
* A typical scenario where filtering is needed is when noise $n(t)$ is added to a signal $x(t)$ but that signal has most of its energy outside the bandwidth of a signal.

### Typical filtering problem

<img src="pictures/filter1.png">

### Signal

<img src="pictures/filter2.png">

### Out-of Bandwidth Noise

<img src="pictures/filter3.png">

### Signal plus Noise

<img src="pictures/filter4.png">

### Filtering

<img src="pictures/filter5.png">

### Motivating example

See the video and script in the [OneNote Class Room notebook](https://swanseauniversity.sharepoint.com/sites/EG-247SignalsandSystems2017-2108-UsrGrpcopy-UsrGrp/SiteAssets/EG-247%20Signals%20and%20Systems%202017-2108-UsrGrp%20%5bcopy%5d-UsrGrp%20Notebook/_Content%20Library/Classes/Week%207.one#Motivating%20Example&section-id={681B0954-AC4E-9646-A567-FF06C3696F07}&page-id={E5AD343A-E348-0141-8096-60E0CA201E57}&end).

## Ideal Low-Pass Filter

An ideal low pass filter cuts-off frequencies higher than its *cutoff frequency*, $\omega_c$.

$$H_{\rm{lp}}(\omega ) = \left\{ {\begin{array}{*{20}{c}}
{1,}&{|\omega |{\kern 1pt} \, < {\omega _c}}\\
{0,}&{|\omega |{\kern 1pt} \, \ge {\omega _c}}
\end{array}} \right.$$

### Frequency response

<img src="pictures/ideal_lpf.png">

### Impulse response

$$h_{\rm{lp}}(t) = \frac{\omega _c}{\pi }{\mathop{\rm sinc}\nolimits} \left( \frac{\omega _c}{\pi }t \right)$$

<img src="pictures/sinc.png">

### Filtering is Convolution

The output of an LTI system with impulse response 

$$h(t) \Leftrightarrow H(\omega)$$

subject to an input signal

$$x(t) \Leftrightarrow X(\omega)$$

is given by 

$$y(t) = h(t)*x(t) \Leftrightarrow Y(\omega) = H(\omega)X(\omega)$$

### Issues with the "ideal" filter

This is the step response:

<img src="pictures/step_r.png">

(reproduced from Boulet Fig. 5.23 p. 205)

Ripples in the impulse resonse would be undesireable, and because the impulse response is non-causal it cannot actually be implemented.





## Butterworth low-pass filter

N-th Order Butterworth Filter

$$\left| H_B(\omega ) \right| = \frac{1}{\left(1 + \left(\frac{\omega }{\omega _c}\right)^{2N}\right)^{\frac{1}{2}}}$$

**Remarks**

* DC gain is $$|H_B(j0)|=1$$
* Attenuation at the cut-off frequency is $$|H_B(j\omega_c)|=1/\sqrt{2}$$ for any $N$

More about the Butterworth filter: [Wikipedia Article](http://en.wikipedia.org/wiki/Butterworth_filter)

### Example 5: Second-order BW Filter

The second-order butterworth Filter is defined by is Characteristic Equation (CE):

$$p(s) = s^2 + \omega_c\sqrt{2}s+\omega_c^2 = 0^*$$

Calculate the roots of $p(s)$ (the poles of the filter transfer function) in both Cartesian and polar form.

**Note**: This has the same characteristic as a control system with damping ratio $\zeta = 1/\sqrt{2}$ and $\omega_n = \omega_c$!

#### Solution

<pre style="border: 2px solid blue">
























</pre>

### Example 6

Derive the differential equation relating the input $x(t)$ to output $y(t)$ of the 2nd-Order Butterworth Low-Pass Filter with cutoff frequency $\omega_c$.

#### Solution

<pre style="border: 2px solid blue">
























</pre>

### Example 7

Determine the frequency response $H_B(\omega)=Y(\omega)/X(\omega)$

### Solution

<pre style="border: 2px solid blue">
























</pre>

### Magnitude of frequency response of a 2nd-order Butterworth Filter



{:.input_area}
```matlab
wc = 100;
```


Transfer function



{:.input_area}
```matlab
H = tf(wc^2,[1, wc*sqrt(2), wc^2])
```


Magnitude frequency response



{:.input_area}
```matlab
w = -400:400;
mHlp = 1./(sqrt(1 + (w./wc).^4));
plot(w,mHlp)
grid
ylabel('|H_B(j\omega)|')
title('Magnitude Frequency Response for 2nd-Order LP Butterworth Filter (\omega_c = 100 rad/s)')
xlabel('Radian Frequency \omega [rad/s]')
text(100,0.1,'\omega_c')
text(-100,0.1,'-\omega_c')
hold on
plot([-400,-100,-100,100,100,400],[0,0,1,1,0,0],'r:')
hold off
```


Bode plot



{:.input_area}
```matlab
bode(H)
grid
title('Bode-plot of Butterworth 2nd-Order Butterworth Low Pass Filter')
```


### Example 8

Determine the impulse and step response of a butterworth low-pass filter.

You will find this Fourier transform pair useful:

$$e^{-at}\sin\omega_0 t\;u_0(t) \Leftrightarrow \frac{\omega_0}{(j\omega + a)^2+\omega_0^2}$$

#### Solution

<pre style="border: 2px solid blue">
























</pre>

Impulse response



{:.input_area}
```matlab
impulse(H,0.1)
grid
title('Impulse Response of 2nd-Order Butterworth Low Pass Filter')
```


Step response



{:.input_area}
```matlab
step(H,0.1)
title('Step Response of Butterworth 2nd-Order Butterworth Low Pass Filter')
grid
text(0.008,1,'s_B(t) for \omega_c = 100 rad/s')
```


## High-pass filter

An ideal highpass filter cuts-off frequencies lower than its *cutoff frequency*, $\omega_c$.

$$H_{\rm{hp}}(\omega ) = \left\{ {\begin{array}{*{20}{c}}
{0,}&{|\omega |{\kern 1pt} \, \le {\omega _c}}\\
{1,}&{|\omega |{\kern 1pt} \, > {\omega _c}}
\end{array}} \right.$$

### Frequency response

<img src="pictures/ideal_hpf.png">

### Responses

**Frequency response**

$$H_{\mathrm{hp}}(\omega)=1-H_{\mathrm{lp}}(\omega)$$

**Impulse response**

$$h_{\mathrm{hp}}(t)=\delta(t)-h_{\mathrm{lp}}(t)$$

### Example 9

Determine the frequency response of a 2nd-order butterworth highpass filter

#### Solution

<pre style="border: 2px solid blue">
























</pre>

Magnitude frequency response



{:.input_area}
```matlab
w = -400:400;
plot(w,1-mHlp)
grid
ylabel('|H_B(j\omega)|')
title('Magnitude Frequency Response for 2nd-Order HP Butterworth Filter (\omega_c = 100 rad/s)')
xlabel('Radian Frequency \omega [rad/s]')
text(100,0.9,'\omega_c')
text(-100,0.9,'-\omega_c')
hold on
plot([-400,-100,-100,100,100,400],[0,0,1,1,0,0],'r:')
hold off
```


High-pass filter



{:.input_area}
```matlab
Hhp = 1 - H
bode(Hhp)
grid
title('Bode-plot of Butterworth 2nd-Order Butterworth High Pass Filter')
```


## Band-pass filter

An ideal bandpass filter cuts-off frequencies lower than its first *cutoff frequency* $\omega_{c1}$, and higher than its second *cutoff frequency* $\omega_{c2}$.

$$H_{\rm{bp}}(\omega ) = \left\{ {\begin{array}{*{20}{c}}
{1,}&\omega _{c1} < \,|\omega |\, < \omega _{c2}\\
{0,}&\rm{otherwise}
\end{array}} \right.$$

<img src="pictures/bbpmfr.png">

### Bandpass filter design

A bandpass filter can be obtained by multiplying the frequency responses of a lowpass filter by a highpass filter.

$$H_{\mathrm{bp}}(\omega) = H_{\mathrm{hp}}(\omega)H_{\mathrm{lp}}(\omega)$$

* The highpass filter should have cut-off frequency of $\omega_{c1}$

* The lowpass filter should have cut-off frequency of $\omega_{c2}$

## Solutions

Solutions to Examples 5-9 are captured as a PenCast which you will find attached to the Worked Solutions section of the [Week 7 Section](https://swanseauniversity.sharepoint.com/sites/EG-247SignalsandSystems2017-2108-UsrGrpcopy-UsrGrp/SiteAssets/EG-247%20Signals%20and%20Systems%202017-2108-UsrGrp%20%5bcopy%5d-UsrGrp%20Notebook/_Content%20Library/Classes/Week%207.one#Week%207%20FT%20for%20Circuit%20Analysis%20and%20Filters&section-id={681B0954-AC4E-9646-A567-FF06C3696F07}&page-id={4CC13EA9-40BD-7B4F-B0B6-61B392AC4943}&end) of the OneNote Class Notebook.
