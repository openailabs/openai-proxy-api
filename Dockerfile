FROM rust:1.65 as builder

RUN cargo new --bin app
WORKDIR /app
COPY Cargo.toml Cargo.toml
# Dry running build command to make Docker cache layer
RUN cargo build --release
RUN rm src/*.rs

COPY src src
RUN cargo build --release

# Use slim image to place build result
FROM debian:stable-slim
RUN apt-get update && apt-get install -y ca-certificates
COPY --from=builder ./app/target/release/proxy-api .
EXPOSE 3000
CMD ["./proxy-api"]