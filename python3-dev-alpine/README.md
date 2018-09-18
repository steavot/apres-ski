# Python3 development environment

Image name: `steav/python3-dev`

## Installation & Operation

See process for [base-dev](../base-dev/README.md), replaceing the image name.

## Key features

* python3.6
* Packages installed:
  * ipython
  * mypy
  * pytest
* python specific vim setup

To keep the image as small as possible, only above packages are included by default. More packages that I like are listed in `extra_packages.txt` to be installed with `sudo pip install -r`
