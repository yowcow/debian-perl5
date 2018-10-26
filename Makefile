REGISTORY := yowcow/debian-perl5

VERSIONS := \
	stretch-5.10.1 \
	buster-5.10.1 \
	stretch-5.16.3 \
	buster-5.16.3

DOCKERFILES := $(foreach ver,$(VERSIONS),$(ver)/Dockerfile)
BUILDTARGETS := $(foreach ver,$(VERSIONS),build-$(ver))

all: $(DOCKERFILES)

build:
	$(MAKE) -j 8 $(BUILDTARGETS)

build-%: %/Dockerfile
	cd $* && docker build -t $(REGISTORY):$* .

debug-%:
	docker run --rm -it $(REGISTORY):$* bash

stretch-%/Dockerfile: debian-stretch-perl5.Dockerfile
	mkdir -p $(@D)
	cat $< | sed -e 's/##PERL_VERSION##/$*/g' > $@

buster-%/Dockerfile: debian-buster-perl5.Dockerfile
	mkdir -p $(@D)
	cat $< | sed -e 's/##PERL_VERSION##/$*/g' > $@

.PHONY: all build build-* debug-*
