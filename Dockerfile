FROM golang:alpine AS build

RUN mkdir /build
ADD . /build
WORKDIR /build
RUN go build -o main .

FROM alpine:latest
WORKDIR /app
COPY --from=build /build/main /app


EXPOSE 8080
CMD ["./main"]