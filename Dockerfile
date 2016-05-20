FROM golang

RUN \
  apt-get update -y && \
  apt-get install -y \
    mysql-client && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN go get github.com/GoogleCloudPlatform/cloudsql-proxy/cmd/cloud_sql_proxy
