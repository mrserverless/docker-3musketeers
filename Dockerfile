FROM python:alpine
LABEL maintainer "@flemay"
RUN apk add --update make zip git curl
RUN pip install cookiecutter
CMD [ "make" ]
