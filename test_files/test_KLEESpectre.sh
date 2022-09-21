#!/bin/bash

# Setting bash as "if it throws an error, abort right now and don't go on with the script"
# to make sure you're not looking at analysis from previous file binaries version
set -euo pipefail

# Creating temp folder
mkdir -p /tmp/sandbox

# Using kleespectre's klee version instead of official one from the Docker image due to specific patches and enhancements
export PATH="/home/klee/kleespectre/klee/build/bin:$PATH"

# Compile needed library
clang -g -c -emit-llvm ./openssl/crypto/aes/aes_cbc.c -o llvm_libraries/aes_cbc.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/modes/cbc128.c -o llvm_libraries/cbc128.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/aes/aes_core.c -o llvm_libraries/aes_core.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/aes/aes_ctr.c -o llvm_libraries/aes_ctr.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/modes/ctr128.c -o llvm_libraries/ctr128.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/aes/aes_ofb.c -o llvm_libraries/aes_ofb.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/modes/ofb128.c -o llvm_libraries/ofb128.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/aes/aes_ecb.c -o llvm_libraries/aes_ecb.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/aes/aes_misc.c -o llvm_libraries/aes_misc.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include
clang -g -c -emit-llvm ./openssl/crypto/aes/aes_wrap.c -o llvm_libraries/aes_wrap.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include -I/home/klee/shareddir/openssl/crypto  -I/home/klee/shareddir/openssl

# Building toy.c file
clang -g -c -emit-llvm testing_AES_OFB.c -o testing_AES_OFB.bc -target x86_64-pc-linux-gnu -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes -I/home/klee/shareddir/openssl/include 

# Running kleespectre *WITH cache modelling*
klee -link-llvm-lib=llvm_libraries/aes_cbc.bc -link-llvm-lib=llvm_libraries/aes_core.bc -link-llvm-lib=llvm_libraries/aes_ctr.bc -link-llvm-lib=llvm_libraries/aes_ecb.bc -link-llvm-lib=llvm_libraries/aes_misc.bc -link-llvm-lib=llvm_libraries/aes_ofb.bc -link-llvm-lib=llvm_libraries/cbc128.bc -link-llvm-lib=llvm_libraries/ctr128.bc -link-llvm-lib=llvm_libraries/ofb128.bc -check-div-zero=false -check-overshift=false --search=randomsp --output-istats=true --enable-speculative --enable-cachemodel --max-sew=50 --run-in-dir=/tmp/sandbox --simplify-sym-indices --write-cvcs --write-cov --output-module --max-memory=8000 --disable-inlining --optimize --use-forked-solver --use-cex-cache --only-output-states-covering-new --max-instruction-time=30 --max-time=43200 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 --switch-type=internal ./testing_AES_OFB.bc

# Running kleespectre *without cache modelling*
#klee -link-llvm-lib=llvm_libraries/aes_cbc.bc -link-llvm-lib=llvm_libraries/aes_core.bc -link-llvm-lib=llvm_libraries/aes_ctr.bc -link-llvm-lib=llvm_libraries/aes_ecb.bc -link-llvm-lib=llvm_libraries/aes_misc.bc -link-llvm-lib=llvm_libraries/aes_ofb.bc -link-llvm-lib=llvm_libraries/cbc128.bc -link-llvm-lib=llvm_libraries/ctr128.bc -link-llvm-lib=llvm_libraries/ofb128.bc -check-div-zero=false -check-overshift=false --search=randomsp --output-istats=true --enable-speculative --max-sew=50 --run-in-dir=/tmp/sandbox --simplify-sym-indices --write-cvcs --write-cov --output-module --max-memory=8000 --disable-inlining --optimize --use-forked-solver --use-cex-cache --only-output-states-covering-new --max-instruction-time=30 --max-time=43200 --watchdog --max-memory-inhibit=false --max-static-fork-pct=1 --max-static-solve-pct=1 --max-static-cpfork-pct=1 --switch-type=internal ./selected_functions.bc