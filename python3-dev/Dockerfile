FROM steav/base-dev

# Lifted from frovlad/alpine-python3
RUN sudo apk add --no-cache python3 && \
    sudo python3 -m ensurepip && \
    sudo rm -r /usr/lib/python*/ensurepip && \
    sudo pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then sudo ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then sudo ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    sudo rm -r /root/.cache

# Install python packages
COPY packages.txt /tmp/
RUN sudo pip install -r /tmp/packages.txt

# Add in python specific vim settings
COPY .python.vimrc /home/developer/
RUN sed -i '/ADD-LANGUAGE-SPECIFIC-CONFIG-HERE/a source ~/.python.vimrc' /home/developer/.vimrc

