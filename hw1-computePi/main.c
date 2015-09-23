#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <omp.h>
#include "computepi.h"

int main()
{   
    struct timespec start = {0, 0};
    struct timespec end = {0, 0};
    int N = 300000000;
    double pi;
    printf("N = %d , max threads = %d\n", N, omp_get_max_threads());


    clock_gettime(CLOCK_MONOTONIC, &start);
    pi = computePi_pi_openmp(N);
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("pi = %.10lf , ", pi);
    printf("%20s%lf sec\n", "Openmp verison: ",(double)   (end.tv_sec - start.tv_sec)
                                +(double) (end.tv_nsec - start.tv_nsec)/1000000000.0);

    clock_gettime(CLOCK_MONOTONIC, &start);
    pi = computePi_pi_avx(N);
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("pi = %.10lf , ", pi);
    printf("%20s%lf sec\n", "AVX verison: ", (double)  (end.tv_sec - start.tv_sec)
                                + (end.tv_nsec - start.tv_nsec)/1000000000.0);

    clock_gettime(CLOCK_MONOTONIC, &start);
    pi = computePi_pi_avx_unroll(N);
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("pi = %.10lf , ", pi);
    printf("%20s%lf sec\n", "AVX+unroll verison: ", (double) (end.tv_sec - start.tv_sec)
                                + (end.tv_nsec - start.tv_nsec)/1000000000.0);
    return 0;
}