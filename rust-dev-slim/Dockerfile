FROM steav/base-dev-slim

RUN curl https://sh.rustup.rs -sSf > ~/rustup-init.sh && \
    chmod a+x ~/rustup-init.sh && \
    ~/rustup-init.sh -y

RUN echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.shellrc

# Add in rust specific vim settings
COPY .rust.vimrc /home/developer/
RUN sed -i '/ADD-LANGUAGE-SPECIFIC-CONFIG-HERE/a source ~/.rust.vimrc' /home/developer/.vimrc

