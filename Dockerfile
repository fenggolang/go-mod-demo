FROM golang:1.13.3-alpine

WORKDIR $GOPATH/github.com/fenggolang/go-mod-demo
#RUN go get -d -v ./...
#RUN go install -v ./...
COPY vendor vendor
COPY . .
#RUN find / -type f -name build.sh
RUN ls -l /tmp
RUN ls -l $GOPATH/src
RUN echo `pwd`

RUN go build -o main main.go


CMD ["go-mod-demo"]