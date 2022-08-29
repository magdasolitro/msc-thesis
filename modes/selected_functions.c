#include "modes.h"
#include <string.h>
#include <klee/klee.h>

#ifndef MODES_DEBUG
# ifndef NDEBUG
#  define NDEBUG
# endif
#endif
#include <assert.h>

#define STRICT_ALIGNMENT 1
#if defined(__i386) || defined(__i386__) || \
    defined(__x86_64) || defined(__x86_64__) || \
    defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || \
    defined(__s390__) || defined(__s390x__)
# undef STRICT_ALIGNMENT
# define STRICT_ALIGNMENT 0
#endif


// encryption function for mode of operation CBC
void CRYPTO_cbc128_encrypt(const unsigned char *in, unsigned char *out,
                           size_t len, const void *key,
                           unsigned char ivec[16], block128_f block)
{
    size_t n;
    const unsigned char *iv = ivec;

    assert(in && out && key && ivec);

#if !defined(OPENSSL_SMALL_FOOTPRINT)
    if (STRICT_ALIGNMENT &&
        ((size_t)in | (size_t)out | (size_t)ivec) % sizeof(size_t) != 0) {
        while (len >= 16) {
            for (n = 0; n < 16; ++n)
                out[n] = in[n] ^ iv[n];
            (*block) (out, out, key);
            iv = out;
            len -= 16;
            in += 16;
            out += 16;
        }
    } else {
        while (len >= 16) {
            for (n = 0; n < 16; n += sizeof(size_t))
                *(size_t *)(out + n) =
                    *(size_t *)(in + n) ^ *(size_t *)(iv + n);
            (*block) (out, out, key);
            iv = out;
            len -= 16;
            in += 16;
            out += 16;
        }
    }
#endif
    while (len) {
        for (n = 0; n < 16 && n < len; ++n)
            out[n] = in[n] ^ iv[n];
        for (; n < 16; ++n)
            out[n] = iv[n];
        (*block) (out, out, key);
        iv = out;
        if (len <= 16)
            break;
        len -= 16;
        in += 16;
        out += 16;
    }
    memcpy(ivec, iv, 16);
}


// decryption function for mode of operation CBC
void CRYPTO_cbc128_decrypt(const unsigned char *in, unsigned char *out,
                           size_t len, const void *key,
                           unsigned char ivec[16], block128_f block)
{
    size_t n;
    union {
        size_t t[16 / sizeof(size_t)];
        unsigned char c[16];
    } tmp;

    assert(in && out && key && ivec);

#if !defined(OPENSSL_SMALL_FOOTPRINT)
    if (in != out) {
        const unsigned char *iv = ivec;

        if (STRICT_ALIGNMENT &&
            ((size_t)in | (size_t)out | (size_t)ivec) % sizeof(size_t) != 0) {
            while (len >= 16) {
                (*block) (in, out, key);
                for (n = 0; n < 16; ++n)
                    out[n] ^= iv[n];
                iv = in;
                len -= 16;
                in += 16;
                out += 16;
            }
        } else if (16 % sizeof(size_t) == 0) { /* always true */
            while (len >= 16) {
                size_t *out_t = (size_t *)out, *iv_t = (size_t *)iv;

                (*block) (in, out, key);
                for (n = 0; n < 16 / sizeof(size_t); n++)
                    out_t[n] ^= iv_t[n];
                iv = in;
                len -= 16;
                in += 16;
                out += 16;
            }
        }
        memcpy(ivec, iv, 16);
    } else {
        if (STRICT_ALIGNMENT &&
            ((size_t)in | (size_t)out | (size_t)ivec) % sizeof(size_t) != 0) {
            unsigned char c;
            while (len >= 16) {
                (*block) (in, tmp.c, key);
                for (n = 0; n < 16; ++n) {
                    c = in[n];
                    out[n] = tmp.c[n] ^ ivec[n];
                    ivec[n] = c;
                }
                len -= 16;
                in += 16;
                out += 16;
            }
        } else if (16 % sizeof(size_t) == 0) { /* always true */
            while (len >= 16) {
                size_t c, *out_t = (size_t *)out, *ivec_t = (size_t *)ivec;
                const size_t *in_t = (const size_t *)in;

                (*block) (in, tmp.c, key);
                for (n = 0; n < 16 / sizeof(size_t); n++) {
                    c = in_t[n];
                    out_t[n] = tmp.t[n] ^ ivec_t[n];
                    ivec_t[n] = c;
                }
                len -= 16;
                in += 16;
                out += 16;
            }
        }
    }
#endif
    while (len) {
        unsigned char c;
        (*block) (in, tmp.c, key);
        for (n = 0; n < 16 && n < len; ++n) {
            c = in[n];
            out[n] = tmp.c[n] ^ ivec[n];
            ivec[n] = c;
        }
        if (len <= 16) {
            for (; n < 16; ++n)
                ivec[n] = in[n];
            break;
        }
        len -= 16;
        in += 16;
        out += 16;
    }
}

