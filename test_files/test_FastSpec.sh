#!/bin/bash

# Setting bash as "if it throws an error, abort right now and don't go on with the script"
# to make sure you're not looking at analysis from previous file binaries version
set -euo pipefail

# Compile needed libraries
gcc ./openssl/crypto/aes/aes_cbc.c ./openssl/crypto/aes/aes_core.c ./openssl/crypto/modes/cbc128.c testing_AES_CBC_nosymbolic.c -o testing_AES_CBC_nosymbolic.o -I/srv/shared/openssl -I/srv/shared/openssl/crypto -I/srv/shared/openssl/crypto/aes
gcc ./openssl/crypto/aes/aes_ofb.c ./openssl/crypto/aes/aes_core.c ./openssl/crypto/modes/ofb128.c testing_AES_OFB_nosymbolic.c -o testing_AES_OFB_nosymbolic.o -I/srv/shared/openssl -I/srv/shared/openssl/crypto -I/srv/shared/openssl/crypto/aes
gcc ./openssl/crypto/aes/aes_ctr.c ./openssl/crypto/aes/aes_core.c ./openssl/crypto/modes/ctr128.c testing_AES_CTR_nosymbolic.c -o testing_AES_CTR_nosymbolic.o -I/srv/shared/openssl -I/srv/shared/openssl/crypto -I/srv/shared/openssl/crypto/aes
