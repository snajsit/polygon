DPKG-DEB       ?= dpkg-deb
DPKG-DEB_FLAGS ?= -v
SHELL          := /bin/sh
LINTIAN        ?= lintian

arch    ?= all
deb      = $(name)_$(version)_$(arch).deb
name    ?= polygon
src     ?= src
version ?= 0.0.0

all : check

check : lintian

clean :
	$(RM) $(deb)

deb : $(deb)

lintian : $(deb)
	$(LINTIAN) $(deb)

.PHONY : all check clean deb lintian

$(deb) :
	$(DPKG-DEB) $(DPKG-DEB_FLAGS) --build $(src) $@
