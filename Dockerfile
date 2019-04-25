FROM python:3.7-alpine@sha256:ef431c6357f42a8507e01584038d5bda38f01664678e5737d3ba05afcf70133d

LABEL maintainer="Pager Platform Team <containers@pager.com>"

COPY requirements.txt /tmp/

RUN apk add --no-cache --virtual .build-deps \
		gcc \
		make \
	&& apk add --no-cache \
		g++ \
	&& mkdir -p /etc/locust \
	&& pip --no-cache-dir install -r /tmp/requirements.txt \
	&& apk del .build-deps

WORKDIR /etc/locust

EXPOSE 5557 5558 8089

CMD ["locust", "--help"]
