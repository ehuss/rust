#!/bin/bash

set -e

# rustup toolchain install nightly --profile=minimal
# rustup default nightly
rustc --version
lldb --version

./configure --set rust.jemalloc --set llvm.ninja=false
env
for i in {1..100}
do
    echo "run $i"
    ./x.py test --stage=1 src/test/debuginfo/pretty-std-collections.rs --test-args=--ignored
done

# SRCROOT=$PWD
# mkdir -p build/test
# cd src/tools/compiletest
# SYSROOT=$(rustc --print=sysroot)

# for i in {1..100}
# do
#     echo "run $i"
#     cargo run -- \
#         --compile-lib-path $SYSROOT/lib \
#         --run-lib-path $SYSROOT/lib/rustlib/x86_64-apple-darwin/lib \
#         --rustc-path $SYSROOT/bin/rustc \
#         --src-base $SRCROOT/src/test/debuginfo \
#         --build-base $SRCROOT/build/test \
#         --stage-id stage1-x86_64-apple-darwin \
#         --mode debuginfo \
#         --target x86_64-apple-darwin \
#         --host x86_64-apple-darwin \
#         --host-rustcflags "-Crpath -O -Cdebuginfo=0 -Zunstable-options" \
#         --target-rustcflags "-Crpath -O -Cdebuginfo=0 -Zunstable-options" \
#         --lldb-python /usr/bin/python3 \
#         --lldb-python-dir $(lldb -P) \
#         --docck-python /usr/bin/python3 \
#         --cc "" \
#         --cxx "" \
#         --cflags "" \
#         --llvm-components "" \
#         --android-cross-path "" \
#         --ignored \
#         pretty-std-collections.rs
# done
