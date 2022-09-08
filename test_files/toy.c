#include <stdint.h>

unsigned int array1_size = 16; 
uint8_t array1[16];
uint8_t array2[256 * 64];
uint8_t temp = 0;


uint8_t victim_fun(int idx)
{
    int y = 0;
    if (idx < array1_size) {    
        y = array1[idx];
        temp &= array2[y*64];
    }   

    /* This two lines disable the compiler optimization of array */
    array2[0] = 2;  
    array1[0] = 2;
    return temp;
}

int main() {
    int source = 20; 
    victim_fun(source);
    return 0;
}