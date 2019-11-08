FROM golang:1.13.3-alpine

RUN echo `pwd`
RUN ls -l ./
WORKDIR $GOPATH/src
RUN echo `pwd`
COPY . .

RUN go build -o main main.go
RUN ls -l ./

CMD ["go-mod-demo"]