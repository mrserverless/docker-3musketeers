FROM python:alpine
LABEL maintainer "@flemay"
RUN apk add --update make zip
RUN pip install cookiecutter
CMD [ "make" ]
