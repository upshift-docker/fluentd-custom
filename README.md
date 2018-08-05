# Fluentd server

Docker image for fluentd server with custom plugins.

## Usage

This image does not include configuration. Configuration file should be mounted using a docker volume.

Start the container:

```console
# docker run -d --name fluentd \
  -v /path/to/fluent.conf:/fluentd/etc/fluent.conf \
  -p 24224:24224 \
  upshift/fluentd-custom
```

