FROM golang:1.13.3-alpine

WORKDIR $GOPATH/src
COPY . .
RUN go build -o $GOPATH/bin/main main.go

EXPOSE 8080

WORKDIR $GOPATH

CMD bin/main