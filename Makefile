VERSION ?= 0.0.1

IMG ?= ibmgaragecloud/memcached-operator-catalog:$(VERSION)

BUILDER ?= docker

BUNDLES = $(shell cat bundles.txt | tr '\n' ',' | sed -E 's/,$$//g')

all: image-build image-push

image-build:
	opm index add -c $(BUILDER) --bundles $(BUNDLES) --tag $(IMG)

image-push:
	$(BUILDER) push $(IMG)
