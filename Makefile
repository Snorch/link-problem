all: bad good
PHONY: all clean

CFLAGS_GOOD = -Wl,--wrap=test_function

good: main.c
	$(CC) $(CFLAGS_GOOD) -o good main.c second.c

CFLAGS_BAD = -flto=auto -Wl,--as-needed -Wl,--wrap=test_function

bad: main.c
	$(CC) $(CFLAGS_BAD) -o bad main.c second.c

clean:
	rm -f bad good

