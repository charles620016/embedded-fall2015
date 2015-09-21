#include <stdio.h>
#include <time.h>
#include <omp.h>
#include "computepi.h"

int main()
{   
    clock_t start, end;
    double pi;
    int N = 3000000000;
    printf("N = %d , max threads = %d\n", N, omp_get_max_threads());

    start = clock();
    pi = compute_pi_baseline(N);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%20s%lf sec\n", "Baseline verison: ", ((double) (end - start)) / CLOCKS_PER_SEC);

    start = clock();
    pi = computePi_pi_openmp(N);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%20s%lf sec\n", "Openmp verison: ",((double) (end - start)) / CLOCKS_PER_SEC);

    start = clock();
    pi = computePi_pi_avx(N);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%20s%lf sec\n", "AVX verison: ", ((double) (end - start)) / CLOCKS_PER_SEC);

    start = clock();
    pi = computePi_pi_avx_unroll(N);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%20s%lf sec\n", "AVX+unroll verison: ", ((double) (end - start)) / CLOCKS_PER_SEC);

    return 0;
}