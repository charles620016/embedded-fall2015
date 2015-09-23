CC = gcc
CFLAGS = -O0 -std=gnu99 -Wall -fopenmp -mavx
EXECUTABLE = main benchmark  

default: computepi.o computepi.s
	$(CC) $(CFLAGS) computepi.o main.c -o main
	$(CC) $(CFLAGS) computepi.o benchmark.c -o benchmark

.PHONY: clean default

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@ 

run:
	for i in `seq 1000 5000 2501000`; do \
		printf "%d," $$i;\
		./benchmark $$i; \
	done > result.csv

clean:
	rm -f $(EXECUTABLE) *.o *.s
