#! /bin/bash

# Full build and test

set -e # script will fail if any command fails

CALLINGDIR=$(pwd)
BASEDIR=$(dirname "$0")
REPOROOT=$(realpath ${REPOROOT:=${BASEDIR}/..})

cd ${REPOROOT}

echo "Initializing repositories"
git submodule update --init --recursive

echo "Making wbgen2"
cd ${REPOROOT}/tools/wishbone-gen
make

echo "Making oup-wishbone"
cd ${REPOROOT}
make --always-make

echo "Verifying output hash"
tests/verify_output_up_to_date.sh

echo "Done."
cd ${REPOROOT}