// =============================================================================

// encryption function for mode of operation CFB
void CRYPTO_cfb128_encrypt(const unsigned char *in, unsigned char *out,
                           size_t len, const void *key,
                           unsigned char ivec[16], int *num,
                           int enc, block128_f block)
{
    unsigned int n;
    size_t l = 0;

    assert(in && out && key && ivec && num);

    n = *num;

    if (enc) {
#if !defined(OPENSSL_SMALL_FOOTPRINT)
        if (16 % sizeof(size_t) == 0) { /* always true actually */
            do {
                while (n && len) {
                    *(out++) = ivec[n] ^= *(in++);
                    --len;
                    n = (n + 1) % 16;
                }
# if defined(STRICT_ALIGNMENT)
                if (((size_t)in | (size_t)out | (size_t)ivec) %
                    sizeof(size_t) != 0)
                    break;
# endif
                while (len >= 16) {
                    (*block) (ivec, ivec, key);
                    for (; n < 16; n += sizeof(size_t)) {
                        *(size_t *)(out + n) =
                            *(size_t *)(ivec + n) ^= *(size_t *)(in + n);
                    }
                    len -= 16;
                    out += 16;
                    in += 16;
                    n = 0;
                }
                if (len) {
                    (*block) (ivec, ivec, key);
                    while (len--) {
                        out[n] = ivec[n] ^= in[n];
                        ++n;
                    }
                }
                *num = n;
                return;
            } while (0);
        }
        /* the rest would be commonly eliminated by x86* compiler */
#endif
        while (l < len) {
            if (n == 0) {
                (*block) (ivec, ivec, key);
            }
            out[l] = ivec[n] ^= in[l];
            ++l;
            n = (n + 1) % 16;
        }
        *num = n;
    } else {
#if !defined(OPENSSL_SMALL_FOOTPRINT)
        if (16 % sizeof(size_t) == 0) { /* always true actually */
            do {
                while (n && len) {
                    unsigned char c;
                    *(out++) = ivec[n] ^ (c = *(in++));
                    ivec[n] = c;
                    --len;
                    n = (n + 1) % 16;
                }
# if defined(STRICT_ALIGNMENT)
                if (((size_t)in | (size_t)out | (size_t)ivec) %
                    sizeof(size_t) != 0)
                    break;
# endif
                while (len >= 16) {
                    (*block) (ivec, ivec, key);
                    for (; n < 16; n += sizeof(size_t)) {
                        size_t t = *(size_t *)(in + n);
                        *(size_t *)(out + n) = *(size_t *)(ivec + n) ^ t;
                        *(size_t *)(ivec + n) = t;
                    }
                    len -= 16;
                    out += 16;
                    in += 16;
                    n = 0;
                }
                if (len) {
                    (*block) (ivec, ivec, key);
                    while (len--) {
                        unsigned char c;
                        out[n] = ivec[n] ^ (c = in[n]);
                        ivec[n] = c;
                        ++n;
                    }
                }
                *num = n;
                return;
            } while (0);
        }
        /* the rest would be commonly eliminated by x86* compiler */
#endif
        while (l < len) {
            unsigned char c;
            if (n == 0) {
                (*block) (ivec, ivec, key);
            }
            out[l] = ivec[n] ^ (c = in[l]);
            ivec[n] = c;
            ++l;
            n = (n + 1) % 16;
        }
        *num = n;
    }
}


// subroutine
/*
 * This expects a single block of size nbits for both in and out. Note that
 * it corrupts any extra bits in the last byte of out
 */
