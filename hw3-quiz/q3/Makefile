CC ?= gcc
CFLAGS_common ?= -O0 -Wall -std=gnu99

EXEC = iterative recursive
TEST = test_iterative test_recursive
all: $(EXEC) $(TEST)

# for execution time
iterative: main.c iterative.c binary_tree.o
	$(CC) $(CFLAGS_common) -DNDEBUG -DITERATIVE -o $@ \
		main.c iterative.c binary_tree.o
recursive: main.c recursive.c binary_tree.o
	$(CC) $(CFLAGS_common) -DNDEBUG -DRECURSIVE -o $@ \
		main.c recursive.c binary_tree.o

# for test
test_iterative: main_test.c iterative.c binary_tree.o
	$(CC) $(CFLAGS_common) -DITERATIVE -o $@ \
		main_test.c iterative.c binary_tree.o
test_recursive: main_test.c recursive.c binary_tree.o
	$(CC) $(CFLAGS_common) -DRECURSIVE -o $@ \
		main_test.c recursive.c binary_tree.o

%.o: %.c
	$(CC) $(CFLAGS_common) -c -o $@ $<

run_time: $(EXEC)
	./iterative
	./recursive

run_perf: $(EXEC)
	echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh
	perf stat -r 10 -e cache-misses,cache-references,instructions,cycles ./iterative
	echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh
	perf stat -r 10 -e cache-misses,cache-references,instructions,cycles ./recursive

clean:
	$(RM) $(EXEC) $(TEST) *.o perf.*
