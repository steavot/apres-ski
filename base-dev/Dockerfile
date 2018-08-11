FROM alpine:3.8

# Packages
RUN apk update && apk upgrade && \
    apk add tmux bash git openssh vim curl && \
# TODO: Add zsh. Need to work out how best to include the oh_my_zsb config in.
# TODO: Install shellcheck.  It's not available in apk. We'll have to build it.
#       This might help https://github.com/NLKNguyen/alpine-shellcheck/blob/master/builder/Dockerfile
# Setup non-root user
    adduser -h /home/developer -s /bin/bash -D -u 7777 developer && \
# Add Vundle
    mkdir -p /home/developer/.vim/bundle/ && \
    git clone https://github.com/VundleVim/Vundle.vim.git /home/developer/.vim/bundle/Vundle.vim && \
# Add colorscheme
    mkdir -p /home/developer/.vim/colors/ && \
    curl https://raw.githubusercontent.com/sonjapeterson/1989.vim/master/colors/1989.vim > /home/developer/.vim/colors/1989.vim && \
    chown -R developer:developer /home/developer/.vim

# Give user config for stuff
COPY .shellrc .bashrc .vimrc .tmux.conf /home/developer/
RUN chown developer:developer /home/developer/.shellrc /home/developer/.bashrc /home/developer/.vimrc /home/developer/.tmux.conf

USER developer
WORKDIR /home/developer

# Single quotes are not valid JSON
CMD ["/usr/bin/tmux"]

