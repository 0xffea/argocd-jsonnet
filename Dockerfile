FROM argoproj/argocd:v2.5.2

ENV JB_VERSION=XXX

USER root

ADD https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.5.1/jb-linux-amd64 /usr/local/bin/jb
ADD https://github.com/grafana/tanka/releases/download/v0.23.1/tk-linux-amd64 /usr/local/bin/tk
ADD https://github.com/google/go-jsonnet/releases/download/v0.19.1/go-jsonnet_0.19.1_Linux_x86_64.tar.gz /usr/local/bin/jsonnet

RUN chmod +x /usr/local/bin/jb /usr/local/bin/tk /usr/local/bin/jsonnet

USER 999
