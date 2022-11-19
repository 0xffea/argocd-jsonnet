FROM argoproj/argocd:v2.5.2

ENV JB_VERSION=XXX

USER root

ADD https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.5.1/jb-linux-amd64 /usr/local/bin/jb
ADD https://github.com/grafana/tanka/releases/download/v0.23.1/tk-linux-amd64 /usr/local/bin/tk

RUN apt-get update && \
    apt-get install -y \
        curl \
        gpg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    curl -OL https://github.com/google/go-jsonnet/releases/download/v0.19.1/go-jsonnet_0.19.1_Linux_x86_64.tar.gz && \
    tar xf go-jsonnet_0.19.1_Linux_x86_64.tar.gz && \
    install jsonnet jsonnetfmt /usr/local/bin

RUN chmod +rx /usr/local/bin/jb /usr/local/bin/tk /usr/local/bin/jsonnet

USER 999
