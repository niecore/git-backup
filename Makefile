PREFIX = /usr/local

.PHONY: install
install: git-backup
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/git-backup

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/git-backup

