FROM python:3.8-alpine@sha256:3996a4b86240b6d41b57055cd7f626cbb15e2baef149b4fd841e04fec7308290

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
