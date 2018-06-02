RMF=rm -f
EXE=pkg2-hello
PREFIX=
PATSHOME_SUFFIX=

build:
	$(CC) -o $(EXE) pkg2-hello.c

install:
	install -D -m555 -T $(EXE) $(PREFIX)/bin/$(EXE)
	mkdir -p $(PREFIX)/$(PATSHOME_SUFFIX)/contrib/pkg2
	cp pkg2-message.sats $(PREFIX)/$(PATSHOME_SUFFIX)/contrib/pkg2/

clean:
	$(RMF) $(EXE)
	$(RMF) result
