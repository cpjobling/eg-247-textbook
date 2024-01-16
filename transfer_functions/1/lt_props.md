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

<!-- #region -->
(lxf_props)=
# Laplace Transform Properties


| No. | **Name** | **Time Domain** $f(t)$ | Complex Frequency Domain $F(s)$ |
|----:|----------|--------|--------------|
| 1.   | Linearity | $a_1f_1(t)+a_2f_2(t)+\cdots+a_nf_n(t)$ | $a_1F_1(s)+a_2F_2(s)+\cdots+a_nF_n(s)$ |
| 2.  | Time shifting | $\displaystyle{f(t-a)}u_0(t-a)$ | $\displaystyle{e^{-a s}F(s)}$ 
| 3.  | Frequency shifting | $\displaystyle{e^{-as}f(t)}$ | $\displaystyle{F(s+a)}$ |
| 4.  | Time scaling | $f(a t)$ | $\displaystyle{\frac{1}{a}F\left(\frac{s}{a}\right)}$ |
| 5.  | Time differentiation | $\displaystyle{\frac{d}{dt}\,f(t)}$ | $\displaystyle{sF(s)-f(0^-)}$ |
| 6.  | Frequency differentiation | $\displaystyle{tf(t)}$ | $\displaystyle{-\frac{d}{ds}F(s)}$ |
| 7.  | Time integration | $\displaystyle{\int_{-\infty}^{t}f(\tau)d\tau}$ | $\displaystyle{\frac{F(s)}{s}+ \frac{f(0^-)}{s}}$ |
| 8.  | Frequency integration | $\displaystyle{\frac{f(t)}{t}}$ | $\displaystyle{\int_s^\infty F(\sigma)\,d\sigma}$ |
| 9.  | Time Periodicity | $\displaystyle{f(t + nT)}$ | $\displaystyle{\frac{\int_0^T f(t)e^{-st}\,dt}{1 - e^{-sT}}}$ |
| 10. | Initial value theorem | $\displaystyle{\lim_{t\rightarrow 0} f(t)}$ | $\displaystyle{\lim_{s\rightarrow \infty}sF(s) = f(0^-)}$ |
| 11. | Final value theorem | $\displaystyle{\lim_{t\rightarrow \infty} f(t)}$ | $\displaystyle{\lim_{s\rightarrow 0}sF(s) = f(\infty)}$ |
| 12. | Time convolution | $\displaystyle{f_1(t)*f_2(t)}$ | $\displaystyle{F_1(js) F_2(s)}$ |
| 13. | Frequency convolution | $\displaystyle{f_1(t)f_2(t)}$ | $\displaystyle{\frac{1}{j2\pi}F_1(s)*F_2(s)}$ |

See also: [Wikibooks: Engineering_Tables/Laplace_Transform_Properties](https://en.wikibooks.org/wiki/Engineering_Tables/Laplace_Transform_Properties) and [Laplace Transform&mdash;WolframMathworld](https://mathworld.wolfram.com/LaplaceTransform.html) for more complete references.
<!-- #endregion -->

```python

```
