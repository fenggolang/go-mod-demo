FROM golang:1.13.3-alpine

WORKDIR $GOPATH/src
COPY . .

RUN go build -o main main.go
RUN ls -l ./

CMD ["go-mod-demo"]