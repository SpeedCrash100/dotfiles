# Prepare scripts

The scripts here prepare the system, installs dotter to be specific. 
The scripts are system specific and puts in folder `<ID>` where `<ID>` is ID field from `/etc/os-release` 

There are 2 required files in the folder:
  1. Prepare script `prepare.sh`
  2. Source file `source` with parameters below.

## Parameters to set by `source`

 - `PM` - Package manager command, ex `paru -Syu`
 - `PYTHON` - Python 3 command to use


