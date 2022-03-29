FROM python:3.10.4-alpine3.15
MAINTAINER Simon Peter Green <simonpetergreen@singaren.net.sg>

COPY ./app /usr/src/app

WORKDIR /usr/src/app

ENTRYPOINT ["python", "radsecproxy_log_analysis.py"]
