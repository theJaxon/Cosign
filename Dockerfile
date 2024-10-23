FROM --platform=linux/arm64 ubuntu:24.10

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean
