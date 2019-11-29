FROM <domain>/development-ubuntu:<version>
RUN curl -sSL https://get.haskellstack.org/ -o install_stack.sh \
    && sh install_stack.sh \
    && curl -sSL https://nixos.org/nix/install -o install_nix.sh \
    && sh install_nix.sh \
    && stack upgrade --binary-only \
    && stack install hlint \
    && stack setup




