FROM steav/base-dev

# Lifted from frovlad/alpine-python3
RUN sudo apk add --no-cache python3 && \
    sudo python3 -m ensurepip && \
    sudo rm -r /usr/lib/python*/ensurepip && \
    sudo pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then sudo ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then sudo ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    sudo rm -r /root/.cache

# Add gcc and python-dev
RUN sudo apk add build-base python3-dev

# Install python packages
COPY required_packages.txt extra_packages.txt /home/developer/
RUN sudo pip install -r /home/developer/required_packages.txt

# Add in python specific vim settings
COPY .python.vimrc /home/developer/
RUN sed -i '/ADD-LANGUAGE-SPECIFIC-CONFIG-HERE/a source ~/.python.vimrc' /home/developer/.vimrc

