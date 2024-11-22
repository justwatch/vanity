FROM golang:1.23-alpine3.18 as builder

ADD . /go/src/github.com/justwatch/vanity
WORKDIR /go/src/github.com/justwatch/vanity

RUN go install

FROM alpine:3.18

COPY --from=builder /go/bin/vanity /usr/local/bin/vanity
CMD [ "/usr/local/bin/vanity" ]
EXPOSE 8080 8081
