FROM python:3.8-alpine@sha256:9903b288b6682f5419e0812ec45769aabc55909c6a3a403b681a06bb467350dc

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
