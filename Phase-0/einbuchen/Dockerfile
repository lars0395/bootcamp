# Build Container
FROM golang:1.9 as builder
ENV PKG github.com/container-bootcamp/einbuchen
ENV VERSION "latest"
RUN go get -u github.com/golang/dep/cmd/dep
WORKDIR /go/src/github.com/container-bootcamp/einbuchen/
COPY . .
RUN dep ensure
RUN GOARCH=amd64 CGO_ENABLED=0 go install -installsuffix 'static' \
-ldflags '-X ${PKG}/pkg/version.VERSION=${VERSION}' ./...

# Run Container
FROM scratch
WORKDIR /root/
COPY --from=builder /go/bin/einbuchen .
ADD resources/ /resources/
ENTRYPOINT ["./einbuchen"]
