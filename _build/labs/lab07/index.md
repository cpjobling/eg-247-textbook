---
interact_link: content/labs/lab07/index.ipynb
title: 'Optional Lab 7 - Filters'
prev_page:
  url: /labs/lab06/index
  title: 'Lab 6 - Sounds and Sampling'
next_page:
  url: /labs/project/index
  title: 'Project'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Lab 7: Filters

## Preamble

### Other formats

This document is available in [HTML](https://cpjobling.github.io/eg-247-textbook/labs/lab07/index) format for online viewing and as [PDF](https://cpjobling.github.io/eg-247-textbook/labs/lab07/lab07.pdf) for printing.

### Acknowledgements

This lab is based on [Filter Design Using Matlab Demo by David Dorran](http://dadorran.wordpress.com/2013/10/18/filter-design-using-matlab-demo/).

There is a [YouTube video](http://www.youtube.com/watch?v=vfH5r4cKukg&amp;list=PLJ8LTUMGG9U4vAGind2_Bh4TUfgg1y0F4&amp;feature=share&amp;index=2) that illustrates what we are going to be using.

## Aims

This optional lab exercise demonstrates the design and simulation of digital filters.
I is not assessed, but you may find it useful preparation for the project.

## Setup

### Before you start

If you haven't already, create a suitable folder structure on your file-store for your labs. 

I suggest

```
P:\workspace
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

Use folder `p:\workspace\signals-and-systems-lab\lab07` for this lab.

### Preparation

Download the example filter design script <a href="https://github.com/cpjobling/eg-247-textbook/blob/master/portfolio/lab07/filters.m" title="filters.m" target="_blank">filters.m</a> from this repository. Save it to your folder for `lab07`.

Open the script as a MATLAB Live Script and execute the embedded code step-by step and read and understand the commentary.

## Lab Exercise

### Lab Exercise 15: Interactive Filter Design

MATLAB provides a filter design tool with a graphical user interface called `fdatool`.

We want you to use this tool to design and test a low-pass, band-pass and high-pass Butterworth filter with sampling frequency equal to 44.1 kHz. The filter should implement the first, second and third stage in a three-stage graphic equalizer with a low pass filter with a cut-off frequency of 31.5 Hz, a pass-band filter for the middle filter (f<sub>1</sub>  to f<sub>2</sub>) of about one octave and centre-frequency fc equal to 63 hz and a high-pass filter with pass-frequency of 125 Hz.  

The aim of this exercise is to determine the order of the Butterworth filters to be used in your design and the Q factor needed (where  Q = f<sub>c</sub> / (f<sub>2</sub> – f<sub>1</sub>)) for the pass-band filters required to implement the mid-range of your 10-stage graphic equalizer.  

The centre pass-band filter should be designed so that f<sub>2</sub> & f<sub>1</sub> satisfies f<sub>c</sub> = (f<sub>1</sub>f<sub>2</sub>)<sup>1/2</sup>.  Your goal is to find the ∆f value for this filter that achieves a flat frequency response when it is combined with equal weight to the low-pass and high-pass filters.  
