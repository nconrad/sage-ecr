

# docker build -t sagecontinuum/sage-ecr .
# docker run -ti --rm -p 5000:5000 -v `pwd`:/usr/src/app sagecontinuum/sage-ecr /bin/ash

FROM python:3.8-alpine

WORKDIR /usr/src/app

# required for python library mysqlclient
RUN apk add  mariadb-connector-c-dev gcc musl-dev

# required for wsgi
RUN apk add linux-headers

RUN /usr/local/bin/python -m pip install --upgrade pip

COPY  . /usr/src/app
RUN pip install -r requirements.txt

CMD ./ecr_api.py

