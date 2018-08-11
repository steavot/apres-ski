FROM alpine:3.8

# Packages
RUN apk update && apk upgrade && \
    apk add tmux bash git openssh vim curl sudo && \
# TODO: Add zsh. Need to work out how best to include the oh_my_zsb config in.
# TODO: Install shellcheck.  It's not available in apk. We'll have to build it.
#       This might help https://github.com/NLKNguyen/alpine-shellcheck/blob/master/builder/Dockerfile
# Create non-root user
    adduser -h /home/developer -s /bin/bash -D -u 7777 developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
# Add Vundle
    mkdir -p /home/developer/.vim/bundle/ && \
    git clone https://github.com/VundleVim/Vundle.vim.git /home/developer/.vim/bundle/Vundle.vim && \
# Add colorscheme
    mkdir -p /home/developer/.vim/colors/ && \
    curl https://raw.githubusercontent.com/sonjapeterson/1989.vim/master/colors/1989.vim > /home/developer/.vim/colors/1989.vim

# Give user config for stuff
COPY .shellrc .bashrc .vimrc .tmux.conf .gitconfig /home/developer/
RUN chown -R developer:developer /home/developer/

# Setup to run as the developer user
USER developer
WORKDIR /home/developer
ENV TERM=xterm-256color

# Single quotes are not valid JSON
CMD ["/usr/bin/tmux"]

