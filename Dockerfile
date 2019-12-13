FROM rust:1.39 AS builder

WORKDIR /usr/src/myapp
COPY . .

RUN rustup target install x86_64-unknown-linux-musl && \
  cargo build --release --target=x86_64-unknown-linux-musl

# all the hax
FROM scratch   

COPY --from=builder /usr/src/myapp/target/x86_64-unknown-linux-musl/release/tokio-chat /app

CMD ["./app"]