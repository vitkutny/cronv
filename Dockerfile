FROM golang:latest as build

RUN go get github.com/takumakanari/cronv/cronv \
 && go build -o ./cronv github.com/takumakanari/cronv/cronv \
 && mv ./cronv /usr/local/bin

FROM scratch
COPY --from=build /usr/local/bin/cronv ./cronv

ENTRYPOINT ["./cronv"]
