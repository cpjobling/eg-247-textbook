---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.2'
      jupytext_version: 1.9.1
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

# Lab 5: Fourier Series


## Preamble

### Associated Class Notes

This lab supports the materials covered in [Chapter 4 Fourier Series](../../fourier_series/index) of the course notes. You may wish to refer to [worksheet 9](../../fourier_series/1/worksheet9) and [worksheet 10](../../fourier_series/2/worksheet10) for additional examples to try. 

### Other formats

This document is available in [HTML](index) format for online viewing and [PDF](https://cpjobling.github.io/eg-247-textbook/labs/lab05/lab05.pdf) for printing.

### Acknowledgements

These examples have been adapted from Chapter 7 of 
<a href="http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416" target="_blank">Stephen Karris, Signals and Systems : With MATLAB Computing and Simulink Modeling (5th Edition)</a>.

The Simulink model used in Lab Exercise 16 was developed by Third Year EEE Student Fahad Alqahtani as part of his Level 3 Project in 2013-2014.


## Aims

To explore Fourier series and the use of the Symbolic Toolkit to compute the Fourier coefficients and to demonstrate the simulation and analysis of Fourier series in Simulink.


## Assessment criteria

This will be a self-assessed exercise.

Up to 2 marks can be claimed if you complete Exercise 9, 1 mark for Exercise 10 and an addition 2 marks for Exercise 11.

Detailed marking criteria for this and the other labs and the project are given in the linked [Assessment Criteria](https://docs.google.com/spreadsheets/d/1HsyBZp4h71DuIj2ris1nP52JdWaWiaT6UsOwQKGnwzI/edit?usp=sharing) [Google sheet].


## Setup

### Before you start

If you haven't already, create a suitable folder structure on your file-store for your labs. 

I suggest

```
OneDrive\workspace
    signals-and-systems-lab
        lab01
        lab02
        lab03
        lab04
        lab05
        :
```

Use folder `OneDrive\workspace\signals-and-systems-lab\lab05` for this lab.

### Preparation

Before we start today's lab you will need to download and install the **Fourier series demo app**, that was demonstrated in class, from Georgia Tech's [Educational Matlab GUIs](https://dspfirst.gatech.edu/matlab) page.

To install, visit the page and scroll down to find the Fourier Series Demo app (see image below)
![Fourier Series Demo App](fsdemo.png)
Right-click on the Blue Button labelled **FourierSeriesDemo** and save to your `lab05` folder. 

Open and run `fseriesdemo/fseriesdemo.m`.

If MATLAB issues a message about the need to change the working directory or add a folder to the MATLAB path. Accept the choice given.

Spend some time playing with the settings and observing the results. We will use this as a check of results of the labs to follow.


## Lab Exercises


### Lab Exercise 9: Computation of the coefficients of the Trig. Fourier Series

In this lab exercise we will review the Fourier series for a square wave with odd and even symmetry before going on to compute and plot the Fourier series for the *triangular* waveform.

We will also explore and confirm the stated results of even-, odd- and half-wave symmetries.

#### Download work files

Download the attached files:

* [TrigFourierSeries.m](https://cpjobling.github.io/eg-247-textbook/labs/lab05/TrigFourierSeries.m)
* [FourierSeries.m](https://cpjobling.github.io/eg-247-textbook/labs/lab05/FourierSeries.m)
* [trig_fseries.m](https://cpjobling.github.io/eg-247-textbook/labs/lab05/trig_fseries.m)

and store them in your `lab05` folder.

#### Part 1

Open the script `trig_fseries.m` as a MATLAB Live Script. Run the script and read through the results. Note that the script calls the `TrigFourierSeries` function, defined in the file `TrigFourierSeries.m`, which in turn calls the `FourierSeries` function, defined in `FourierSeries.m`, to calculate the trigonometric Fourier series for the square wave with odd-symmetry. In other words, it reconstructs the $a_k$ and $b_k$ Coefficients from the exponential Fourier series coefficients $C_k$.

#### Part 2

Save the m-file `trig_fseries.m` as a MATLAB Live Script `ex9_1.mlx`. Change the script so that it computes and plots the trig. Fourier series for the square-wave waveform with even symmetry (Section 7.4.1 in the textbook). 

*Hints*: shift the waveform $\pi/2$ radians to the left by letting $f(t) = f(t + T_0/4)$. This *advances* the waveform by $T_0/4$ s.

In calculating the final plot, subtract $T_0/4$ from $\tau$.

#### Part 3

Copy the script `trig_fseries.m` and save it as a MATLAB Live Script `ex9_2.mlx`. Change the copy so that it computes and plots the trig. Fourier series for the Triangular waveform (Section 7.4.3 in the textbook).

**Note**

Parts 2 and 3 can be added to `trig_fseries` and the whole submitted as a single Live Script file `ex9.mlx` providing that you use section headings to separate the parts and edit/add to the textual commentary to match the exercise descriptions.


### Exercise 10: Simulating Wave Analysis

Download and open the Simulink model [fourier_example.slx](https://cpjobling.github.io/eg-247-textbook/labs/lab05/fourier_example.slx). Examine the settings for the sine terms and compare the amplitudes and frequencies of the settings with the results of running `trig_fseries.m`. Run the simulation and view the reconstructed signal and the spectrum.

#### Part 4

Change the settings so that the Simulink model uses the coefficients from the square-wave even-symmetry result. Simulate and capture the time and spectrum plots. Save your model as `ex10_1.slx`.

*Hint*: Be careful to evaluate which set of coefficients are present in the Fourier series. Are they $a_k$ or $b_k$? What do you need to change in the sine wave generators to get the right results? 

#### Part 5

Change the settings so that the Simulink model uses the coefficients from the triangular wave result. Simulate and capture the time and spectrum plots. Save your model as `ex10_2.slx`.

<!-- #region -->
### Lab Exercise 11: Computation of the coefficients of Exponential Fourier Series

In this lab exercise we will review the Fourier series for a square wave with odd and even symmetry before going on to compute and plot the Fourier series for the `triangular` waveform.

We will also explore and confirm the stated results of even-, odd- and half-wave symmetries.

#### Before you Start

Download the attached file:

* [exp_fseries.m](https://cpjobling.github.io/eg-247-textbook/labs/lab05/exp_fseries.m)

#### Part 6

Open the script `exp_fseries.m` as a Live Script, run it and examine the results. Note that the script calls the `FourierSeries` function defined in `TrigFourierSeries.m` to calculate the exponential Fourier series for the square wave with odd-symmetry.

#### Part 7

Copy the script `exp_fseries.m` and save it as `ex11_1`. Change the copy so that it computes and plots the exponential Fourier series for the square-wave waveform with even symmetry (Section 7.4.1 in the textbook). *Hint*: Use the same definition of f(t) that you used in Exercise 9.

#### Part 8

The Simulink model plots the *Power Spectrum* of the simulated reconstructed signal. To plot the power spectrum of a exponential Fourier series we need to produce a stem plot. Each stem in the power spectrum is computed using $C_k C_k^*$ (see **Parseval's Theorem** in the notes). In MATLAB this would be:

```matlab
stem(k,C(k)*conj(C(k)))
```

a. Plot the Power Spectrum of the signal from exponential Fourier series coefficients computed in **Part 7**. Compare the computed power spectrum with the simulated power spectrum. *Note*: expect some differences!

b. Estimate the power in the first $N$-harmonics of the signal using:

$$P = \sum_{k=-N}^{N}{\left|C_k\right|^2}$$

MATLAB:

```matlab
P = sum(C.*conj(C))
```

c. Estimate the RMS power in the signal

$$P_{\mathrm{RMS}} = \sqrt{\sum_{k=-N}^{N}\left|C_k\right|^2}$$


MATLAB:

```matlab
Prms = sqrt(sum(C.*conj(C)))
```

d. Estimate the **Total Harmonic Distortion** in the signal

$$\mathrm{THD}\% = 100 \frac{\sqrt{\sum_{k=2}^{N} |C_k|^2}}{\sqrt{|C_1|^2}}$$

MATLAB:

```matlab
C1 = Ck(1); % first harmonic
Charm = Ck(2:length(Ck)); % remaining harmonics
THD = 100 * sqrt(sum(Charm.*conj(Charm)))/sqrt(C1*conj(C1))
```

**Note**

As for Exercise 9, parts 7 and 8 can be added to `exp_fseries` and the whole submitted as a single Live Script file `ex11.mlx`.
<!-- #endregion -->

## What to hand in

### Claim

Up to 2 marks can be claimed if you complete Exercise 9, 1 mark for Exercise 10 and an addition 2 marks Exercise 11.

### Submission

You should submit the following to the **Lab 05: Fourier series** Assignment on Canvas.

1. Complete the labwork self-assessment claim form and declaration.
1. As evidence of completion of Lab Exercise 9, you should upload `ex9_1.mlx` and `ex9_2.mlx` (can be sections in one Live Script `ex9.mlx`).
1. As evidence of completion of Lab Exercise 10, you should upload the Simulink models `ex10_1.slx` and `ex10_2.slx`.
1. As evidence of completion of Lab Exercise 11, you should upload `ex11_1.mlx` and `ex11_2.mlx` (can be sections in one Live Script `ex11.mlx`).

### Deadline

The deadline for claims and submission is **4:00 pm, 24th March 2021**


## Optional Additional Tasks: Review and Change the Code.

A problem with the scripts as provided is that the limits on the integrals are set in the range $[0, T]$. It would be convenient if this could be changed, for example when computing FS for even signals, the limits could be adjusted to $[-T/2,T/2]$. 

In MATLAB we can achieve this by adding extra arguments to the function definition. 

### Part 9

Examine the code for the `FourierSeries` function that is defined in `FourierSeries.m`. Adapt the function definition so that the user can define the range of the Fourier Series integral. If you succeed, use the modified function to compute the Fourier series of the triangular wave form by exploiting half-wave symmetry. Save the script that does this as `ex11_3`.

### Part 10

Examine the code that is defined in `TrigFourierSeries`. Note that it calls `FourierSeries` then computes `ak` and `bk` from the `Ck` coefficients. Why did I do that do you think? 

If you made the suggested change to `FourierSeries`, provide compatible changes to your copy of `TrigFourierSeries`. Test it on a square wave with even symmetry (Lab 9 Part 2). Save the resulting calling script as `ex9_3`.

Compute the FS of the half-wave rectified cosine function. Save the resulting calling script as `ex11_4`.
