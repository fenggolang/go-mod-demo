FROM golang:1.13.3-alpine

RUN go env -w GOPROXY=https://goproxy.cn,direct && \
    go env -w GO111MODULE=on

WORKDIR $GOPATH/src
COPY . .
RUN go build -o $GOPATH/bin/main main.go

EXPOSE 8080

WORKDIR $GOPATH
RUN chown -R 1001:0 $GOPATH
USER 1001
CMD bin/main