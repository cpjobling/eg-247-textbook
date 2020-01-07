#!/bin/bash

MATLAB_HOME=/Applications/MATLAB_R2019a.app
EG_247=$HOME/dev/eg-247-textbook

cd $EG_247
conda create -n eg-247-textbook python=3.7 anaconda
conda activate eg-247-textbook

conda install -c conda-forge rise

cd $MATLAB_HOME%\extern\engines\python
python setup.py install

cd $EG_247
pip instal matlab_kernel

