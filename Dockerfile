FROM ubuntu:24.10

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean
