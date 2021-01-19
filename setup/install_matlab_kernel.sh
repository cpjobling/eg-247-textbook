#!/bin/bash

MATLAB_HOME=/Applications/MATLAB_R2020b.app
EG_247=$HOME/code/src/github.com/cpjobling/eg-247-textbook

# Set up for jupyter with rise and jupyter-book
cd $EG_247
conda update conda
conda create -n eg-247-textbook python=3.7 anaconda
conda activate eg-247-textbook
conda install -c conda-forge rise
pip install -U jupyter-book

# Set up Python-MATLAB bridge and matlab_kernel
cd $MATLAB_HOME/extern/engines/python
python setup.py install
pip install imatlab
python -mimatlab install

cd $EG_247

# Save environment and exit eg-247-textbook
conda env export > environment.yml
conda deactivate



