FROM golang:1.10-alpine3.7

LABEL maintainer 'Lucas Marques <lucasmarques73@hotmail.com>'

ENV HUGO_VERSION=0.47

RUN apk --no-cache add \
    curl \
    git \
    && curl -SL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    -o /tmp/hugo.tar.gz \
    && tar -xzf /tmp/hugo.tar.gz -C /tmp \
    && apk del curl \
    && mv /tmp/hugo /usr/local/bin/ \
    && rm -rf /tmp/*

WORKDIR /var/www/html/blog

EXPOSE 1313

# CMD hugo server --bind 0.0.0.0 \
#     --navigateToChanged \
#     --templateMetrics \
#     --buildDrafts