CC = gcc
CFLAGS = -O0 -std=gnu99 -Wall -fopenmp -mavx
EXECUTABLE = main_clock main_clock_gettime benchmark_clock benchmark_clock_gettime

default: computepi.o
	$(CC) $(CFLAGS) computepi.o main_clock.c -o main_clock
	$(CC) $(CFLAGS) computepi.o main_clock_gettime.c -o main_clock_gettime
	$(CC) $(CFLAGS) computepi.o benchmark_clock.c -o benchmark_clock
	$(CC) $(CFLAGS) computepi.o benchmark_clock_gettime.c -o benchmark_clock_gettime


.PHONY: clean default

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@ 

run_clock:
	for i in `seq 100 5000 2501000`; do \
		printf "%d," $$i;\
		./benchmark_clock $$i; \
	done > result_clock.csv

run_clock_gettime:
	for i in `seq 100 5000 2501000`; do \
		printf "%d," $$i;\
		./benchmark_clock_gettime $$i; \
	done > result_clock_gettime.csv	

clean:
	rm -f $(EXECUTABLE) *.o *.s
