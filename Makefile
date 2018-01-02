DESTDIR=
PREFIX=usr/local

.PHONY: install ronn

all:
	# Use 'make install' to install qldv.

install:
	install -Dm 755 qldv $(DESTDIR)/$(PREFIX)/bin/qldv
	install -Dm 644 doc/qldv.1 $(DESTDIR)/$(PREFIX)/share/man/man1/qldv.1
	# Run 'mandb' to refresh the man database.

uninstall:
	rm $(DESTDIR)/$(PREFIX)/bin/qldv
	rm $(DESTDIR)/$(PREFIX)/share/man/man1/qldv.1

ronn:
	ronn doc/qldv.ronn

site: ronn
	[ -d site ] || git clone https://github.com/kirbyfan64/qldv.git -b gh-pages site
	cp doc/qldv.1.html site/
	ln -sf qldv.1.html site/index.html
