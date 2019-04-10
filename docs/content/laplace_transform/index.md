# Laplace Transforms and their Applications

## About the Laplace Transformation

The Laplace Transformation (named after [Pierre-Simon Laplace](http://en.wikipedia.org/wiki/Pierre-Simon_Laplace)) is a useful mathematical tool that is used in many branches of engineering including signals and systems theory, control theory, communications, mechanical engineering, etc. 

Its principle benefits are: 

* it enables us to represent differential equations that model the behaviour of systems in the time domain as polynomials in $s$ which facilitates their solution

* it converts time convolution (which is how we determine the time-response of a system to a given signal) into a simple multiplication in the $s$ domain

* it allows us to model linear time-invariant (LTI) system components using transfer functions and systems by block diagrams

* block diagram analysis allows us to readily compute system responses to complex signals.

The only downside is that time $t$ is a real value whereas the Laplace transformation operator $s$ is a complex exponential $s = \sigma + j\omega$.

In this section of the course we will cover:

* The Laplace Transformation
* The Inverse Laplace Transform
* Using Laplace Transforms for Circuit Analysis
* Transfer Functions
* Impulse Response and Convolution

There is an optional (non-examined) section on State-space modelling and analysis.