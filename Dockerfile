# syntax=docker/dockerfile:1

FROM golang:alpine as build

# Set destination for COPY
WORKDIR /app

COPY . .
# Build

RUN go build  -ldflags "-s -w"  main.go

from  scratch  

WORKDIR /

COPY --from=build  /app /
EXPOSE 8080

CMD [ "/main" ]
#ENTRYPOINT [ "/main" ]