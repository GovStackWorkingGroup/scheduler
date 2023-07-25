FROM python:3.8

COPY requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

COPY . /tests

WORKDIR /tests/


CMD pytest -k smoke --cucumberjson=/data/results.json /tests

#CMD pytest -k smoke -s --json-report --json-report-indent=4 --json-report-file=/data/results.json /tests
#CMD /bin/bash
