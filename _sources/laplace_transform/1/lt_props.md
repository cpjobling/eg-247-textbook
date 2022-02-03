<!-- #region -->
# Laplace Transform Properties


| No. | **Name** | **Time Domain** $f(t)$ | Complex Frequency Domain $F(s)$ |
|----:|----------|--------|--------------|
| 1.   | Linearity | $a_1f_1(t)+a_2f_2(t)+\cdots+a_nf_n(t)$ | $a_1F_1(s)+a_2F_2(s)+\cdots+a_nF_n(s)$ |
| 2.  | Time shifting | $\displaystyle{f(t-a)}u_0(t-a)$ | $\displaystyle{e^{-a s}F(s)}$ 
| 3.  | Frequency shifting | $\displaystyle{e^{-as}f(t)}$ | $\displaystyle{F(s+a)}$ |
| 4.  | Time scaling | $f(a t)$ | $\displaystyle{\frac{1}{a}F\left(\frac{s}{a}\right)}$ |
| 5.  | Time differentiation | $\displaystyle{\frac{d}{dt}\,f(t)}$ | $\displaystyle{F(s)-f(0^-)}$ |
| 7.  | Frequency differentiation | $\displaystyle{tf(t)}$ | $\displaystyle{-\frac{d}{ds}F(s)}$ |
| 8.  | Time integration | $\displaystyle{\int_{-\infty}^{t}f(\tau)d\tau}$ | $\displaystyle{\frac{F(s)}{s}+ \frac{F(0^-)}{s}}$ |
| 9.  | Frequency integration | $\displaystyle{\frac{f(t)}{t}}$ | $\displaystyle{\int_s^\infty F(s)\,ds}$ |
| 10.  | Time Periodicity | $\displaystyle{f(t + nT)}$ | $\displaystyle{\frac{\int_0^T f(t)e^{-st}\,dt}{1 - e^{-sT}}}$ |
| 11. | Initial value theorem | $\displaystyle{\lim_{t\rightarrow 0} f(t)}$ | $\displaystyle{\lim_{s\rightarrow \infty}sF(s) = f(0^-)}$ |
| 12. | Final value theorem | $\displaystyle{\lim_{t\rightarrow \infty} f(t)}$ | $\displaystyle{\lim_{s\rightarrow 0}sF(s) = f(\infty)}$ |
| 13. | Time convolution | $\displaystyle{f_1(t)*f_2(t)}$ | $\displaystyle{F_1(js) F_2(s)}$ |
| 14. | Frequency convolution | $\displaystyle{f_1(t)f_2(t)}$ | $\displaystyle{\frac{1}{j2\pi}F_1(s)*F_2(s)}$ |

See also: [Wikibooks: Engineering_Tables/Laplace_Transform_Properties](https://en.wikibooks.org/wiki/Engineering_Tables/Laplace_Transform_Properties) and [Laplace Transform&mdash;WolframMathworld](https://mathworld.wolfram.com/LaplaceTransform.html) for more complete references.
<!-- #endregion -->
