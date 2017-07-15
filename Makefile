CONFIG      ?= config.make
CONFIG_USER ?= config.user.make

include $(CONFIG)
-include $(CONFIG_USER)

SHELL := /bin/sh

all : check

check : lintian

clean :
	$(RM) *.deb

deb : $(DEB)

lintian : $(DEB)
	$(LINTIAN) $(LINTIAN_FLAGS) $(DEB)

.PHONY : all check clean deb lintian

$(DEB) :
	$(DPKG-DEB) $(DPKG-DEB_FLAGS) --build $(SRC) $@
