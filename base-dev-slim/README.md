# Base-dev-slim - Off-Piste

This environment attempts to replicate the functionality of `base-dev-alpine`
See [README of base-dev-alpine](../base-dev-alpine/README.md) for more info.

This is a slightly easier base environment for toolchains that may prove too much effort to setup on alpine.

## Installation

```
docker pull steav/base-dev-slim
```

## Usage

See [README of base-dev-alpine](../base-dev-alpine/README.md), replacing the container name.

## Issues

### useradd

While `useradd` seems to work just fine to add the `developer` user in `Dockerfile` it doesn't seem to work in `.startup.sh`. "no password entry for host-user".
Currently we can't run this container with `-e RUN_AS=$UID`

### tmux

```
tmux: need UTF-8 locale (LC_CTYPE) but have ANSI_X3.4-1968
```

