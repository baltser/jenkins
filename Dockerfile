# Этап сборки
FROM golang:1.23.2-alpine AS builder
WORKDIR /app
COPY hw.go .
RUN go build -o app hw.go

# Этап запуска
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app .
CMD ["./app"]