FROM python:3.7-alpine@sha256:74ea90a9941a11a313e3f706fb55fafc218c5c9db6005104338187c215dfdacb

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
