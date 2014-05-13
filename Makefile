# $Id: Makefile,v 1.6 2008/10/29 01:01:35 ghantoos Exp $
#

PYTHON=`which python`
DESTDIR=/
PROJECT=snakefire
VERSION=1.0.5
BUILDIR=debian/$(PROJECT)-$(VERSION)

all:
		@echo "make install - Install on local system"
		@echo "make buildsrc - Create source package"
		@echo "make builddeb - Generate a deb package"
		@echo "make clean - Get rid of scratch and byte files"

install:
		$(PYTHON) setup.py install --root $(DESTDIR) $(COMPILE)

buildsrc:
		# Cleaning
		make clean
		# Create folder structure
		mkdir -p $(BUILDIR)
		mkdir $(BUILDIR)/bin
		mkdir $(BUILDIR)/desktop
		mkdir -p $(BUILDIR)/resources/icons
		mkdir $(BUILDIR)/resources/icons/16x16
		mkdir $(BUILDIR)/resources/icons/22x22
		mkdir $(BUILDIR)/resources/icons/32x32
		mkdir $(BUILDIR)/resources/icons/48x48
		mkdir $(BUILDIR)/resources/icons/64x64
		mkdir $(BUILDIR)/resources/icons/128x128
		# Copy files
		cp -R builds/debian $(BUILDIR)/
		cp -R bin $(BUILDIR)/
		cp snakefire -R $(BUILDIR)/
		cp resources/icons/snakefire-16.png $(BUILDIR)/resources/icons/16x16/snakefire.png
		cp resources/icons/snakefire-22.png $(BUILDIR)/resources/icons/22x22/snakefire.png
		cp resources/icons/snakefire-32.png $(BUILDIR)/resources/icons/32x32/snakefire.png
		cp resources/icons/snakefire-48.png $(BUILDIR)/resources/icons/48x48/snakefire.png
		cp resources/icons/snakefire-64.png $(BUILDIR)/resources/icons/64x64/snakefire.png
		cp resources/icons/snakefire-128.png $(BUILDIR)/resources/icons/128x128/snakefire.png
		cp packaging/linux/cricava-snakefire.desktop $(BUILDIR)/desktop/snakefire.desktop
		cp LICENSE $(BUILDIR)/
		# Generating source files
		cd $(BUILDIR) && tar cfJ $(PROJECT)_$(VERSION).orig.tar.xz *
		mv $(BUILDIR)/$(PROJECT)_$(VERSION).orig.tar.xz debian/
		cd $(BUILDIR) && debuild -S

builddeb:
		# Build the package
		cd $(BUILDIR) && debuild

clean:
		rm -Rf debian

testdeb:
		lintian -Ivi debian/*.deb
