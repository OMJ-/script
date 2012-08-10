#!/bin/bash

BUILD_ROOT=`pwd`

make clean

. build/envsetup.sh

lunch cm_$1-userdebug

export USE_CCACHE=1

if [ $1 = "d2vzw" ]; then
export USE_KEXEC=1
echo "using kexec"
fi

time make bacon -j8

# Remove build from earlier in the same day if one exists
rm ~/Dropbox/Public/JB/$1/cm-10-$(date +%Y%m%d)-UNOFFICIAL-$1.zip

# Copy to dropbox
cp $BUILD_ROOT/out/target/product/$1/cm-10-$(date +%Y%m%d)-UNOFFICIAL-$1.zip ~/Dropbox/Public/JB/$1/cm-10-$(date +%Y%m%d)-UNOFFICIAL-$1.zip

echo "Done"
