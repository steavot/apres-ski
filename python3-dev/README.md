# Python3 development environment

Image name: `steav/python3-dev`

## Installation & Operation

See process for [base-dev](../base-dev/README.md), replaceing the image name.

## Key features

* python3.6
* Packages installed:
  * ipython
  * mypy #Install not working
  * bandit
* python specific vim setup #currently nothing

To keep the image as small as possible, ~130MB, only packages required for in-editor linting are included by default. More packages are listed in `extra_packages.txt` to be installed with command `sudo pip install -r ~/extra_packages.txt`