static void cfbr_encrypt_block(const unsigned char *in, unsigned char *out,
                               int nbits, const void *key,
                               unsigned char ivec[16], int enc,
                               block128_f block)
{
    int n, rem, num;
    unsigned char ovec[16 * 2 + 1]; /* +1 because we dererefence (but don't
                                     * use) one byte off the end */

    if (nbits <= 0 || nbits > 128)
        return;

    /* fill in the first half of the new IV with the current IV */
    memcpy(ovec, ivec, 16);
    /* construct the new IV */
    (*block) (ivec, ivec, key);
    num = (nbits + 7) / 8;
    if (enc)                    /* encrypt the input */
        for (n = 0; n < num; ++n)
            out[n] = (ovec[16 + n] = in[n] ^ ivec[n]);
    else                        /* decrypt the input */
        for (n = 0; n < num; ++n)
            out[n] = (ovec[16 + n] = in[n]) ^ ivec[n];
    /* shift ovec left... */
    rem = nbits % 8;
    num = nbits / 8;
    if (rem == 0)
        memcpy(ivec, ovec + num, 16);
    else
        for (n = 0; n < 16; ++n)
            ivec[n] = ovec[n + num] << rem | ovec[n + num + 1] >> (8 - rem);

    /* it is not necessary to cleanse ovec, since the IV is not secret */
}

/* N.B. This expects the input to be packed, MS bit first */
void CRYPTO_cfb128_1_encrypt(const unsigned char *in, unsigned char *out,
                             size_t bits, const void *key,
                             unsigned char ivec[16], int *num,
                             int enc, block128_f block)
{
    size_t n;
    unsigned char c[1], d[1];

    assert(in && out && key && ivec && num);
    assert(*num == 0);

    for (n = 0; n < bits; ++n) {
        c[0] = (in[n / 8] & (1 << (7 - n % 8))) ? 0x80 : 0;
        cfbr_encrypt_block(c, d, 1, key, ivec, enc, block);
        out[n / 8] = (out[n / 8] & ~(1 << (unsigned int)(7 - n % 8))) |
            ((d[0] & 0x80) >> (unsigned int)(n % 8));
    }
}

void CRYPTO_cfb128_8_encrypt(const unsigned char *in, unsigned char *out,
                             size_t length, const void *key,
                             unsigned char ivec[16], int *num,
                             int enc, block128_f block)
{
    size_t n;

    assert(in && out && key && ivec && num);
    assert(*num == 0);

    for (n = 0; n < length; ++n)
        cfbr_encrypt_block(&in[n], &out[n], 8, key, ivec, enc, block);
}

size_t CRYPTO_cts128_encrypt_block(const unsigned char *in,
                                   unsigned char *out, size_t len,
                                   const void *key, unsigned char ivec[16],
                                   block128_f block)
{
    size_t residue, n;

    assert(in && out && key && ivec);

    if (len <= 16)
        return 0;

    if ((residue = len % 16) == 0)
        residue = 16;

    len -= residue;

    CRYPTO_cbc128_encrypt(in, out, len, key, ivec, block);

    in += len;
    out += len;

    for (n = 0; n < residue; ++n)
        ivec[n] ^= in[n];
    (*block) (ivec, ivec, key);
    memcpy(out, out - 16, residue);
    memcpy(out - 16, ivec, 16);

    return len + residue;
}

size_t CRYPTO_cts128_encrypt(const unsigned char *in, unsigned char *out,
                             size_t len, const void *key,
                             unsigned char ivec[16], cbc128_f cbc)
{
    size_t residue;
    union {
        size_t align;
        unsigned char c[16];
    } tmp;

    assert(in && out && key && ivec);

    if (len <= 16)
        return 0;

    if ((residue = len % 16) == 0)
        residue = 16;

    len -= residue;

    (*cbc) (in, out, len, key, ivec, 1);

    in += len;
    out += len;

#if defined(CBC_HANDLES_TRUNCATED_IO)
    memcpy(tmp.c, out - 16, 16);
    (*cbc) (in, out - 16, residue, key, ivec, 1);
    memcpy(out, tmp.c, residue);
#else
    memset(tmp.c, 0, sizeof(tmp));
    memcpy(tmp.c, in, residue);
    memcpy(out, out - 16, residue);
    (*cbc) (tmp.c, out - 16, 16, key, ivec, 1);
#endif
    return len + residue;
}

