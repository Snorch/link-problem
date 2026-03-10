There is a problem when employing the `-flto=auto -Wl,--as-needed -Wl,--wrap=` flags together on older gcc.

On gcc-14.2.1-7.vl10.x86_64 and ld from binutils-2.41-53.vl10.x86_64, I see:

```
# make bad
cc -flto=auto -Wl,--as-needed -Wl,--wrap=test_function -o bad main.c second.c
/usr/bin/ld: /tmp/cce147Pz.ltrans0.ltrans.o: in function `main':
<artificial>:(.text+0x63): undefined reference to `__wrap_test_function'
collect2: error: ld returned 1 exit status
make: *** [Makefile:12: bad] Error 1

# make good
cc -Wl,--wrap=test_function -o good main.c second.c
```

Make "bad" with flto and as-needed flags fails, where "good" without them works fine.

I don't see this on newer gcc-15.2.1-7.fc43.x86_64 and ld from binutils-2.45.1-4.fc43.x86_64.
