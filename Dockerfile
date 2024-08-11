FROM python:3.12.4

WORKDIR /app

COPY . /app

RUN ls

RUN cat nginx.conf

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD [ "/bin/sh", './start.sh' ]
# CMD [ "sleep", "3600" ]