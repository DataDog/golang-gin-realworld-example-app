FROM golang:1.14-buster

RUN apt-get update \
    && apt-get install -y \
        git \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /go/src/github.com/DataDog/golang-gin-realworld-example-app
WORKDIR /go/src/github.com/DataDog/golang-gin-realworld-example-app
RUN git clone https://github.com/DataDog/golang-gin-realworld-example-app.git .
ARG branch
RUN git checkout ${branch}

RUN go get gopkg.in/DataDog/dd-trace-go.v1/ddtrace
RUN go get -u github.com/kardianos/govendor
RUN go get -u github.com/pilu/fresh
RUN go get -u golang.org/x/crypto/...
RUN go get github.com/gin-gonic/gin
RUN go get ./...

RUN govendor sync
RUN govendor add +external

EXPOSE 8080

CMD go run hello.go
