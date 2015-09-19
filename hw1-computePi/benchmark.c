#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "computepi.h"


int main(int argc, char const *argv[])
{   
    time_t start, end;
    int N = atoi(argv[1]);

    start = clock();
    compute_pi_baseline(N);
    end = clock();
    printf("%lf,", ((double) (end - start)) / CLOCKS_PER_SEC);

    start = clock();
    computePi_pi_openmp(N);
    end = clock();
    printf("%lf,", ((double) (end - start)) / CLOCKS_PER_SEC); 

    start = clock();
    computePi_pi_avx(N);
    end = clock();
    printf("%lf\n", ((double) (end - start)) / CLOCKS_PER_SEC); 

    return 0;
}