FROM fluent/fluentd:latest

LABEL maintainer="docker@upshift.fr"

RUN set -eux; \
	apk add --no-cache \
		tzdata \
	; \
	apk add --no-cache --virtual .build-deps \
		build-base \
		ruby-dev \
	; \
	# cutomize following instruction as you wish
	gem install \
		fluent-plugin-elasticsearch \
		fluent-plugin-rewrite-tag-filter \
		fluent-plugin-grok-parser \
		fluent-plugin-rewrite \
		fluent-plugin-datacounter \
		fluent-plugin-notifier \
		fluent-plugin-parser \
	; \
	gem sources --clear-all \
	; \
	apk del .build-deps \
	; \
	rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

