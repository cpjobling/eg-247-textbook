#!/bin/zsh

MATLAB_HOME=/Applications/MATLAB_R2024b.app
# Adjust for your mac
EG_247=$HOME/code/src/github.com/cpjobling/eg-247-textbook

# Set up for jupyter with rise and jupyter-book
cd $EG_247
conda deactivate
conda env remove -n matlab-textbook
conda update conda
conda create -n matlab-textbook python=3.12 anaconda
conda init zsh
conda activate matlab-textbook
pip install -U nbclassic # Needed to do slide shows correctly
pip install -U jupyter-book
pip install -U jupytext
pip install rise==5.7.1

# Set up Python-MATLAB bridge and matlab_kernel
# cd $MATLAB_HOME/extern/engines/python
# python setup.py install
pip install matlab-engine==24.2
pip install mkernel

# Add rise
pip install -U rise

# Add ghp-import
pip install -U ghp-import



cd $EG_247

# Save environment and exit eg-247-textbook
conda env export > environment.yml
conda deactivate



