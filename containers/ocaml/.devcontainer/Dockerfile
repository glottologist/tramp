FROM <domain>/development-ubuntu:<version>
ADD README.md .
RUN apt -y install ocaml && \
    mkdir -p /usr/local/bin/opam && \
    cd /usr/local/bin/opam
    
RUN wget https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh && \
    cp install.sh /usr/local/bin/opam/install.sh

RUN sed -i "s/read BINDIR/BINDIR='$DEFAULT_BINDIR'/g" install.sh
RUN sh install.sh

