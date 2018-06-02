RMF=rm -f
EXE=pkg1-hello
PREFIX=
PATSHOME_SUFFIX=

build:
	$(CC) -o $(EXE) pkg1-hello.c

install:
	install -D -m555 -T $(EXE) $(PREFIX)/bin/$(EXE)
	mkdir -p $(PREFIX)/$(PATSHOME_SUFFIX)/contrib/pkg1
	cp pkg1-message.sats $(PREFIX)/$(PATSHOME_SUFFIX)/contrib/pkg1/

clean:
	$(RMF) $(EXE)
	$(RMF) result
