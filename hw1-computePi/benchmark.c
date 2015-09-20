#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "computepi.h"


int main(int argc, char const *argv[])
{   
    time_t start, end;
    int N = atoi(argv[1]);
    int i, loop = 20;

    start = clock();
    for(i = 0; i < loop; i++){
        compute_pi_baseline(N);
    }
    end = clock();
    printf("%lf,", ((double) (end - start)) / CLOCKS_PER_SEC);

    start = clock();
    for(i = 0; i < loop; i++){
        computePi_pi_openmp(N);
    }
    end = clock();
    printf("%lf,", ((double) (end - start)) / CLOCKS_PER_SEC); 

    start = clock();
    for(i = 0; i < loop; i++){
        computePi_pi_avx(N);
    }
    end = clock();
    printf("%lf,", ((double) (end - start)) / CLOCKS_PER_SEC);

    start = clock();
    for(i = 0; i < loop; i++){
        computePi_pi_avx_unroll(N);
    }
    end = clock();
    printf("%lf\n", ((double) (end - start)) / CLOCKS_PER_SEC); 

    return 0;
}