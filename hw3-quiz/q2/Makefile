CC ?= gcc
CFLAGS_common ?= -O0 -Wall -std=gnu99

EXEC = iterative recursive 
TEST = test_iterative test_recursive
all: $(EXEC) $(TEST)

iterative: main.c iterative.c
	$(CC) $(CFLAGS_common) -DNDEBUG -DITERATIVE -o $@ main.c iterative.c
recursive: main.c recursive.c
	$(CC) $(CFLAGS_common) -DNDEBUG -DRECURSIVE -o $@ main.c recursive.c

test_iterative: main_test.c iterative.c
	$(CC) $(CFLAGS_common) -DITERATIVE -o $@ main_test.c iterative.c
test_recursive: main_test.c recursive.c
	$(CC) $(CFLAGS_common) -DRECURSIVE -o $@ main_test.c recursive.c

run_perf: $(EXEC)
	echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh
	perf stat -r 10 -e cache-misses,cache-references,instructions,cycles ./iterative
	echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh
	perf stat -r 10 -e cache-misses,cache-references,instructions,cycles ./recursive

run_test: $(TEST)
	@./test_iterative
	@./test_recursive

clean:
	$(RM) $(EXEC) $(TEST) *.o perf.* *.dat
