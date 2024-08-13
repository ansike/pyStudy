# pull official base image
FROM python:3.12.4
# FROM python:3.12.4-alpine3.19

LABEL maintainer damon

# RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
# RUN pip install  -i  https://pypi.python.org/simple/  -r requirements.txt

# for entry point
RUN chmod +x /app/docker-entrypoint.sh