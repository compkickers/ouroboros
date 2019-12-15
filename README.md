# ouroboros
[![Build Status](https://img.shields.io/travis/demyxco/ouroboros?style=flat)](https://travis-ci.org/demyxco/ouroboros)
[![Docker Pulls](https://img.shields.io/docker/pulls/demyx/ouroboros?style=flat&color=blue)](https://hub.docker.com/r/demyx/ouroboros)
[![Architecture](https://img.shields.io/badge/linux-amd64-important?style=flat&color=blue)](https://hub.docker.com/r/demyx/ouroboros)
[![Alpine](https://img.shields.io/badge/alpine-3.9.2-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/ouroboros)
[![Ouroboros](https://img.shields.io/badge/ouroboros-1.4.3-informational?style=flat&color=blue)](https://hub.docker.com/r/demyx/ouroboros)
[![Buy Me A Coffee](https://img.shields.io/badge/buy_me_coffee-$5-informational?style=flat&color=blue)](https://www.buymeacoffee.com/VXqkQK5tb)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)
[![Become a Patron!](https://img.shields.io/badge/become%20a%20patron-$5-informational?style=flat&color=blue)](https://www.patreon.com/bePatron?u=23406156)

Non-root Docker image running Alpine Linux and Ouroboros. [Ouroboros](https://github.com/pyouroboros/ouroboros) will monitor (all or specified) running docker containers and update them to the (latest or tagged) available image in the remote registry. The updated container uses the same tag and parameters that were used when the container was first created such as volume/bind mounts, docker network connections, environment variables, restart policies, entrypoints, commands, etc.

DEMYX | OUROBOROS
--- | ---
USER | demyx
ENTRYPOINT | ["ouroboros"]

## Updates & Support
[![Code Size](https://img.shields.io/github/languages/code-size/demyxco/ouroboros?style=flat&color=blue)](https://github.com/demyxco/ouroboros)
[![Repository Size](https://img.shields.io/github/repo-size/demyxco/ouroboros?style=flat&color=blue)](https://github.com/demyxco/ouroboros)
[![Watches](https://img.shields.io/github/watchers/demyxco/ouroboros?style=flat&color=blue)](https://github.com/demyxco/ouroboros)
[![Stars](https://img.shields.io/github/stars/demyxco/ouroboros?style=flat&color=blue)](https://github.com/demyxco/ouroboros)
[![Forks](https://img.shields.io/github/forks/demyxco/ouroboros?style=flat&color=blue)](https://github.com/demyxco/ouroboros)

* Auto built weekly on Sundays (America/Los_Angeles)
* Rolling release updates
* For support: [#demyx](https://webchat.freenode.net/?channel=#demyx)

## Environment Variables
These are the default environment variables.

```
- DOCKER_SOCKETS=tcp://demyx_socket:2375
- TZ=America/Los_Angeles
```

## Usage
Since a non-root user can't access docker.sock, this image depends on my lockdown docker.sock proxy [container](https://github.com/demyxco/docker-socket-proxy).

```
# Start the docker.sock proxy container first
docker run -d \
--privileged \
--name=demyx_socket \
--network=demyx_socket \
-v /var/run/docker.sock:/var/run/docker.sock \
-e CONTAINERS=1 \
demyx/docker-socket-proxy

# Start ouroboros container
docker run -d \
--name=ouroboros \
--network=demyx_socket \
demyx/ouroboros
```
