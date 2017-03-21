FROM golang:1.8.0-alpine

RUN apk --update --no-cache add \
      git

RUN go get github.com/GoogleCloudPlatform/cloudsql-proxy/cmd/cloud_sql_proxy
