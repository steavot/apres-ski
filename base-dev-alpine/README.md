# Base-dev-apline

This alpine environment contains the bare necessities for editing and maintaining code.  vim & git basically.

Upon running this container, you are dropped into a tmux session, running bash.

## Host Requirements

* docker
* an internet connection

## Installation

```
docker pull steav/base-dev-alpine
```

## Usage

To run the image with the current directory mounted in:
```
docker run -it --rm -v $PWD:/src -e RUN_AS=$UID steav/base-dev-alpine
```

If you want to push with git from within the container, run:
```
@@TODO: work this out, ssh sockets
```

### Post startup

To setup vim, run `vim` and then `:PluginInstall`.

Your're good to go :)

