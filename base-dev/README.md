# Base-dev

This environment contains the bare necessities for editing and maintaining code.  vim & git.

Upon running this container, you are dropped into a tmux session, running bash.

## Host Requirements

* docker
* an internet connection

## Installation

```
docker pull steav/base-dev
```

## Usage

To run the image with the current directory mounted in:
```
docker run -it --rm -v $PWD:/src -e RUN_AS=$UID steav/base-dev
```

If you want to push with git from within the container, run:
```
@@TODO: work this out, ssh sockets
```

### Post startup

To setup vim, run `vim` and then `:PluginInstall`.

Your're good to go :)

