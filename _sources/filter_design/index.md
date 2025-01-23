---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.15.2
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

(unit7)=
# Unit 7: Analogue and Digital Filters

In this final section we will present a brief overview of filters and filter design. 

In {ref}`unit7.1` the aim is for you to be able to recognise the frequency response of the commonly used filter types; to be able to discuss the approach taken for analogue model filter design. We will demonstrate the magitude-squared representation used to design the poles and zeros of a low-pass filter and we will examine the Butterworth, Chebyshev and Elliptical filters. We will also demonstrate the analogue low-pass filter design tools, and filter transformation tools provided by MATLAB.

In {ref}`unit7.2` we will discuss the architecture of finite-impulse response (FIR) and infinite-impulse response (IIR) digital filters. We will demonstrate the bilinear transform which is used to convert a continuous-time (analogue) filter to a discete-time filter; and we will demonstrate how such a filter can be represented in Simulink.

We will also demonstrate the filter design tool and filter comparison tools provided by the Signal Processing Toolbox ({cite}`matlab_spt`. We will also look at the options that MATLAB provides for simulating digital signal processing applications in Simulink and using code generation for the implementation of filter designs.

## Scope and Background Reading

This is a very large topic and we will give a fairly high-level overview. Much more detail is available in the references for this Unit which are Chapter 11 of {cite}`karris` and {cite}`matlab_filter_design`.

## Contents

* {ref}`unit7.1`
* {ref}`unit7.2`


```python

```
