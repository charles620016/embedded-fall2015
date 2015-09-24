#include <stdio.h>
#include <time.h>
#include <omp.h>
#include "computepi.h"

int main()
{   
    struct timespec start = {0, 0};
    struct timespec end = {0, 0};
    int N = 300000000;
    double pi;
    printf("N = %d\n", N);

    clock_gettime(CLOCK_MONOTONIC, &start);
    pi = compute_pi_baseline(N);
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "Baseline verison: ", (double) (end.tv_sec - start.tv_sec)
                                + (end.tv_nsec - start.tv_nsec)/1000000000.0);

    clock_gettime(CLOCK_MONOTONIC, &start);
    pi = compute_pi_openmp(N, 2);
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "Openmp verison(2 threads): ", (double) (end.tv_sec - start.tv_sec)
                                + (end.tv_nsec - start.tv_nsec)/1000000000.0);

    clock_gettime(CLOCK_MONOTONIC, &start);
    pi = compute_pi_openmp(N, 4);
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "Openmp verison(4 threads): ", (double) (end.tv_sec - start.tv_sec)
                                + (end.tv_nsec - start.tv_nsec)/1000000000.0);

    clock_gettime(CLOCK_MONOTONIC, &start);
    pi = compute_pi_avx(N);
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "AVX verison: ", (double) (end.tv_sec - start.tv_sec)
                                + (end.tv_nsec - start.tv_nsec)/1000000000.0);

    clock_gettime(CLOCK_MONOTONIC, &start);
    pi = compute_pi_avx_unroll(N);
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "AVX+unroll verison: ", (double) (end.tv_sec - start.tv_sec)
                                + (end.tv_nsec - start.tv_nsec)/1000000000.0);
    return 0;
}