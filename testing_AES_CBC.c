#include <stdio.h>
#include <openssl/aes.h>
#include <openssl/modes.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include <openssl/crypto.h>
#include <openssl/aes.h>
#include <klee/klee.h>
#include "aes_locl.h"

int my_strlen(char *string){
    int len = 0;

    for(int i = 0; string[i] != '\0'; i++){
        len++;
    }

    return len;
}

int main(){
    char *in = "Hello, world! This is my secret message.";
    unsigned char out[128];
    size_t len = my_strlen(in);
    static const unsigned char key[] = {
        0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
        0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff,
    };
    const AES_KEY *aes_key;
    unsigned char ivec[16];

    klee_make_symbolic(&ivec, sizeof(ivec), "ivec");

    AES_set_encrypt_key(key, 128, aes_key);

    AES_cbc_encrypt((const unsigned char *) in, out, len, aes_key, ivec, (block128_f) AES_encrypt);
}