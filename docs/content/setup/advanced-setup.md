# Advanced Settings

If you want to use Python environments and the command line for installation, please follow these instructions after installing Anaconda.

Not much explanation is given as if you are advanced enough to want to do this, you should be comfortable in following the steps.

## On Windows

Run the **Anaconda Prompt** as an Administrator.

## On Mac and Linux

Open a terminal window.

## Go to eg-247-textbook folder

Create and launch EG-247 Textbook environment:

```shell
conda create -n eg-247-textbook
conda activate eg-247-textbook # source activate eg-247 on mac or unix
```

Install packages:

```shell
conda install jupyter numpy scipy matplotlib sympy pytest
```

Test packages:

Download [soton-test-python-installation.py](https://fangohr.github.io/blog/code/python/soton-test-python-installation.py).

Run:

```shell
python soton-test-python-installation.py
```

Install [Rise](https://damianavila.github.io/RISE/index.html) for active slides:

```shell
conda install -c conda-forge rise
```



## Install MATLAB kernel

This assumes windows.

First install the Python-MATLAB bridge.

```shell
set MATLAB_HOME="C:\Program Files\MATLAB\R2018a"
cd %MATLAB_HOME%\extern\engines\python
python setup.py install
```
Now`MATLAB_KERNEL`

```shell
pip instal matlab_kernel
```

Now when you launch a jupyter notebook

```shell
jupyter notebook introduction\introduction.ipynb
```

you should have a MATLAB kernel as well as a Python 3 kernel and the [Rise](https://damianavila.github.io/RISE/index.html) slide show feature should be available.


## Export environment settings

Export settings:

```shell
conda env export > environment.yml
```

To recreate the EG-247 environment on another machine with Anaconda installed, you
should be able to copy the `environment.yml` file and execute:

```shell
conda env create -f environment.yml
```

## Exit EG-247 Environment

```shell
deactivate # source deactivate on mac or linux
```

