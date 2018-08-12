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
docker run -it --rm -v $PWD:/home/developer/code steav/base-dev
```

If you want to push with git from within the container, run:
```
@@TODO: work this out, ssh sockets
```

### Post startup

The environment runs as the `developer` user.  You may wish to change the ownership of the files in your project.
```
chown -R developer:developer /home/developer/code
```

To setup vim, run `vim` and then `:PluginInstall`.

Your're good to go :)

