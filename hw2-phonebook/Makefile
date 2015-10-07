CC ?= gcc
CFLAGS_common ?= -O0 -Wall -std=gnu99

EXEC = phonebook_orig phonebook_opt1 phonebook_opt2
all: $(EXEC)

SRCS_common = main.c

phonebook_orig: $(SRCS_common) phonebook_orig.c phonebook_orig.h
	$(CC) $(CFLAGS_common) -DORIG -DIMPL="\"$@.h\"" -o $@ $(SRCS_common) $@.c

phonebook_opt1: $(SRCS_common) phonebook_opt1.c phonebook_opt1.h
	$(CC) $(CFLAGS_common) -DOPT1 -DIMPL="\"$@.h\"" -o $@ $(SRCS_common) $@.c

phonebook_opt2: $(SRCS_common) phonebook_opt2.c phonebook_opt2.h
	$(CC) $(CFLAGS_common) -DOPT2 -DIMPL="\"$@.h\"" -o $@ $(SRCS_common) $@.c

run: $(EXEC)
	@echo 1 > /proc/sys/vm/drop_caches
	./phonebook_orig
	@echo 1 > /proc/sys/vm/drop_caches
	./phonebook_opt1
	@echo 1 > /proc/sys/vm/drop_caches
	./phonebook_opt2

clean:
	$(RM) $(EXEC) *.o perf.*
clean_txt:
	$(RM) *.txt
