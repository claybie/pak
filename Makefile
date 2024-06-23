install:
	@install -Dm755 "pak" "$(DESTDIR)/usr/bin/pak"

uninstall:
	@rm "$(DESTDIR)/usr/bin/pak"
