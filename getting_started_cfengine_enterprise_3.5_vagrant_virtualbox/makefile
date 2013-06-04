PROJECT=$(shell basename "$(CURDIR)")
DATESTAMP=$(shell date +%Y%m%d%H%M)
default:
	tar --exclude=.vagrant* --exclude=*.swp --directory ../ --create --gzip --verbose --file ../$(PROJECT)-$(DATESTAMP).tar.gz $(PROJECT)
	zip --exclude \*.vagrant\* \*.swp -r ../$(PROJECT)-$(DATESTAMP).zip ../$(PROJECT)
