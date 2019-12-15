FROM fluent/fluentd:edge

LABEL maintainer="docker-remove@upshift.fr"

USER root

RUN set -eux; \
	# install build dependencies
	apk add --no-cache --virtual .build-deps \
		build-base \
		ruby-dev \
	; \
	# cutomize following instruction as you wish
	gem install \
		fluent-plugin-grafana-loki \
		fluent-plugin-influxdb \
		fluent-plugin-systemd \
	; \
	gem sources --clear-all \
	; \
	apk del .build-deps \
	; \
	rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

USER fluent

