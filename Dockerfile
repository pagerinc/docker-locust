FROM python:3.7-alpine@sha256:9e1785a8cb1d9271dcf636b77f242f7962104ba7922df70d6e373c10d0dd4d6b

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
