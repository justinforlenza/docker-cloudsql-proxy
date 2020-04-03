FROM debian:stretch-slim

ENV CLOUDSQL_PROXY_VERSION=v1.16
ENV CLOUDSQL_PROXY_SHA256=6e4df1e2b62e41b3c01818f75dd46a99cb0e9d385c3b6237281251e28cb38432

RUN \
  apt update \
  && apt install -y curl \
  && curl -fSL -o /usr/local/bin/cloud_sql_proxy "https://storage.googleapis.com/cloudsql-proxy/$CLOUDSQL_PROXY_VERSION/cloud_sql_proxy.linux.amd64" \
  && echo "$CLOUDSQL_PROXY_SHA256 /usr/local/bin/cloud_sql_proxy" | sha256sum -c - \
  && chmod +x /usr/local/bin/cloud_sql_proxy \
  && apt remove -y curl \
  && apt autoremove -y \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  && cloud_sql_proxy -version

WORKDIR /cloudsql-proxy
COPY run.sh .

CMD /bin/bash run.sh
