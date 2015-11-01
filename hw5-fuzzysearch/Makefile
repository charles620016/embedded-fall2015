CC ?= gcc
CFLAGS_common ?= -O0 -Wall -std=gnu99

EXEC = main_fuzzy main_bktree

all: $(EXEC)

main_fuzzy: main_fuzzy.c fuzzy_levenshtein.c fuzzy_levenshtein.h
	$(CC) $(CFLAGS_common) -o $@ main_fuzzy.c fuzzy_levenshtein.c

main_bktree: main_bktree.c fuzzy_levenshtein.c fuzzy_levenshtein.h \
 						fuzzy_bktree.c fuzzy_bktree.h
	$(CC) $(CFLAGS_common) -o $@ main_bktree.c fuzzy_levenshtein.c fuzzy_bktree.c

clean:
	rm -f $(EXEC) *.o perf.* *.out

clean_txt:
	$(RM) *.txt
