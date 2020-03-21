#! /bin/bash

# I need to source conda
source ~/anaconda3/bin/activate base

# Find the intersting output in stderr
mycmd='jupyter notebook --nobrowser'
exec 3< <($mycmd 2>&1)
a=$(grep -o -m1 'http://localhost.*' <&3)
echo $a

# Use preferred browser here
wslview "$a"

# This keeps the terminal alive as we get the rest of the output
cat <&3

