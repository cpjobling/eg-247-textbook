#!/bin/bash

MATLAB_HOME=/Applications/MATLAB_R2021b.app
EG_247=$HOME/code/src/github.com/cpjobling/eg-247-textbook

# Set up for jupyter with rise and jupyter-book
cd $EG_247
conda delete eg-247-textbook
conda update conda
conda create -n eg-247-textbook python=3.9 anaconda
conda init zsh
conda activate eg-247-textbook
pip install -U jupyter-book
pip install -U jupytext
pip install -U jupyter-book
pip install -U jupytext

# Set up Python-MATLAB bridge and matlab_kernel
cd $MATLAB_HOME/extern/engines/python
python setup.py install
pip install imatlab
python -mimatlab install

cd $EG_247

# Save environment and exit eg-247-textbook
conda env export > environment.ymonda env export > environment.ymll
conda deactivate



