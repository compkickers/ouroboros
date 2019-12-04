FROM pyouroboros/ouroboros

LABEL sh.demyx.image demyx/ouroboros
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Set default environment variables
ENV TZ=America/Los_Angeles
ENV DOCKER_SOCKETS=tcp://demyx_socket:2375

# Create demyx user and install tzdata
RUN set -ex; \
    addgroup -g 1000 -S demyx; \
    adduser -u 1000 -D -S -G demyx demyx; \
    apk add --no-cache --update tzdata

# Lockdown
RUN set -ex; \
	rm -f /bin/sh; \
	rm -f /bin/ash; \
	rm -f /usr/bin/wget

USER demyx
