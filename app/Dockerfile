# pull official base image
FROM python:3.12.4

LABEL maintainer damon
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
# RUN pip install  -i  https://pypi.python.org/simple/  -r requirements.txt

# for entry point
RUN chmod +x /app/docker-entrypoint.sh