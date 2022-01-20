FROM rustlang/rust:nightly-slim as builder
ARG crate_ver=1.1
WORKDIR /app
RUN cargo install markdown2html-converter --version '~'"$crate_ver" --root /app

FROM debian:buster-slim
WORKDIR /data
ENV PATH="/app/bin:$PATH"
COPY --from=builder /app/bin/markdown2html-converter /app/bin/markdown2html-converter
ENTRYPOINT ["markdown2html-converter"]
CMD []
