ifeq ($(strip $(PREFIX)),)
  PREFIX = /usr
endif

bindir  = $(DESTDIR)$(PREFIX)/bin
mandir  = $(DESTDIR)$(PREFIX)/share/man/man1
mobinfo = $(bindir)/mobinfo
manpage = $(mandir)/mobinfo.1

.PHONY: all install update uninstall clean test

all:
	@echo Run \'make install\' to install mobinfo.

install:
	@mkdir -p $(bindir) $(mandir)
	@cp -p docs/mobinfo.1 $(manpage)
	@cp -p mobinfo $(mobinfo)
	@chmod 755 $(mobinfo)
	@echo Successfully installed mobinfo.

uninstall:
	@rm -rf $(manpage)*
	@rm -rf $(mobinfo)
	@echo Successfully uninstalled mobinfo.

update:
	@git pull
	@cp -p docs/mobinfo.1 $(manpage)
	@cp -p mobinfo $(mobinfo)
	@chmod 755 $(mobinfo)

clean:
	@git reset --hard HEAD

test:
	@$(mobinfo) -V
