FROM golang:1.14-buster

RUN apt-get update \
    && apt-get install -y \
        git \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN go get -u github.com/pilu/fresh

RUN mkdir -p /go/src/github.com/DataDog/golang-gin-realworld-example-app
WORKDIR /go/src/github.com/DataDog/golang-gin-realworld-example-app
RUN git clone https://github.com/DataDog/golang-gin-realworld-example-app.git .
ARG branch
RUN git checkout ${branch}
RUN rm -Rf /go/src/github.com/DataDog/golang-gin-realworld-example-app/vendor

EXPOSE 8080

COPY ./startup.sh .
CMD [ "./startup.sh" ]
