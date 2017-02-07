FROM python:2.7
Maintainer Brian Sang <sang.bri@gmail.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/baisang/django-polls-example.git .
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-w", "4", "-b", "0.0.0.0:80", "mysite.wsgi"]
