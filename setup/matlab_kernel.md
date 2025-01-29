---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.16.6
  kernelspec:
    display_name: MKernel
    language: matlab
    name: mkernel
---

Testing the Jupyter Matlab Kernel
============

Interact with Matlab in Notebook the using the [Matlab engine for Python](https://www.mathworks.com/help/matlab/matlab-engine-for-python.html).  All commands are interpreted by Matlab.  Since this is a [MetaKernel](https://github.com/Calysto/metakernel), a standard set of magics are available.  Help on commands is available using the `%help` magic or using `?` with a command.

```matlab
% Use inline SVG graphics
setappdata(0, "MKernel_plot_format", "svg")
```

```matlab
t = linspace(0,6*pi,100);
plot(sin(t))
grid on
hold on
plot(cos(t), 'r')
```

```matlab
%plot -s 200,150
```

```matlab
b = 10*cos(t)+30; plot(b); grid on
```

```matlab
a = [1,2,3]
```

```matlab
b = a + 3;
```

```matlab
disp(b)
```

```matlab
%lsmagic
```

```python
print('Hello, world!')
```

```matlab

```
