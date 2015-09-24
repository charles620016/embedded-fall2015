#include <stdio.h>
#include <time.h>
#include <omp.h>
#include "computepi.h"

int main()
{   
    clock_t start, end;
    int N = 300000000;
    double pi;
    printf("N = %d\n", N);

    start = clock();
    pi = compute_pi_baseline(N);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "Baseline verison: ", (double) (end - start)/CLOCKS_PER_SEC);

    start = clock();
    pi = compute_pi_openmp(N, 2);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "Openmp verison(2 threads): ", (double) (end - start)/CLOCKS_PER_SEC);

    start = clock();
    pi = compute_pi_openmp(N, 4);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "Openmp verison(4 threads): ", (double) (end - start)/CLOCKS_PER_SEC);

    start = clock();
    pi = compute_pi_avx(N);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "AVX verison: ", (double) (end - start)/CLOCKS_PER_SEC);

    start = clock();
    pi = compute_pi_avx_unroll(N);
    end = clock();
    printf("pi = %.10lf , ", pi);
    printf("%28s%lf sec\n", "AVX+unroll verison: ", (double) (end - start)/CLOCKS_PER_SEC);
    return 0;
}