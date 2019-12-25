PROG = p3wm
PREFIX ?= /usr/local

.PHONY: doc install clean

doc: p3wm.8
	@true

p3wm.8:
	asciidoctor -b manpage p3wm.8.adoc

install:
	install -m755 -Dt '$(PREFIX)/bin' bin/p3wm
	install -m644 -Dt '$(PREFIX)/share/man/man8' p3wm.8
	install -m644 -Dt '$(PREFIX)/share/licenses/$(PROG)' LICENSE

clean:
	rm p3wm.8

# This only pushes p3wm-git.
# PKGBUILD for release version is maintained at: https://github.com/5long/pkgbuilds/tree/master/p3wm
push-to-aur:
	git subtree push -P makepkg ssh://aur@aur.archlinux.org/p3wm-git.git master
