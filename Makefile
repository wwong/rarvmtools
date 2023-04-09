# Add -DNEEDS_STRCHRNUL to end of CFLAGS if necessary
CFLAGS	= -ggdb3 -O0 -std=gnu99 -DNEEDS_STRCHRNUL -Wall
LDFLAGS	= $(CFLAGS)
LDLIBS = -lz
RARAS	= ./raras
RARLD	= ./rarld
UNRAR4  = ./unrar4

%.ri: %.rs
	cpp -Istdlib < $< > $@

%.ro: %.ri
	$(RARAS) -o $@ $<

%.rar: %.ro
	$(RARLD) $< > $@

all:   raras rarld unrar4 sample.rar test
rarld: rarld.o bitbuffer.o
raras: strchrnul.o parser.o raras.o bitbuffer.o
bitbuffer_test: bitbuffer_test.o bitbuffer.o

test: bitbuffer_test rarld raras unrar4
	./bitbuffer_test
	make -C test all

clean:
	rm -f *.o raras rarld *_test *.ri *.ro *.rar unrar4
	make -C test clean
	make -C unrar -f makefile.unix clean

unrar4:
	make -C unrar -f makefile.unix unrar
	mv ./unrar/unrar unrar4
