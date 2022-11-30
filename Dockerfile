FROM golang:latest AS builder

WORKDIR /usr/src/app
RUN go mod init fullcycle/fullcycle
COPY ./fullcycle.go ./
RUN go build -v -o /usr/local/bin/app

FROM scratch

WORKDIR /usr/src/app
COPY --from=builder /usr/local/bin/app .

ENTRYPOINT ["./app"]
