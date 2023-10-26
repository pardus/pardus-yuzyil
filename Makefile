SHELL=/bin/bash
all: build

build:
	bash create-xml.sh

install:
	# icons
	mkdir -p $(DESTDIR)/usr/share/icons
	cp -fr pardus-xfce-yuzyil $(DESTDIR)/usr/share/icons/
	cp -fr pardus-xfce-yuzyil-dark $(DESTDIR)/usr/share/icons/
	cp -fr pardus-gnome-yuzyil $(DESTDIR)/usr/share/icons/
	cp -fr pardus-gnome-yuzyil-dark $(DESTDIR)/usr/share/icons/

	# backgrounds
	mkdir -p $(DESTDIR)/usr/share/backgrounds
	mkdir -p $(DESTDIR)/usr/share/gnome-background-properties
	for file in images/* ; do \
		install $$file $(DESTDIR)/usr/share/backgrounds/ ;\
	done
	install pardus-wallpaper-yuzyil.xml $(DESTDIR)/usr/share/gnome-background-properties/

	# assets (preview images)
	mkdir -p $(DESTDIR)/usr/share/pardus/pardus-yuzyil
	for file in assets/* ; do \
		install $$file $(DESTDIR)/usr/share/pardus/pardus-yuzyil/ ;\
	done

	# script
	mkdir -p $(DESTDIR)/usr/bin
	cp -fr pardus-yuzyil $(DESTDIR)/usr/bin/

	# desktop file
	mkdir -p $(DESTDIR)/usr/share/applications
	cp -fr tr.org.pardus.yuzyil.desktop $(DESTDIR)/usr/share/applications/

uninstall:
	rm -fr $(DESTDIR)/usr/share/icons/pardus-xfce-yuzyil
	rm -fr $(DESTDIR)/usr/share/icons/pardus-xfce-yuzyil-dark
	rm -fr $(DESTDIR)/usr/share/icons/pardus-gnome-yuzyil
	rm -fr $(DESTDIR)/usr/share/icons/pardus-gnome-yuzyil-dark

	for file in images/* ; do \
		rm -f $(DESTDIR)/usr/share/backgrounds/$$file ;\
	done
	rm -f $(DESTDIR)/usr/share/gnome-background-properties/pardus-wallpaper-yuzyil.xml

	for file in assets/* ; do \
		rm -f $(DESTDIR)/usr/share/pardus/pardus-yuzyil/$$file ;\
	done

	rm -fr $(DESTDIR)/usr/bin/pardus-yuzyil
	rm -fr $(DESTDIR)/usr/share/applications/tr.org.pardus.yuzyil.desktop
	

.PHONY: install uninstall

