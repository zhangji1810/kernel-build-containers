#!/bin/bash

groups | grep docker
NEED_SUDO=$?

if [ $NEED_SUDO == 1 ]
then
	echo "Hey, we gonna use sudo for running docker"
	SUDO_CMD="sudo"
else
	echo "Hey, you are in docker group, sudo is not needed"
	SUDO_CMD=""
fi

set -e

if [ $# -lt 3 ]
then
	echo "usage: $0 compiler src_dir out_dir [cmd with args]"
	echo "  if cmd is empty, we will start an interactive bash in the container"
	exit 1
fi

COMPILER=$1
echo "Starting \"kernel-build-container:$COMPILER\""

SRC="$2"
echo "Source code directory \"$SRC\" is mounted at \"~/src\""

OUT="$3"
echo "Build output directory \"$OUT\" is mounted at \"~/out\""

shift
shift
shift

if [ $# -gt 0 ]
then
	echo -e "Gonna run \"$@\"\n"
else
	echo -e "Gonna run interactive bash...\n"
fi

# Z for setting SELinux label
$SUDO_CMD docker run -it --rm \
  -v $SRC:/home/$(id -nu)/src:Z \
  -v $OUT:/home/$(id -nu)/out:Z \
  kernel-build-container:$COMPILER "$@"
