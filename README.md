# kernel-build-containers

This project provides Docker containers for building the Linux kernel with many different compilers.

It's very useful for testing gcc-plugins for the Linux kernel.

Supported gcc versions (can build `x86_64` and `i386`):
 - gcc-4.8
 - gcc-5
 - gcc-6
 - gcc-7
 - gcc-8
 - gcc-9
 - gcc-10

# Usage

Build all containers:

```bash
$ sh build.sh
```

Run a container (with interactive tty):

```bash
$ sh run.sh
usage: run.sh gcc_version

$ sh run.sh 7
```

Remove created docker images:

```bash
$ sh clean.sh
```

# TODO

 - support `arm64` build target
