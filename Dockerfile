FROM golang:1.13.3-alpine

WORKDIR $GOPATH/github.com/fenggolang/go-mod-demo
#RUN go get -d -v ./...
#RUN go install -v ./...
COPY vendor vendor
COPY . .

RUN go build -o main main.go
RUN ls -l ./

CMD ["go-mod-demo"]