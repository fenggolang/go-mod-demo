FROM golang:1.13.3-alpine

#WORKDIR /go/src/app
#RUN go get -d -v ./...
#RUN go install -v ./...
RUN find / -type f -name build.sh
RUN ls -l /tmp
RUN ls -l $GOPATH/src
RUN echo `pwd`

RUN go build -o main main.go


CMD ["go-mod-demo"]