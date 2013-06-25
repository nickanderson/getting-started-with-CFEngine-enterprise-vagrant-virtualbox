PROJECT=$(shell basename "$(CURDIR)")
DATESTAMP=$(shell date +%Y%m%d%H%M)
default:
	git tag "$(DATESTAMP)"
	tar --exclude=.vagrant* --exclude=*.gitignore --exclude=*.swp --exclude=makefile --exclude=policyserver.id_rsa --exclude=policyserver.id_rsa.pub --directory ../ --create --gzip --verbose --file ../$(PROJECT)-$(DATESTAMP).tar.gz $(PROJECT)
	zip --exclude \*.gitignore \*makefile \*.vagrant\* \*.swp \*policyserver.id_\* -r ../$(PROJECT)-$(DATESTAMP).zip ../$(PROJECT)

clean:
	rm -rf policyserver.id_rsa*


