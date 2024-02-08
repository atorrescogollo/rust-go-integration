FROM rust:1.65-alpine AS rustBuilder

COPY . /w
WORKDIR /w/rustlib

RUN apk add --no-cache musl-dev

RUN cargo install --force cbindgen

RUN rustc -g -O --crate-type staticlib src/lib.rs -o lib.a \
    && cbindgen --crate rust --output src/lib.h --lang c


FROM golang:1.22-alpine AS golangBuilder

RUN apk add build-base
COPY --from=rustBuilder /w /w
WORKDIR /w

RUN CGO_ENABLED=1 go build --ldflags '-linkmode external -extldflags=-static' main.go


FROM scratch AS runtime
COPY --from=golangBuilder /w/main /main
ENTRYPOINT [ "/main" ]
