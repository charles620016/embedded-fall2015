#include <stdio.h>
#include <immintrin.h>
#include <omp.h>
#include "computepi.h"

double compute_pi_baseline(size_t N)
{
    double pi = 0.0;
    double dt = 1.0 / N;                // dt = (b-a)/N, b = 1, a = 0
    for (size_t i = 0; i < N; i++) {
        double x = (double) i / N;      // x = ti = a+(b-a)*i/N = i/N
        pi += dt / (1.0 + x * x);       // integrate 1/(1+x^2), i = 0....N
    }
    return pi * 4.0;
}

double computePi_pi_openmp(size_t N){
    double pi = 0.0;
    double dt = 1.0 / N;
    double x;

    #pragma omp parallel num_threads(omp_get_max_threads()) 
    {
        #pragma omp for private(x) reduction(+:pi)
        for (size_t i = 0; i < N; i++) {
            x = (double) i / N;
            pi += dt / (1.0 + x * x);
        }
    }
    return pi * 4.0;    
}

double computePi_pi_openmp_v2(size_t N){
    double pi[4] = 0.0;
    double dt = 1.0 / N;
    double x;

    #pragma omp parallel num_threads(omp_get_max_threads()) 
    {   
        #pragma omp sections
        {
            #pragma omp for private(x) reduction(+:pi)
            for (size_t i = 0; i < N/4; i++) {
                x = (double) i / N;
                pi += dt / (1.0 + x * x);
            }
        }
    }
    return pi * 4.0;    
}
 
double computePi_pi_avx(size_t N)
{
    double pi = 0.0;
    double dt = 1.0 / N;
    register __m256d ymm0, ymm1, ymm2, ymm3, ymm4;                                                                          
    ymm0 = _mm256_set1_pd(1.0);
    ymm1 = _mm256_set1_pd(dt);
    ymm2 = _mm256_set_pd(dt * 3, dt * 2, dt * 1, 0.0);
    ymm4 = _mm256_setzero_pd();

    for (int i = 0; i <= N - 4; i += 4) {
        ymm3 = _mm256_set1_pd(i * dt);
        ymm3 = _mm256_add_pd(ymm3, ymm2);
        ymm3 = _mm256_mul_pd(ymm3, ymm3);
        ymm3 = _mm256_add_pd(ymm0, ymm3);
        ymm3 = _mm256_div_pd(ymm1, ymm3);
        ymm4 = _mm256_add_pd(ymm4, ymm3);
    }
    double tmp[4] __attribute__((aligned(32)));
    _mm256_store_pd(tmp, ymm4);
    pi += tmp[0] + tmp[1] + tmp[2] + tmp[3];

    return pi * 4.0;
}