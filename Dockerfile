FROM docker
LABEL maintainer "@flemay"
RUN apk add --update make zip git curl openssl py-pip bash ruby ruby-dev ruby-json
RUN pip install --upgrade pip docker-compose
RUN gem install --no-ri --no-rdoc docker-sync
CMD [ "make" ]