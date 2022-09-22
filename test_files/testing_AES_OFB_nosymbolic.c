#include <stdio.h>
#include <openssl/aes.h>
#include <openssl/modes.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include <openssl/crypto.h>
#include <aes_locl.h>

int main(){
    const unsigned char in[AES_BLOCK_SIZE] = "Hello, world!";
    unsigned char out[sizeof(in)];
    size_t len = sizeof(in);
    const unsigned char key[] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55,
        0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF};
    AES_KEY aes_key;
    unsigned char ivec[AES_BLOCK_SIZE];

    // holds the state information in a form of the number of bytes used out of the total block size.
    int *num=0;

    AES_set_encrypt_key(key, 128, &aes_key);

    AES_ofb128_encrypt((const unsigned char *) in, out, len,
        (const AES_KEY *) &aes_key, ivec, num);
}
