FROM golang:1.22.5 AS builder

WORKDIR /app
COPY . .

# Compilar o programa Go
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch

COPY --from=builder /app/main /main

CMD ["/main"]
