NAME=tracery-lattice
VERSION=0.1.0
TAG=${NAME}:${VERSION}
TARBALL=${NAME}.${VERSION}.tar

image: get_consul
	docker build -t ${TAG} .

tarball: image
	docker save -o ${TARBALL} ${TAG}

get_consul:
	./download_consul.sh

.PHONY:

clean: rmi
	-rm consul
	-rm consul*.zip
	-rm ${TARBALL}

rmi:
	-docker rmi -f ${TAG}
