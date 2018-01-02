PREFIX=/usr/local

.PHONY: install ronn

all:
	# Use 'make install' to install qldv.

install:
	install -Dm 755 qldv $(PREFIX)/bin/qldv
	install -Dm 644 doc/qldv.1 $(PREFIX)/share/man/man1/qldv.1
	# Run 'mandb' to refresh the man database.

ronn:
	ronn doc/qldv.ronn

site: ronn
	[ -d site ] || git clone https://github.com/kirbyfan64/qldv.git -b gh-pages site
	cp doc/qldv.1.html site/
	ln -sf qldv.1.html site/index.html
