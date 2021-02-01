#!/bin/bash


export ANDROID_MAJOR_VERSION=q

TOOLCHAIN_PATH=~/kernel/toolchain

PATH="$TOOLCHAIN_PATH/clang/bin:$TOOLCHAIN_PATH/aarch64-linux-android-4.9/bin:$TOOLCHAIN_PATH/arm-linux-androideabi-4.9/bin:${PATH}"

make ARCH=arm64 exynos9810-star2lte_defconfig
        
make -j64 \
        ARCH="arm64" \
        CC="ccache clang" \
        CLANG_TRIPLE="aarch64-linux-gnu-" \
        CROSS_COMPILE="aarch64-linux-android-" \
        CROSS_COMPILE_ARM32="arm-linux-androideabi-"
		
cp ~/kernel/s92.5/arch/arm64/boot/Image ~/s9/split_img/boot.img-zImage
