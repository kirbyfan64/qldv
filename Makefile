DESTDIR=
PREFIX=usr/local

INSTALL=install
MRKD=mrkd

.PHONY: install man html site

all:
	# Use 'make install' to install qldv.

install:
	$(INSTALL) -Dm 755 qldv $(DESTDIR)/$(PREFIX)/bin/qldv
	$(INSTALL) -Dm 644 doc/qldv.1 $(DESTDIR)/$(PREFIX)/share/man/man1/qldv.1
	# Run 'mandb' to refresh the man database.

uninstall:
	rm $(DESTDIR)/$(PREFIX)/bin/qldv
	rm $(DESTDIR)/$(PREFIX)/share/man/man1/qldv.1

doc/qldv.1: doc/qldv.1.md
	$(MRKD) $< $@

doc/qldv.1.html: doc/qldv.1.md doc/index.ini
	$(MRKD) -index doc/index.ini -format html $< $@

man: doc/qldv.1
html: doc/qldv.1.html

site: html
	[ -d site ] || git clone https://github.com/kirbyfan64/qldv.git -b gh-pages site
	cp doc/qldv.1.html site/
	ln -sf qldv.1.html site/index.html
