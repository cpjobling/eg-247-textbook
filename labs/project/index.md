---
jupyter:
  jupytext:
    formats: ipynb,md
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

# Project - Design and Implementation of a 10-band Graphic Equaliser


## Aims

The purpose of this project is to build and test a Simulink model of a single stage peaking filter for a ten-stage graphic equalizer. MATLAB can be employed to design the required filters and then Simulink can be used to simulate the graphic equaliser in real time. Most commercial equalisers use either 1/3 octave or 2/3 octave bandpass filters but to keep this from becoming too large we will employ one octave bandpass filters.

These papers: Bohn and Pennington (1987){cite}`bohn87` and Bohn (2008){cite}`bohn2008` may help to set the scene and have information on how to perform the necessary calculations.

We will be using peaking filters as described in Mark Wickert's articles: [Signals and Systems Concepts Used to Design an Audio Graphic Equalizer](https://www.dummies.com/education/science/science-engineering/11-signals-and-systems-concepts-used-to-design-an-audio-graphic-equalizer/?keyword=graphic%20equalizer&index=4&isSearch=1) and [How to Characterize the Peaking Filter for an Audio Graphic Equalizer](https://www.dummies.com/education/science/science-engineering/how-to-characterize-the-peaking-filter-for-an-audio-graphic-equalizer/) from the [Engineering for Dummies](https://www.dummies.com/education/science/science-engineering/) resource.

The filter parameters that you will use will be computed based on your student number and will be unique to you. You *must* use these parameters in your design.

We have provided a worksheet for you in the form of a MATLAB Live Script file [graphic_eq.mlx](https://github.com/cpjobling/eg-247-textbook/blob/master/labs/project/graphic_eq.mlx). This worksheet provides full instructions on how to perform the calculations needed to complete the project and a marking scheme which you can use for self assessment. Once you have completed the calculations and answered the questions in the worksheet, you should build the filter in Simulink and test it using the methods similar to those shown in [Conduct Performance Testing on an Audio Graphic Equalizer](https://www.dummies.com/education/science/science-engineering/conduct-performance-testing-on-an-audio-graphic-equalizer/).

You should submit this worksheet and submit it with your claim and the simulink model with test setup by the deadline which is 4:00 pm on 28th April 2021.

<!-- #region -->
## Assessment criteria

The project is worth 25 marks. Marks will be deducted if your submission violates the specification in any way or if I cannot test your submission because the model is incorrect, the gain settings are incorrect, the music file needed is not provided, etc.


Detailed marking criteria for this and the other labs and the project are given in the linked [Assessment Criteria](https://docs.google.com/spreadsheets/d/1HsyBZp4h71DuIj2ris1nP52JdWaWiaT6UsOwQKGnwzI/edit?usp=sharing) [Google sheet].
<!-- #endregion -->

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
        project
```

Use folder `OneDrive\workspace\signals-and-systems-lab\project` for this project.

You should download the content of the [project folder](https://github.com/cpjobling/eg-247-textbook/tree/master/labs/project) from GitHub into your project workspace. 

### Files Needed

The files you will need for the project are:

* [graphic_eq.mlx](https://github.com/cpjobling/eg-247-textbook/blob/master/labs/project/graphic_eq.mlx) - the worksheet that you need to complete your calculations.
* [personalize.m](https://github.com/cpjobling/eg-247-textbook/blob/master/labs/project/personalize.m) - a function that generates unique values for $f_c$ and $G_\mathrm{dB}$ from a student number. Required by `graphic_eq`.
* [Three_Band_EQ.m](https://github.com/cpjobling/eg-247-textbook/blob/master/labs/project/Three_Band_EQ.m) - a script that can be used to validate filter designs.
* A function [peaking_filter.m](https://github.com/cpjobling/eg-247-textbook/blob/master/labs/project/peaking_filter.m) which `Three_Band_EQ` uses to design graphic equalizer band filters.
* [Three_Band_EQ_Model.slx](https://github.com/cpjobling/eg-247-textbook/blob/master/labs/project/Three_Band_EQ_Model.slx) which uses the results of `Three_Band_EQ` to simulate a three-stage graphic equalizer. You can use this as a testbed for your filter.
* [Three_Band_EQ_Model_2017a.mdl](https://github.com/cpjobling/eg-247-textbook/blob/master/labs/project/Three_Band_EQ_Model_2017a.mdl) is provided for users of versions of MATLAB older than 2020b.
* [msmv2.wav](https://github.com/cpjobling/eg-247-textbook/blob/master/labs/project/msmv2.wav) - a music file sampled at 22.05 kHz - used as a test file in `Three_Band_EQ_model`.



## What to hand in

### Claim

You should complete the labwork self-assessment claim form and declaration and the claim for the marks you think your solution is worth.

### Submission

You should submit the following to the **Project: A Graphic Equalizer** Assignment on Canvas.

1. Your completed version of the Graphic Equalizer calculator script named `graphic_eq_student_number.mlx`.
1. Submit the Simulink model of your graphical equalizer with the values of centre frequency $f_c$ and $G_\mathrm{dB}$ that are unique to you named `graphic_eq_model_student_number.slx`. This model should include the testing harnest simular to that distributed with `Three_Band_EQ_model` and should have been used to test your design.
1. You should include a copy of the music file (sampled at 44.1 kHz) that you used to test your design.

### Deadline

The deadline for claims and submission is **4:00 PM BST, 30th April 2021**


## References

See [Bibliography](/zbib).
