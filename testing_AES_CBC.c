#include <stdio.h>
#include <openssl/aes.h>
#include <openssl/modes.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include <openssl/crypto.h>
#include <openssl/aes.h>
#include <klee/klee.h>
#include "aes_local.h"

int main(){
    char *in = "Hello, world!";
    unsigned char out[128];
    size_t len = sizeof(in);
    const unsigned char key[] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};;
    AES_KEY *aes_key;
    unsigned char ivec[16];

    klee_make_symbolic(&ivec, sizeof(ivec), "ivec");

    AES_set_encrypt_key(key, 128, aes_key);

    AES_cbc_encrypt((const unsigned char *) in, out, len, 
        (const AES_KEY *) aes_key, ivec, (block128_f) AES_encrypt);
}