# Properties of the Z-Transform

| &nbsp; | Property | Discrete Time Domain | $\displaystyle{\mathcal{Z}}$ Transform |
|---|---------------|----------------------|----------------------------------------|
| 1 | Linearity | $\displaystyle{af_1[n]+bf_2[n]+\cdots}$ | $\displaystyle{aF_1(z)+bF_2(z)+\cdots}$ |
| 2 | Shift of $\displaystyle{x[n]u_0[n]}$ | $\displaystyle{f[n-m]u_0[n-m]}$ | $\displaystyle{z^{-m}F(z)}$ |
| 3 | Left shift | $\displaystyle{f[n-m]}$ | $\displaystyle{z^{-m}F(z)+\sum_{n=0}^{m-1}f[n-m]z^{-n}}$ |
| 4 | Right shift | $\displaystyle{f[n+m]}$ | $\displaystyle{z^{m}F(z)+\sum_{n=-m}^{-1}f[n+m]z^{-n}}$ |
| 5 | Multiplication by $\displaystyle{a^n}$ | $\displaystyle{a^nf[n]}$ | $\displaystyle{F\left(\frac{z}{a}\right)}$ |
| 6 | Multiplication by $\displaystyle{e^{-nsT_s}}$ | $\displaystyle{e^{-nsT_s}f[n]}$ | $\displaystyle{F\left(e^{sT_s}z\right)}$ |
| 7 | Multiplication by $\displaystyle{n}$ | $\displaystyle{nf[n]}$ | $\displaystyle{-z\frac{d}{dz}F(z)}$ |
| 8 | Multiplication by $\displaystyle{n^2}$ | $\displaystyle{n^2f[n]}$ | $\displaystyle{-z\frac{d}{dz}F(z)+z^2\frac{d^2}{dz^2}F(z)}$ |
| 9 | Summation in time | $\displaystyle{\sum_{m=0}^{n}f[m]}$ | $\displaystyle{\frac{z}{z-1}F(z)}$ |
| 10 | Time convolution | $\displaystyle{f_1[n]*f_2[n]}$ | $\displaystyle{F_1(z)F_2(z)}$ |
| 11 | Frequency convolution | $\displaystyle{f_1[n]f_2[n]}$ | $\displaystyle{\frac{1}{j2\pi }\oint {x{F_1}(v){F_2}\left( {\frac{z}{v}} \right)} {v^{ - 1}}dv}$ |
| 12 | Initial value theorem | $\displaystyle{f[0]=\lim_{z\to\infty}F(z)}$ | |
| 13 | Final value theorem| $\displaystyle{\lim_{n\to\infty}f[n]=\lim_{z\to 1}(z-1)F(z)}$ | |

See also: [Wikibooks: Engineering_Tables/Z_Transform_Properties](https://en.wikibooks.org/wiki/Engineering_Tables/Z_Transform_Properties) and [Z Transform&mdash;WolframMathworld](https://mathworld.wolfram.com/Z-Transform.html) for more complete references.

