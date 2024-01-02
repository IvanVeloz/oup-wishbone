#! /bin/bash 
CALLINGDIR=$(pwd)
BASEDIR=$(dirname "$0")
REPOROOT=${REPOROOT:=${BASEDIR}/..} # you can redefine it. Use ./ for current dir.
SOURCE=${REPOROOT}/oup_wbgen2.wb
SOURCESUM=$(sha256sum ${SOURCE} | awk '{print $1}')
BUILDSUM=$(cat ${REPOROOT}/.buildhash | awk '{print $1}')

if [ $SOURCESUM != $BUILDSUM ]; then
    echo "CRITICAL: build is out of date"
    echo "Checksum of the current oup_wbgen2.wb"
    echo "---"
    echo "Checksum of the build oup_wbgen2.wb"
    diff <(echo "${SOURCESUM}") <(echo "${BUILDSUM}")
    exit 1
fi

echo "All output directories seem up to date."
echo "Verification was successful."