#!/bin/sh

if [ -z "$1" ]; then
	echo >&2 "Usage: $0 <BUILD_DIR> [setup.py arguments]"
	exit 1
fi

cd `dirname $0`
BUILD_DIR="$1"
shift

CUSTOM_CFLAGS="-I.. -I${BUILD_DIR}/auto -O2 -march=native -Wno-cpp -Wno-unused-function -std=c++11"

case $OSTYPE in
	darwin*)
		CUSTOM_CFLAGS="${CUSTOM_CFLAGS} -stdlib=c++"
		;;
esac

CFLAGS="${CUSTOM_CFLAGS}" python3 setup.py "$@"

