#!/bin/zsh

MATLAB_HOME=/Applications/MATLAB_R2022b.app
EG_247=$HOME/code/src/github.com/cpjobling/eg-247-textbook

# Set up for jupyter with rise and jupyter-book
cd $EG_247
conda deactivate
conda env remove -n eg-247-textbook
conda update conda
conda create -n eg-247-textbook python=3.9 anaconda
conda init zsh
conda activate eg-247-textbook
pip install -U jupyter-book
pip install -U jupytext

# Set up Python-MATLAB bridge and matlab_kernel
cd $MATLAB_HOME/extern/engines/python
python setup.py install
pip install matlab_kernel
python -m matlab_kernel install --user

cd $EG_247

# Save environment and exit eg-247-textbook
conda env export > environment.yml
conda deactivate



