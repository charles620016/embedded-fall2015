CC ?= gcc
CFLAGS_common ?= -O0 -Wall -std=gnu99

EXEC = phonebook_orig phonebook_opt1 phonebook_opt2 \
	   main_fuzzy main_bktree
all: $(EXEC)

# cache analysis
phonebook_orig: main.c phonebook_orig.c phonebook_orig.h
	$(CC) $(CFLAGS_common) -DORIG -DIMPL="\"$@.h\"" -o $@ main.c $@.c

phonebook_opt1: main.c phonebook_opt1.c phonebook_opt1.h
	$(CC) $(CFLAGS_common) -DOPT1 -DIMPL="\"$@.h\"" -o $@ main.c $@.c

phonebook_opt2: main.c phonebook_opt2.c phonebook_opt2.h
	$(CC) $(CFLAGS_common) -DOPT2 -DIMPL="\"$@.h\"" -o $@ main.c $@.c

# fuzzy search
main_fuzzy: main_fuzzy.c fuzzy_levenshtein.c fuzzy_levenshtein.h
	$(CC) $(CFLAGS_common) -o $@ main_fuzzy.c fuzzy_levenshtein.c

main_bktree: main_bktree.c fuzzy_levenshtein.c fuzzy_levenshtein.h \
 						fuzzy_bktree.c fuzzy_bktree.h
	$(CC) $(CFLAGS_common) -o $@ main_bktree.c fuzzy_levenshtein.c fuzzy_bktree.c

run: $(EXEC)
	@echo 1 > /proc/sys/vm/drop_caches
	./phonebook_orig
	@echo 1 > /proc/sys/vm/drop_caches
	./phonebook_opt1
	@echo 1 > /proc/sys/vm/drop_caches
	./phonebook_opt2

clean:
	$(RM) $(EXEC) *.o perf.* *.out

clean_txt:
	$(RM) *.txt
