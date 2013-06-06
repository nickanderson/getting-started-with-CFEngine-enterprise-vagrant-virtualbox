PROJECT=$(shell basename "$(CURDIR)")
DATESTAMP=$(shell date +%Y%m%d%H%M)
default:
	tar --exclude=.vagrant* --exclude=*.swp --exclude=policyserver.id_rsa --exclude=policyserver.id_rsa.pub --directory ../ --create --gzip --verbose --file ../$(PROJECT)-$(DATESTAMP).tar.gz $(PROJECT)
	zip --exclude \*.vagrant\* \*.swp \*policyserver.id_\* -r ../$(PROJECT)-$(DATESTAMP).zip ../$(PROJECT)
