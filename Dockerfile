# syntax=docker/dockerfile:1

FROM golang:1.20

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download


COPY . .

# Build
RUN go build ./cmd/tesla-http-proxy


EXPOSE 443

# Run
CMD [ "./tesla-http-proxy", "-tls-key", "key.pem", "-cert", "cert.pem", "-key-file", "private.pem", "-port", "443", "-host", "0.0.0.0" ]
