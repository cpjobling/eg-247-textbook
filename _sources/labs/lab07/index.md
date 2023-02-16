---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.14.4
  kernelspec:
    display_name: Matlab
    language: matlab
    name: matlab
---

# Optional Lab 8: Filters


## Preamble

### Other formats

This document is available in [HTML](https://cpjobling.github.io/eg-247-textbook/labs/lab07/index) format for online viewing and as [PDF](https://cpjobling.github.io/eg-247-textbook/labs/lab07/lab07.pdf) for printing.

### Acknowledgements

This lab is based on [Filter Design Using Matlab Demo by David Dorran](https://dadorran.wordpress.com/2013/10/18/filter-design-using-matlab-demo/).

There is a [YouTube video](https://www.youtube.com/watch?v=vfH5r4cKukg&amp;list=PLJ8LTUMGG9U4vAGind2_Bh4TUfgg1y0F4&amp;feature=share&amp;index=2) that illustrates what we are going to be using.


## Aims

This optional lab exercise demonstrates the design and simulation of digital filters.
I is not assessed, but you may find it useful preparation for the project.


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
        lab06
        lab07
        :
```

Use folder `OneDrive\workspace\signals-and-systems-lab\lab07` for this lab.

### Preparation

Download the example filter design script [filters.m](https://cpjobling.github.io/eg-247-textbook/labs/lab07/filters.m) from this repository. Save it to your folder for `lab07`.

Open the script as a MATLAB Live Script and execute the embedded code step-by step and read and understand the commentary.


## Lab Exercise

### Lab Exercise 15: Interactive Filter Design

MATLAB provides a filter design tool with a graphical user interface called `fdatool`.

We want you to use this tool to design and test a low-pass, band-pass and high-pass Butterworth filter with sampling frequency equal to 44.1 kHz. The filter should implement the first, second and third stage in a three-stage graphic equalizer with a low pass filter with a cut-off frequency of 31.5 Hz, a pass-band filter for the middle filter ($f_1$  to $f_2$) of about one octave and centre-frequency $f_c$ equal to 63 hz and a high-pass filter with pass-frequency of 125 Hz.  

The aim of this exercise is to determine the order of the Butterworth filters to be used in your design and the Q factor needed (where  $Q = f_c / (f_2 - f_1)$) for the pass-band filters required to implement the mid-range of your 10-stage graphic equalizer.  

The centre pass-band filter should be designed so that $f_1$ and $f_1$ satisfy $f_c = \sqrt{(f_1f_2)}$.  Your goal is to find the $\Delta f$ value for this filter that achieves a flat frequency response when it is combined with equal weight to the low-pass and high-pass filters.  

## What to hand in

### Claim

Up to 3 marks each can be claimed for the design evidenced by a suitable Live Script and filter design file. You should use the `filterDesigner` from the [DSP System Toolbox](https://uk.mathworks.com/products/dsp-system.html?s_tid=srchtitle) and save your designs to disk.

Up to 2 marks can be claimed if you have a Simulink model showing the filters set with a gain of 10, 0 and -10 dB respectively. You can start with the model used in the [Project Descriptor](https://cpjobling.github.io/eg-247-textbook/labs/project/) ([Three_Band_EQ_Model.slx](https://cpjobling.github.io/eg-247-textbook/labs/project/Three_Band_EQ_Model.slx)). 

You may find it useful to use the **Filter Realization Wizard** block (part of the Simulink Collection from the DSP System Toolbox) which combines the `fiterDesigner` with a block that can be used in simulation.

### Submission

You should submit the following to the **Lab 07: Filters** Assignment on Canvas.

1. Complete the labwork self-assessment claim form and declaration.
1. Evidence of your filter design as a m-file or MLX file. 
1. Simulink model of your three part filter with gain settings -10dB, 0dB and 10dB.
1. The audio file that you used for testing.

### Deadline

The deadline for claims and submission is **4:00 pm, 5th April 2022**
