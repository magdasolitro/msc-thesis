#!/bin/sh

# Creating temp folder
mkdir -p /tmp/sandbox

# Building external libraries
clang -g -c -emit-llvm openssl/crypto/aes/aes_cbc.c -o llvm_libraries/aes_cbc.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/modes/cbc128.c -o llvm_libraries/cbc128.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
clang -g -c -emit-llvm openssl/crypto/aes/aes_core.c -o llvm_libraries/aes_core.bc -I/home/klee/klee_src/include -I/home/klee/shareddir/openssl/include/openssl -I/home/klee/shareddir/openssl/crypto/aes
