
FROM kong:2.1-alpine
MAINTAINER matthew.bednarski@aicomp.com


USER root
RUN apk add --no-cache bash
RUN apk add --no-cache jq
RUN apk add --no-cache python3 && \
    pip3 install --upgrade pip setuptools httpie && \
    rm -r /root/.cache

RUN luarocks install kong-oidc
RUN luarocks install kong-oidc-consumer
RUN luarocks install kong-oidc-auth

# RUN apk add --no-cache build-base
# RUN apk add --no-cache openssl-dev
RUN apk add --no-cache git

USER kong


# FROM kong:2.2.1-alpine

# USER root

# RUN luarocks install kong-oidc-auth
# RUN luarocks install kong-oidc