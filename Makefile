CONFIG      ?= config.make
CONFIG_USER ?= config.user.make

include $(CONFIG)
-include $(CONFIG_USER)

SHELL                          := /bin/sh
SOURCES                         = $(filter-out %~,$(shell find $(SRC)/ -type f))
STAGED                         := $(patsubst $(SRC)/%,$(STAGE)/%,$(SOURCES))

all : check

check : lintian

clean :
	$(RM) $(STAGE) *.deb

deb : $(DEB)

dump-%:
	@echo $*=$($*)

lintian : $(DEB)
	$(LINTIAN) $(LINTIAN_FLAGS) $(DEB)

stage : $(STAGED)

.PHONY : all check clean deb dump-% lintian stage

$(DEB) : $(STAGED)
	$(DPKG-DEB) $(DPKG-DEB_FLAGS) --build $(STAGE) $@

$(STAGE) :
	$(MKDIR) $@

$(STAGE)/% : $(SRC)/%
	$(MKDIR) $(dir $@)
	$(CP) $< $@
