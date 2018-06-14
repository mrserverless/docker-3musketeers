FROM docker
LABEL maintainer "@flemay"
RUN apk add --update make zip git curl openssl py-pip bash
RUN pip install --upgrade pip docker-compose
CMD [ "make" ]