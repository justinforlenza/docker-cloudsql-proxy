FROM debian:stretch-slim

LABEL maintainer="Syoya, Inc. https://github.com/syoya/docker-cloudsql-proxy"

ENV CLOUDSQL_PROXY_VERSION=v1.13
ENV CLOUDSQL_PROXY_SHA256=8bfffdfb9ad68fa4069491a8fe38d46462236caaf8cc0b7f523ccf782eec5891

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

CMD sh run.sh
