FROM --platform=linux/amd64 golang:1.21.5 AS builder

WORKDIR /app

COPY main.go /app

RUN CGO_ENABLED=0 GOOS=linux go build -o play main.go

FROM --platform=linux/amd64 scratch

WORKDIR /app

COPY --from=builder /app .

ENTRYPOINT [ "./play" ]
