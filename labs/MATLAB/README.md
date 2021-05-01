# MATLAB resources

The scripts and functions in this folder are utility functions used in the matlab examples. You should download the contents and add the folder to your MATLAB path.

```
path(path,'path_to_eg-247-resources')
```

## Windows

If you have downloaded the EG-247 lab portfolio to `C:\Users\Me\Documents\MATLAB\Workspace\eg-247\labs`
add the `MATLAB` folder like this.

```
cd('C:\Users\Me\Documents\MATLAB\Workspace\eg-247\labs')
addpath([pwd,'\MATLAB'])
```

## Mac/Unix 

If you have downloaded the EG-247 lab portfolio to `/Users/Me/Documents/MATLAB/Workspace/eg-247/labs`
add the `MATLAB` folder like this.

```
cd('/Users/Me/Documents/MATLAB/Workspace/eg-247/labs')
addpath([pwd,'/MATLAB'])
```

## Startup

You can make these changes automatic if you add these commands to the startup.m file. See
[startup](https://uk.mathworks.com/help/matlab/ref/startup.html) in the MATLAB documentation.


