# Этап сборки
FROM golang:1.23.2-alpine AS builder
WORKDIR /app
COPY hw.go .
RUN go build -o hw hw.go

# Этап запуска
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/hw .
EXPOSE 8888
CMD ["./hw"]