#!/bin/bash
set -e

VERSION=${VERSION:?"VERSION not set"}

cd $(dirname $0)

rm -rf ./build
mkdir -p ./build

cat > ./build/lsb-release << EOF
DISTRIB_ID=${DISTRIB_ID}
DISTRIB_RELEASE=${VERSION}
DISTRIB_DESCRIPTION="${DISTRIB_ID} ${VERSION}"
EOF

# add zfs
ZFS_DIR="/tmp/os-zfs/"
rm -rf ./zfs
mkdir -p ./zfs
cp -rf ${ZFS_DIR}/* ./zfs/
rm -rf ./zfs/usr/lib/modules
