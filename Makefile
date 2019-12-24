PROG = p3wm
PREFIX ?= /usr

.PHONY: doc install

doc: p3wm.8
	@true

p3wm.8:
	asciidoctor -b manpage p3wm.8.adoc

install:
	install -m755 -Dt '$(PREFIX)/bin' bin/p3wm
	install -m644 -Dt '$(PREFIX)/share/man/man8' p3wm.8
	install -m644 -Dt '$(PREFIX)/share/licenses/$(PROG)' LICENSE
