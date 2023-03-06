# Unit 3: Laplace Transforms and their Applications

## About the Laplace Transformation

The Laplace Transformation (named after [Pierre-Simon Laplace](https://en.wikipedia.org/wiki/Pierre-Simon_Laplace)) is a useful mathematical tool that is used in many branches of engineering including signals and systems theory, control theory, communications, mechanical engineering, etc. 

Its principle benefits are: 

* it enables us to represent differential equations that model the behaviour of systems in the time domain as polynomials in $s$ which facilitates their solution

* it converts time convolution (which is how we determine the time-response of a system to a given signal) into a simple multiplication in the $s$ domain

* it allows us to model linear time-invariant (LTI) system components using transfer functions and systems by block diagrams

* block diagram analysis allows us to readily compute system responses to complex signals.

The only downside is that time $t$ is a real value whereas the Laplace transformation operator $s$ is a complex exponential $s = \sigma + j\omega$.

In this section of the course we will cover:

* [Unit 3.1 The Laplace Transformation](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/laplace.html)
* [Unit 3.2 The Inverse Laplace Transform](https://cpjobling.github.io/eg-247-textbook/laplace_transform/2/inverse_laplace.html)
* [Unit 3.3 Using Laplace Transforms for Circuit Analysis](https://cpjobling.github.io/eg-247-textbook/laplace_transform/3/circuit_analysis.html)
* [Unit 3.4 Transfer Functions](https://cpjobling.github.io/eg-247-textbook/laplace_transform/4/transfer_functions.html)
* [Unit 3.5 Impulse Response and Convolution](https://cpjobling.github.io/eg-247-textbook/laplace_transform/5/convolution.html)

## Colophon

* The source code for this page is [laplace_transform/index.md](https://github.com/cpjobling/eg-247-textbook/blob/master/laplace_transform/index.md).

* You can view the notes for this presentation as a webpage ([HTML](https://cpjobling.github.io/eg-247-textbook/laplace_transform/index.html)). 

* This page is downloadable as a [PDF](https://cpjobling.github.io/eg-247-textbook/laplace_transform/laplace_transform.pdf) file. 
