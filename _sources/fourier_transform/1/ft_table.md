# Common Fourier Transform Pairs

|     | **Name**                         | $f(t)$                            | $F(\omega)$ | **Remarks**                           |
|-----| ---------------------------------|-----------------------------------|-------------|---------------------------------------|
| 1.  | DC Signal                        | $1$                               | $2\pi\delta(\omega)$ $         | Constant energy at *all* times.       |
| 2.  | Dirac delta                      | $\delta(t)$                       | $1$         | Constant energy at *all* frequencies. |
| 3.  | Time sample                      | $\delta(t-t_0)$                   |  $e^{-j\omega t_0}$ |  
| 4.  | Phase shift                      | $e^{j\omega_0 t}$                 |  $2\pi\delta(\omega - \omega_0)$ |  
| 5.  | *Signum*                         | $\operatorname{sgn} t$          |  $\displaystyle{\frac{2}{j\omega}}$ |  also known as sign function
| 6.  |  Unit step                       | $u_0(t)$                          |  $\displaystyle{\frac{1}{j\omega}+\pi\delta(\omega)}$ |  
| 7.  |  Cosine                          | $\cos \omega_0 t$                 |  $\pi\left[\delta(\omega-\omega_0)+\delta(\omega+\omega_0)\right]$ |  
| 8.  |  Sine                            | $\sin \omega_0 t$                 |  $-j\pi\left[\delta(\omega-\omega_0)-\delta(\omega+\omega_0)\right]$ |  
| 9.  |  Single pole                     | $e^{-at}u_0(t)$                   |  $\displaystyle{\frac{1}{j\omega + a}}$ |  $a \gt 0$ |
| 10.  |  Double pole                     | $te^{-at}u_0(t)$                  |  $\displaystyle{\frac{1}{(j\omega + a)^2}}$ |  $a \gt 0$ |
| 11. |  Complex pole (cosine component) | $e^{-at}\cos \omega_0 t\;u_0(t)$  |  $\displaystyle{\frac{j\omega + a}{(j\omega + a)^2+\omega_0^2}}$ |  $a\gt 0$
| 12. |  Complex pole (sine component)   | $e^{-a t}\sin \omega_0 t\;u_0(t)$ |  $\displaystyle{\frac{\omega}{(j\omega + a)^2+\omega_0^2}}$ |  $a\gt 0$ |

See also: [Wikibooks: Engineering Tables/Fourier Transform Table](https://en.wikibooks.org/wiki/Engineering_Tables/Fourier_Transform_Table) and [Fourier Transform&mdash;WolframMathworld](https://mathworld.wolfram.com/FourierTransform.html) for more complete references.
