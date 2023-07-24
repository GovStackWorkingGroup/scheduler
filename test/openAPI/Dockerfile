FROM python:3.8

COPY requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

COPY . /tests

WORKDIR /tests/
RUN cat /etc/hosts

CMD pytest -k smoke --cucumberjson=/data/results.json /tests
#CMD /bin/bash
