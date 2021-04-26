# Table of Z-Transforms

| &nbsp; | f[n]                    | F(z).              | Region of Convergence |
|--------|----------------------------|--------------------|-------------------|
| 1.     |    $\displaystyle{\delta[n]}$ | $\displaystyle{1}$ |
| 2 | $\displaystyle{\delta[n-m]}$ | $\displaystyle{z^{-m}}$ |
| 3 | $\displaystyle{a^nu_0[n]}$ | $\displaystyle{\frac{z}{z-a}}$ | $\mid z \mid > a$ |
| 4 | $\displaystyle{u_0[n]}$ | $\displaystyle{\frac{z}{z-1}}$ | $\mid z \mid > 1$ |
| 5 | $\displaystyle{(e^{-anT_s})u_0[n]}$ | $\displaystyle{\frac{z}{z-e^{-aT_s}}}$ | $\displaystyle{\mid e^{-aT_s}z^{-1} \mid < 1}$ |
| 6 | $\displaystyle{(\cos naT_s)u_0[n]}$ | $\displaystyle{\frac{z^2 - z\cos aT_s}{z^2 -2z\cos aT_s + 1}}$ | ${ \mid z \mid> 1}$ |
| 7 | $\displaystyle{(\sin naT_s)u_0[n]}$ | $\displaystyle{\frac{z\sin aT_s}{z^2 -2z\cos aT_s + 1}}$ | ${\mid z \mid > 1}$ |
| 8 | $\displaystyle{(a^n\cos naT_s)u_0[n]}$ | $\displaystyle{\frac{z^2 - az\cos aT_s}{z^2 -2az\cos aT_s + a^2}}$ | ${\mid z \mid > 1}$ |
| 9 | $\displaystyle{(a^n\sin naT_s)u_0[n]}$ | $\displaystyle{\frac{az\sin aT_s}{z^2 -2az\cos aT_s + a^2}}$ | ${\mid z \mid > 1}$ |
| 10 | $\displaystyle{u_0[n]-u_0[n-m]}$ | $\displaystyle{\frac{z^m-1}{z^{m-1}(z-1)}}$ | |
| 11 | $\displaystyle{nu_0[n]}$ | $\displaystyle{\frac{z}{(z-1)^2}}$ | |
| 12 | $\displaystyle{n^2u_0[n]}$ | $\displaystyle{\frac{z(z+1)}{(z-1)^3}}$ | |
| 13 | $\displaystyle{[n+1]u_0[n]}$ | $\displaystyle{\frac{z^2}{(z-1)^2}}$ | |
| 14 | $\displaystyle{a^n n u_0[n]}$ | $\displaystyle{\frac{az}{(z-a)^2}}$ | |
| 15 | $\displaystyle{a^n n^2 u_0[n]}$ | $\displaystyle{\frac{az(z+a)}{(z-a)^3}}$ | |
| 16 | $\displaystyle{a^n n[n+1] u_0[n]}$ | $\displaystyle{\frac{2az^2}{(z-a)^3}}$ | |

See also: [Wikibooks: Engineering_Tables/Z_Transform_Table](https://en.wikibooks.org/wiki/Engineering_Tables/Z_Transform_Table) and [Z Transform&mdash;WolframMathworld](https://mathworld.wolfram.com/Z-Transform.html) for more complete references.



```python

```
