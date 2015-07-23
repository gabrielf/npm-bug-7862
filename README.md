npm-bug-7862
============

This is a small repo exposing this bug: https://github.com/npm/npm/issues/7862#issuecomment-120387186

Using Docker run `docker build .` and watch how npm hangs.

I'm using OS X 10.10.3, docker/boot2docker 1.7.1 and npm@3.0-latest in the docker image.

I've also tried lower version of docker/boot2docker with the same result.

## Up/downgrading boot2docker

When trying out various versions of boot2docker you can get into a state where
the boot2docker ISO version is not the same as the docker/boot2docker version.

The simplest way to control the version of the boot2docker version that I've
found is to do a down/delete/download with specific version and then
init/up/shellinit. Don't forget to ssh to the docker host to make sure it has
the expected version:

```shell
$ boot2docker down && \
    boot2docker delete && \
    boot2docker --iso-url=https://github.com/boot2docker/boot2docker/releases/download/v1.7.1/boot2docker.iso download && \
    boot2docker init && \
    boot2docker up && \
    $(boot2docker shellinit) && \
    boot2docker ssh
```
