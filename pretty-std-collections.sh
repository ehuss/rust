#!/bin/bash

# set -e

rustup toolchain install nightly --profile=minimal
rustup default nightly
rustc --version
lldb --version
SRCROOT=$PWD
mkdir -p build/test
cd src/tools/compiletest
SYSROOT=$(rustc --print=sysroot)
env

function runtest()
{
    cargo run -- \
        --compile-lib-path $SYSROOT/lib \
        --run-lib-path $SYSROOT/lib/rustlib/x86_64-apple-darwin/lib \
        --rustc-path $SYSROOT/bin/rustc \
        --src-base $SRCROOT/src/test/debuginfo \
        --build-base $SRCROOT/build/test \
        --stage-id stage1-x86_64-apple-darwin \
        --mode debuginfo \
        --target x86_64-apple-darwin \
        --host x86_64-apple-darwin \
        --host-rustcflags "-Crpath -O -Cdebuginfo=0 -Zunstable-options" \
        --target-rustcflags "-Crpath -O -Cdebuginfo=0 -Zunstable-options" \
        --lldb-python /usr/bin/python3 \
        --lldb-python-dir $(lldb -P) \
        --docck-python /usr/bin/python3 \
        --cc "" \
        --cxx "" \
        --cflags "" \
        --llvm-components "" \
        --android-cross-path "" \
        --ignored \
        pretty-std-collections.rs
}

failed=0
for i in {1..10}
do
    echo run $i
    if ! runtest
    then
        echo "failed $i"
        failed=1
    fi
done
exit $failed