size_t CRYPTO_cts128_decrypt_block(const unsigned char *in,
                                   unsigned char *out, size_t len,
                                   const void *key, unsigned char ivec[16],
                                   block128_f block)
{
    size_t residue, n;
    union {
        size_t align;
        unsigned char c[32];
    } tmp;

    assert(in && out && key && ivec);

    if (len <= 16)
        return 0;

    if ((residue = len % 16) == 0)
        residue = 16;

    len -= 16 + residue;

    if (len) {
        CRYPTO_cbc128_decrypt(in, out, len, key, ivec, block);
        in += len;
        out += len;
    }

    (*block) (in, tmp.c + 16, key);

    memcpy(tmp.c, tmp.c + 16, 16);
    memcpy(tmp.c, in + 16, residue);
    (*block) (tmp.c, tmp.c, key);

    for (n = 0; n < 16; ++n) {
        unsigned char c = in[n];
        out[n] = tmp.c[n] ^ ivec[n];
        ivec[n] = c;
    }
    for (residue += 16; n < residue; ++n)
        out[n] = tmp.c[n] ^ in[n];

    return len + residue - 16;
}

size_t CRYPTO_cts128_decrypt(const unsigned char *in, unsigned char *out,
                             size_t len, const void *key,
                             unsigned char ivec[16], cbc128_f cbc)
{
    size_t residue;
    union {
        size_t align;
        unsigned char c[32];
    } tmp;

    assert(in && out && key && ivec);

    if (len <= 16)
        return 0;

    if ((residue = len % 16) == 0)
        residue = 16;

    len -= 16 + residue;

    if (len) {
        (*cbc) (in, out, len, key, ivec, 0);
        in += len;
        out += len;
    }

    memset(tmp.c, 0, sizeof(tmp));
    /*
     * this places in[16] at &tmp.c[16] and decrypted block at &tmp.c[0]
     */
    (*cbc) (in, tmp.c, 16, key, tmp.c + 16, 0);

    memcpy(tmp.c, in + 16, residue);
#if defined(CBC_HANDLES_TRUNCATED_IO)
    (*cbc) (tmp.c, out, 16 + residue, key, ivec, 0);
#else
    (*cbc) (tmp.c, tmp.c, 32, key, ivec, 0);
    memcpy(out, tmp.c, 16 + residue);
#endif
    return len + residue;
}

void CRYPTO_ofb128_encrypt(const unsigned char *in, unsigned char *out,
                           size_t len, const void *key,
                           unsigned char ivec[16], int *num, block128_f block)
{
    unsigned int n;
    size_t l = 0;

    assert(in && out && key && ivec && num);

    n = *num;

#if !defined(OPENSSL_SMALL_FOOTPRINT)
    if (16 % sizeof(size_t) == 0) { /* always true actually */
        do {
            while (n && len) {
                *(out++) = *(in++) ^ ivec[n];
                --len;
                n = (n + 1) % 16;
            }
# if defined(STRICT_ALIGNMENT)
            if (((size_t)in | (size_t)out | (size_t)ivec) % sizeof(size_t) !=
                0)
                break;
# endif
            while (len >= 16) {
                (*block) (ivec, ivec, key);
                for (; n < 16; n += sizeof(size_t))
                    *(size_t *)(out + n) =
                        *(size_t *)(in + n) ^ *(size_t *)(ivec + n);
                len -= 16;
                out += 16;
                in += 16;
                n = 0;
            }
            if (len) {
                (*block) (ivec, ivec, key);
                while (len--) {
                    out[n] = in[n] ^ ivec[n];
                    ++n;
                }
            }
            *num = n;
            return;
        } while (0);
    }
    /* the rest would be commonly eliminated by x86* compiler */
#endif
    while (l < len) {
        if (n == 0) {
            (*block) (ivec, ivec, key);
        }
        out[l] = in[l] ^ ivec[n];
        ++l;
        n = (n + 1) % 16;
    }

    *num = n;
}


int main(){
    const unsigned char in[] = "Hello, world! This is my message.";
    unsigned char out[50];
    size_t len = strlen(in);
    const AES_KEY key[] = "23FB14354E5C5B89FC4FC90C436D64BE";
    unsigned char ivec[16] = "77D4792347637A19CCB2A6F74B101B22";

    klee_make_symbolic(&ivec, sizeof(ivec), "ivec");
    CRYPTO_cbc128_encrypt(in, out, len, key, ivec, (block128_f) AES_encrypt);
}
