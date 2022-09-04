#!/bin/sh

# Creating temp folder
mkdir -p /tmp/sandbox

# Building external libraries
clang -g -c -emit-llvm openssl/crypto/aes/aes_cbc.c -o llvm_libraries/aes_cbc.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/modes/cbc128.c -o llvm_libraries/cbc128.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/aes/aes_core.c -o llvm_libraries/aes_core.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/aes/aes_ctr.c -o llvm_libraries/aes_ctr.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/modes/aes/ctr128.c -o llvm_libraries/ctr128.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/aes/aes_ofb.c -o llvm_libraries/aes_ofb.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/modes/aes/ofb128.c -o llvm_libraries/ofb128.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/aes/aes_ecb.c -o llvm_libraries/aes_ecb.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/aes/aes_misc.c -o llvm_libraries/aes_misc.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/aes/aes_wrap.c -o llvm_libraries/aes_wrap.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
