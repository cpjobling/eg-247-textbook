#!/bin/zsh

# Installs the matlab-textbook environment
# Latest version
MATLAB_HOME=/Applications/MATLAB_R2024b.app
# Adjust for your mac
EG_247=$HOME/code/src/github.com/cpjobling/eg-247-textbook

# Set up for jupyter with rise and jupyter-book
cd $EG_247
pyenv deactivate
pyenv vitualenv-delete matlab-textbook
pyenv virtualenv 3.12 matlab-textbook
pyenv activate matlab-textbook
python -m pip install --upgrade pip
pip install -U jupyterlab
pip install -U notebook
pip install -U nbclassic # Needed to do slide shows correctly

# Install scipi packages that setup.md needs
pip install -U scipy matplotlib sympy pytest
pip install -U jupytext


# Set up Python-MATLAB bridge and matlab_kernel
# cd $MATLAB_HOME/extern/engines/python
# python setup.py install
pip install matlab-engine==24.2
pip install git+https://github.com/allefeld/mkernel.git

# Add rise for slides
pip install -U rise==5.7.1

# Add ghp-import
pip install -U ghp-import

# Install book stuff
pip install -U jupyter-book
pip install -U mystmd

echo('test build using `make site`')

cd $EG_247

# Save environment and exit eg-247-textbook
pyenv local matlab-textbook
pyenv virtualenv deactivate
