CPPFLAGS	= -I../stdlib
RARAS		= ../raras
RARLD		= ../rarld
UNRAR4          = ../unrar4

%.ri: %.rs
	cpp $(CPPFLAGS) < $< > $@

%.ro: %.ri
	$(RARAS) -o $@ $<

%.rar: %.ro
	$(RARLD) $< > $@

all:   helloworld.rar crc32.rar bswap.rar mod.rar bitorder.rar vectormatch.rar \
       vectorrow.rar compensate.rar operands.rar fib.rar
	test "$$($(UNRAR4) p -inul helloworld.rar)" = "Hello, World!"
	test "$$($(UNRAR4) p -inul crc32.rar)" = "OK"
	test "$$($(UNRAR4) p -inul bswap.rar)" = "OK"
	test "$$($(UNRAR4) p -inul mod.rar)" = "OK"
	test "$$($(UNRAR4) p -inul bitorder.rar)" = "OK"
	test "$$($(UNRAR4) p -inul vectormatch.rar)" = "OK"
	test "$$($(UNRAR4) p -inul compensate.rar)" = "OK"
	test "$$($(UNRAR4) p -inul vectorrow.rar)" = "OK"
	test "$$($(UNRAR4) p -inul operands.rar)" = "OK"
	test "$$($(UNRAR4) p -inul fib.rar)" = "OK"
clean:
	rm -f *.ri *.ro *.rar
