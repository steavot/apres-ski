# Motivation

I am a very accident prone developer.  Give me a development environment, an before long, I will break it somehow.  Any enviroment I work in better be reproducible and defined in code, or I'll spend a lot of my time trying to recover lost functionality.

At work, we use linux VMs, which are defined in code and provisioned, to fulfil this purpose.

From my experience working in these VMs, I have come to the belief that defining a dev environment as a VM is the wrong level of abstraction.  It's too wide a scope.  It's far easier to manually make changes then it is to update definition files and reprovision.  And every individual dev needs to make some amount of changes from the "out of the box" solution before they're happy to get going.  Therefore we all run environments not fully defined in code.  As then most people's VMs persist for 6 months or so (I tend to break mine in less time), they find considerable setup time, on top of redeploying.  As it's a whole VM being deployed, the multiplicity for things to go wrong (thing you don't even use or care about) is big.

How can we make this more reliable?  Making the problem smaller would help.  Which bits of a dev environment do we need to be reproducible?  For me it's just editor setup and language specific tools (being able to compile and run, linters, debuggers, in-editor plugins for these)... and maybe tmux as well.  I don't really car about what desktop I'm using, or the web browser, or exactly what kernel I'm on, or the distro, etc... As long as it works.

So if I'm willing to restrict my development activities to the terminal (...use vim) docker containers could do all of this... I think.

# Outline

I think the key feature of docker, which will make this work well, is that docker containers are built in bits.  This will allow us to define a base environment, with just the bare essentials needed to edit and manage code.  Language specific environments can build on top of this base adding the specific tool-chain needed.

The docker command needed to run each containers can be documented in this repo, and/or on dockerhub.

This way, environments won't get bloted with things they don't need.  I can imagine having several different of these environments open, while working on a project with multiple languages.

As for specific dependencies of projects:  Projects should atleast have a file defining dependencies.  Better yet they'll have defined a bespoke image to build, run tests and/or deploy in.  Setting up the base-dev to run docker-in-docker will accommodate for this.

As for sharing: I will be putting things in the dev images that are a matter of personal preference ([my favourite colorscheme](https://github.com/sonjapeterson/1989.vim) for example).  Others can use my images as a starting point `FROM ...`, and change things in the dockerfile, or fork this repo and define their preferences instead.

## Structure

* base-dev(from alpine)
  * git
  * tmux
  * zsh
  * vim
    * .vimrc
    * [Vundle](https://github.com/VundleVim/Vundle.vim)
    * colorschemes
    * generic plugins
      * [vim-sensible](https://github.com/tpope/vim-sensible)
      * [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
      * etc...
    * ide style plugins
      * [ctrl-p](https://github.com/ctrlpvim/ctrlp.vim)
      * [etc...](http://vim.wikia.com/wiki/Use_Vim_like_an_IDE)

* bash-dev(from base-dev)
  * bash (alpine just has sh)
  * shellcheck
  * shellcheck integration into vim.

* python3-dev(from base-dev)
  * python3.7 and pip3 (largely following the example of [python3.7-alpine](https://github.com/docker-library/python/blob/c5afee6efc8512af143b960d82b938bde623943f/3.7/alpine3.8/Dockerfile))
  * commonly used packages
    * requests
    * pyyaml
    * etc...
  * linters
    * bandit
    * mypy
    * etc...
  * python specific vim setup (whatever that may be... linter integration)

* haskell,rust,ruby,scala... you get the picture.

# Unknowns... Things I need to google.

* how docker in docker works
* getting tmux running inside a container
* find all the vim plugins needed to have a setup equivalent to an ide.

# Potential problems with this

* [python3.7-alpine](https://github.com/docker-library/python/blob/c5afee6efc8512af143b960d82b938bde623943f/3.7/alpine3.8/Dockerfile) has A LOT of setup in there, between `FROM alpine` and the end of the file.
  * This current model suggest lifting most of that into our python-dev.  That's a lot of stuff to maintain (or more accurately: to sufer from not being maintained).
  * **Maybe alpine is the wrong choice...** Too basic, requiring too much setup.
  * **Maybe this whole design is backwards** and we should instead have the single Dockerfile for the base-dev setup, which, for each language, is edited by a script to include the language specific chunk, including a `FROM $LANGUAGE-alpine`.
  * Maybe [python3.7-alpine](https://github.com/docker-library/python/blob/c5afee6efc8512af143b960d82b938bde623943f/3.7/alpine3.8/Dockerfile) is a bad example. [bash-alpine](https://hub.docker.com/r/frolvlad/alpine-bash/~/dockerfile/) and [rust-alpine](https://hub.docker.com/r/frolvlad/alpine-rust/~/dockerfile/) are each just one line Dockerfiles.
* alpine's tooling being too basic.
  * maybe bash, and some more general tooling, missing from alpine, should be setup in base-dev, so we don't need to worry about bash-dev... It's not like bash is a language anyone should be doing any serious development in...
* not all packages available through alpine's `apk`.
  * I don't know about this one.  Maybe it's OK.

So all these appear to be centred around my choice of alpine as a distro.  I want alpine because **it's so lightweight**.  That's in keeping with what I'm trying to do here.  Maybe we can find a better alternative that's less faff, for only a small increase in image size, maybe not.

