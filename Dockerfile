FROM python:2.7
Maintainer Brian Sang <sang.bri@gmail.com>

RUN pip install Django==1.10.2
RUN pip install argparse==1.2.1
RUN pip install wsgiref==0.1.2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/baisang/django-polls-example.git .
RUN pip install -r requirements.txt

COPY docker-entrypoint.sh .
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]
