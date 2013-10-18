#!/bin/sh
#
ARCH=$(uname -m)

if [ $(which nproc) ] ; then
	CORES=$(nproc)
else
	CORES=1
fi

#Debian 7 (Wheezy): git version 1.7.10.4 and later needs "--no-edit"
unset GIT_OPTS
unset GIT_NOEDIT
LC_ALL=C git help pull | grep -m 1 -e "--no-edit" >/dev/null 2>&1 && GIT_NOEDIT=1

if [ "${GIT_NOEDIT}" ] ; then
	GIT_OPTS="${GIT_OPTS} --no-edit"
fi

config="omap2plus_defconfig"

#linaro_toolchain="arm9_gcc_4_7"
#linaro_toolchain="cortex_gcc_4_6"
#linaro_toolchain="cortex_gcc_4_7"
linaro_toolchain="cortex_gcc_4_8"

#Kernel/Build
KERNEL_REL=3.12
KERNEL_TAG=${KERNEL_REL}-rc5
BUILD=r5

#v3.X-rcX + upto SHA
KERNEL_SHA="04919afb85c8f007b7326c4da5eb61c52e91b9c7"

#git branch
BRANCH="3.12"

BUILDREV=1.0
DISTRO=cross
DEBARCH=armhf
