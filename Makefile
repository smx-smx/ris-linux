CC      ?= gcc
CFLAGS  ?= -Wall -O2 -g

SRCS    = binlsrv.c
OBJS    = binlsrv.o
BINS    = minibinl

BINDIR  = /usr/bin
SBINDIR = /usr/sbin

all: $(BINS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

minibinl: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

install:
	install -m 0755 minibinl $(DESTDIR)$(SBINDIR)/minibinl
	install -m 0755 binlsrv.py $(DESTDIR)$(SBINDIR)/binl
	install -m 0755 infdump.py $(DESTDIR)$(BINDIR)/infdump
	install -m 0755 infparse.py $(DESTDIR)$(BINDIR)/infparse

clean:
	-rm -rf $(OBJS) $(BINS)
