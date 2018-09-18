FROM debian:stretch-slim

# Packages
RUN apt-get update && \
    apt-get install -y  tmux bash git ssh vim curl sudo silversearcher-ag && \
# TODO: Add zsh. Need to work out how best to include the oh_my_zsh config in.
# Create non-root user
    useradd -d /home/developer -s /bin/bash -u 7777 developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "host-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
# Add Vundle
    mkdir -p /home/developer/.vim/bundle/ && \
    git clone https://github.com/VundleVim/Vundle.vim.git /home/developer/.vim/bundle/Vundle.vim && \
# Add colorscheme
    mkdir -p /home/developer/.vim/colors/ && \
    curl https://raw.githubusercontent.com/sonjapeterson/1989.vim/master/colors/1989.vim > /home/developer/.vim/colors/1989.vim

# Give user config for stuff
COPY .shellrc .bashrc .bash_profile .vimrc .tmux.conf .gitconfig .startup.sh /home/developer/
RUN chown -R developer:developer /home/developer/

# Setup to run as the developer user
USER developer
WORKDIR /home/developer
ENV TERM=xterm-256color

# Single quotes are not valid JSON
CMD ["/home/developer/.startup.sh"]

