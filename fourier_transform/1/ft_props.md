# Properties of the Fourier Transform

| No. | **Name** | $f(t)$ | $F(j\omega)$ | **Remarks** |
|----:|----------|--------|--------------|-------------|
| 1.   | Linearity | $a_1f_1(t)+a_2f_2(t)+\cdots+a_nf_n(t)$ | $a_1F_1(j\omega)+a_2F_2(j\omega)+\cdots+a_nF_n(j\omega)$ | Fourier transform is a linear operator. |
| 2.   | Symmetry | $2\pi f(-j\omega)$ | $F(t)$ | |
| 3.  | Time and frequency scaling | $f(\alpha t)$ | $\displaystyle{\frac{1}{\lvert\alpha\rvert}F\left(j\frac{\omega}{\alpha}\right)}$ | time compression is frequency expansion and *vice versa* |
| 4.  | Time shifting | $\displaystyle{f(t-t_0)}$ | $\displaystyle{e^{-j\omega t_0}F(j\omega)}$ | A time shift corresponds to a phase shift in frequency domain |
| 5.  | Frequency shifting | $\displaystyle{e^{j\omega_0 t}f(t)}$ | $\displaystyle{F(j\omega-j\omega_0)}$ | Multiplying a signal by a complex exponential results in a frequency shift. |
| 6.  | Time differentiation | $\displaystyle{\frac{d^n}{dt^n}\,f(t)}$ | $\displaystyle{(j\omega)^nF(j\omega)}$ | |
| 7.  | Frequency differentiation | $\displaystyle{(-jt)^n f(t)}$ | $\displaystyle{\frac{d^n}{d\omega^n}F(j\omega)}$ | |
| 8.  | Time integration | $\displaystyle{\int_{-\infty}^{t}f(\tau)d\tau}$ | $\displaystyle{\frac{F(j\omega)}{j\omega}+\pi F(0)\delta(\omega)}$ | |
| 9.  | Conjugation | $\displaystyle{f^*(t)}$ | $\displaystyle{F^*(-j\omega)}$ | |
| 10. | Time convolution | $\displaystyle{f_1(t)*f_2(t)}$ | $\displaystyle{F_1(j\omega) F_2(j\omega)}$ | Compare with Laplace Transform | |
| 11. | Frequency convolution | $\displaystyle{f_1(t)f_2(t)}$ | $\displaystyle{\frac{1}{2\pi}F_1(j\omega)*F_2(j\omega)}$ | This has application to amplitude modulation as shown in Boulet pp 182&mdash;183. |
| 12. | Area under $f(t)$ | $\displaystyle{\int_{-\infty}^{\infty} f(t)\,dt = F(0)}$ | | Way to calculate DC (or average) value of a signal |
| 13. | Area under $F(j\omega)$ | $\displaystyle{f(0) = \frac{1}{2\pi}\int_{-\infty}^{\infty}F(j\omega)\,d\omega}$ |  |
| 14. | Energy-Density Spectrum | $\displaystyle{E_{[\omega_1,\omega_2]}:=\displaystyle{\frac{1}{2\pi}\int_{\omega_1}^{\omega_2}\lvert F(j\omega)\rvert ^2\,d\omega.}}$ | |
| 15. | Parseval's theorem | $\displaystyle{\int_{-\infty}^{\infty}\lvert f(t)\rvert^2\,dt=\displaystyle{\frac{1}{2\pi}\int_{-\infty}^{\infty}\lvert F(j\omega)\rvert ^2\,d\omega.}}$ | | Definition RMS follows from this |


See also: [Wikibooks: Engineering Tables/Fourier Transform Properties](https://en.wikibooks.org/wiki/Engineering_Tables/Fourier_Transform_Properties) and
[Fourier Transform&mdash;WolframMathworld](https://mathworld.wolfram.com/FourierTransform.html) for more complete references.
