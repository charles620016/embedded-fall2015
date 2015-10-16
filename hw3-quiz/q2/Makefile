CC ?= gcc
CFLAGS_common ?= -O0 -Wall -std=gnu99 -DNDEBUG 

EXEC = iterative recursive
all: $(EXEC)

iterative: main.c iterative.c
	$(CC) $(CFLAGS_common) -DITERATIVE -o $@ main.c iterative.c

recursive: main.c recursive.c
	$(CC) $(CFLAGS_common) -DRECURSIVE -o $@ main.c recursive.c

run_perf: $(EXEC)
	echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh
	perf stat -e cache-misses,cache-references,instructions,cycles ./iterative
	echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh
	perf stat -e cache-misses,cache-references,instructions,cycles ./recursive

clean:
	$(RM) $(EXEC) *.o perf.* *.dat
