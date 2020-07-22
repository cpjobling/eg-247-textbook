#!/bin/bash

MATLAB_HOME=/Applications/MATLAB_R2019a.app
EG_247=$HOME/dev/eg-247-textbook

# Set up for jupyter with rise and jupyter-book
cd $EG_247
conda update conda
conda create -n eg-247-textbook python=3.7 anaconda
conda activate eg-247-textbook
conda install -c conda-forge rise
pip install jupyter-book

# Set up Python-MATLAB bridge and matlab_kernel
cd $MATLAB_HOME/extern/engines/python
python setup.py install
pip install matlab_kernel
cd $EG_247

# Save environment and exit eg-247-textbook
conda env export > environment.yml
conda deactivate



