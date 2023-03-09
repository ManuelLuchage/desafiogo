FROM golang:alpine AS builder

WORKDIR /usr/src/app
COPY hello/ .

RUN go build -o bin/hello

FROM scratch

COPY --from=builder /usr/src/app/bin/hello /app/bin

ENTRYPOINT ["/app/bin"]