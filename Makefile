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
