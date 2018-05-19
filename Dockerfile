FROM alpine
LABEL maintainer "@flemay"
RUN apk add --update make zip git curl openssl
CMD [ "make" ]
