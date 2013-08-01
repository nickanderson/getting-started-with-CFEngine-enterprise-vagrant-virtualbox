PROJECT=$(shell basename "$(CURDIR)")
DATESTAMP=$(shell date +%Y%m%d%H%M)

default:
	tar --exclude=.vagrant* --exclude=*.gitignore --exclude=*.swp --exclude=makefile --exclude=policyserver.id_rsa --exclude=policyserver.id_rsa.pub --directory ../ --create --gzip --verbose --file ../upload/$(PROJECT)-$(DATESTAMP).tar.gz $(PROJECT)
	zip --exclude \*.gitignore \*makefile \*.vagrant\* \*.swp \*policyserver.id_\* -r ../upload/$(PROJECT)-$(DATESTAMP).zip ../$(PROJECT)
	echo "$(DATESTAMP)" > ../upload/latest_release
	echo "$(DATESTAMP)" > release

#default:
#	git tag "$(DATESTAMP)"
#	tar --exclude=.vagrant* --exclude=*.gitignore --exclude=*.swp --exclude=makefile --exclude=policyserver.id_rsa --exclude=policyserver.id_rsa.pub --directory ../ --create --gzip --verbose --file ../upload/$(PROJECT)-$(DATESTAMP).tar.gz $(PROJECT)
#	zip --exclude \*.gitignore \*makefile \*.vagrant\* \*.swp \*policyserver.id_\* -r ../upload/$(PROJECT)-$(DATESTAMP).zip ../$(PROJECT)
#	echo "$(DATESTAMP)" > ../upload/latest_release
#	echo "$(DATESTAMP)" > release

release:
	sed -i /^RELEASE=.*/RELEASE=$(DATESTAMP) Vagrantfile
	git add Vagrantfile
	git commit -m "Bump Release"
	git tag "$(DATESTAMP)"
	tar --exclude=.vagrant* --exclude=*.gitignore --exclude=*.swp --exclude=makefile --exclude=policyserver.id_rsa --exclude=policyserver.id_rsa.pub --directory ../ --create --gzip --verbose --file ../upload/$(PROJECT)-$(DATESTAMP).tar.gz $(PROJECT)
	zip --exclude \*.gitignore \*makefile \*.vagrant\* \*.swp \*policyserver.id_\* -r ../upload/$(PROJECT)-$(DATESTAMP).zip ../$(PROJECT)
	echo "$(DATESTAMP)" > ../upload/latest_release
	echo "$(DATESTAMP)" > release


clean:
	rm -rf policyserver.id_rsa*
	rm release


