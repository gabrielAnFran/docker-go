FROM  golang:1.18.2-alpine3.15 AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o /output/desafio-docker-go

FROM scratch

COPY --from=builder /output/desafio-docker-go /desafio-docker-go

EXPOSE 8080

CMD ["/desafio-docker-go"]